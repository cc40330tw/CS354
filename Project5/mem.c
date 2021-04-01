/******************************************************************************
 * FILENAME: mem.c
 * AUTHOR:   wum@cs.wisc.edu < Mark Wu>
 * DATE:     04 AUG 2020
 * PROVIDES: Contains a set of library functions for memory allocation
 * *****************************************************************************/

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include "mem.h"

int fit;

/* this structure serves as the header for each block */
typedef struct block_hd{
  /* The blocks are maintained as a linked list */
  /* The blocks are ordered in the increasing order of addresses */
  struct block_hd* next;

  /* size of the block is always a multiple of 4 */
  /* ie, last two bits are always zero - can be used to store other information*/
  /* LSB = 0 => free block */
  /* LSB = 1 => allocated/busy block */

  /* So for a free block, the value stored in size_status will be the same as the block size*/
  /* And for an allocated block, the value stored in size_status will be one more than the block size*/

  /* The value stored here does not include the space required to store the header */

  /* Example: */
  /* For a block with a payload of 24 bytes (ie, 24 bytes data + an additional 8 bytes for header) */
  /* If the block is allocated, size_status should be set to 25, not 24!, not 23! not 32! not 33!, not 31! */
  /* If the block is free, size_status should be set to 24, not 25!, not 23! not 32! not 33!, not 31! */
  int size_status;

}block_header;

/* Global variable - This will always point to the first block */
/* ie, the block with the lowest address */
block_header* list_head = NULL;


/* Function used to Initialize the memory allocator */
/* Not intended to be called more than once by a program */
/* Argument - sizeOfRegion: Specifies the size of the chunk which needs to be allocated 
   	      policy: indicates the policy to use eg: best fit is 0*/
/* Returns 0 on success and -1 on failure */
int Mem_Init(int sizeOfRegion,  int policy)
{
  int pagesize;
  int padsize;
  int fd;
  int alloc_size;
  void* space_ptr;
  static int allocated_once = 0;
  
  if(0 != allocated_once)
  {
    fprintf(stderr,"Error:mem.c: Mem_Init has allocated space during a previous call\n");
    return -1;
  }
  if(sizeOfRegion <= 0)
  {
    fprintf(stderr,"Error:mem.c: Requested block size is not positive\n");
    return -1;
  }

  /* Get the pagesize */
  pagesize = getpagesize();

  /* Calculate padsize as the padding required to round up sizeOfRegion to a multiple of pagesize */
  padsize = sizeOfRegion % pagesize;
  padsize = (pagesize - padsize) % pagesize;

  alloc_size = sizeOfRegion + padsize;

  /* Using mmap to allocate memory */
  fd = open("/dev/zero", O_RDWR);
  if(-1 == fd)
  {
    fprintf(stderr,"Error:mem.c: Cannot open /dev/zero\n");
    return -1;
  }
  space_ptr = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
  if (MAP_FAILED == space_ptr)
  {
    fprintf(stderr,"Error:mem.c: mmap cannot allocate space\n");
    allocated_once = 0;
    return -1;
  }
  
  allocated_once = 1;
  
  /* To begin with, there is only one big, free block */
  list_head = (block_header*)space_ptr;
  list_head->next = NULL;
  /* Remember that the 'size' stored in block size excludes the space for the header */
  list_head->size_status = alloc_size - (int)sizeof(block_header);
  fit = policy;
  return 0;
}


/* Function for testing if the block is valid. */
/* Returns 1 if valid, otherwise 0*/
int isValid (void* mem){
  int ret=0;
  block_header* header=NULL; // block header of  memory
  block_header* block_next=list_head; //next block in list
  if (mem && block_next)
  {
    header=(block_header*)((char*)mem - sizeof (block_header)); //Get the block header
    while (block_next){
      if (block_next == header) //Find the block which contains mem
      {
        ret=1;
        break;
      }
      block_next=block_next->next; //Next loop
    }
  }
  return ret;
}

// Function for testing if the block is free
// Returns 1 if free, otherwise 0
int isFree (block_header* block){
  if (block)
    return (!(block->size_status & 1));//check the least significant bit if 1
  return 0;
}

// Function to set block free
void setFree (block_header* block){
  if (block)
    block->size_status &= ~1;//set the least significant bit to 0
}

// Function to set block busy
void setBusy (block_header* block){
  if (block)
    block->size_status |= 1;
}
/* Function to set block allocated. split the block when necessary*/
/* block : the block to be allocated*/
/* size_alloc : the size of the block*/
/* size_remain : the size for the next block*/
void setAllocated (block_header* block,int size_alloc,int size_remain){
  block_header* temp=NULL,* block_new=NULL;
  if (block){
    if (size_remain >= (int)sizeof (block_header) + 4){//There's enough space for holding the header and 4 bytes more

      temp=block->next; //Get the next block
      block_new=(block_header*)((char*)block + (int)sizeof (*block) + size_alloc); //Construct the next block header
      block_new->next=temp; //Set next pointer
      block_new->size_status=size_remain - (int)sizeof (block_header); //Set size of the new block
      setFree (block_new); //Set free flag
      block->next=block_new; //Set next block
    }
    block->size_status=size_alloc; //Set block size
    setBusy (block); //Set busy flag
  }
}

/* Function for allocating 'size' bytes. */
/* Returns address of allocated block on success */
/* Returns NULL on failure */
/* Here is what this function should accomplish */
/* - Check for sanity of size - Return NULL when appropriate */
/* - Round up size to a multiple of 4 */
/* - Traverse the list of blocks and allocate the best free block which can accommodate the requested size */
/* -- Also, when allocating a block - split it into two blocks when possible */
/* Tips: Be careful with pointer arithmetic */
void* Mem_Alloc (int size){
  int size_alloc=size,size_remain=0,size_fit=0;
  void* mem_ret=NULL;
  block_header* block_next=list_head,* block_fit=NULL;
    
  if(size>0x7FFFFFFF){//extreme case
        return NULL;
  }
    
  if ((0 < size) && list_head){
    size_alloc = 4 * ((size / 4) + ((size % 4)?1:0)); //Round the size to times of 4
    if (1 == fit){ //first fit
    
      while (block_next){
        if (isFree (block_next) && (size_alloc <= block_next->size_status)){ //Find the first available block which can hold the size of memory
        
          size_remain = block_next->size_status - size_alloc; //Get the remaining size
          setAllocated (block_next,size_alloc,size_remain); // set allocated
          mem_ret=(void*)(block_next + 1); //Returned memory is just after the block header
          break;
        }
        block_next=block_next->next; //Get next block of the list
      }
    }
    else{ //0:best fit,2:worst fit
    
      while (block_next){
        if (isFree (block_next) && (size_alloc <= block_next->size_status)){ //Get the available block
        
          size_remain=block_next->size_status - size_alloc; //Get the spare size of current block
          if ((!block_fit) || ((size_remain > size_fit) && (2 == fit)) || ((size_remain < size_fit) && (0 == fit))){//default block, worst fit:get the max size, best fit:get the min size
          
            size_fit=size_remain;
            block_fit=block_next; //Find the block
          }
        }
        block_next=block_next->next;
      }
      if (block_fit){
        setAllocated (block_fit,size_alloc,size_fit); //Allocate block
        mem_ret=(void*)(block_fit + 1); //Calculate the address for return
      }
    }
  }
  return mem_ret;
}

/* Function for freeing up a previously allocated block */
/* Argument - ptr: Address of the block to be freed up */
/* Returns 0 on success */
/* Returns -1 on failure */
/* Here is what this function should accomplish */
/* - Return -1 if ptr is NULL */
/* - Return -1 if ptr is not pointing to the first byte of a busy block */
/* - Mark the block as free */
/* - Coalesce if one or both of the immediate neighbours are free */
int Mem_Free (void* ptr){
  int ret=-1;
  block_header* block_free=NULL;
  block_header* block_prev=list_head,* block_next=NULL;
  if (ptr){
    block_free=(block_header*)((char*)ptr - sizeof (block_header)); //Block header lies before the buffer
    if ((isValid (ptr)) && (!isFree (block_free))){
      setFree (block_free); //Free the block
      if (block_free->next && isFree (block_free->next)){ //The next block is also free
      
        block_free->size_status+=block_free->next->size_status + sizeof (block_header); //Update size of the block
        block_next=block_free->next->next;
        block_free->next=block_next; //Set the next block pointer
      }
      while (block_prev){
        if (block_prev->next == block_free){ //Get the previous block
        
          if (isFree (block_prev)){ //The previous block is free
          
            block_prev->size_status+=block_free->size_status + sizeof (block_header); //Update the size
            block_next=block_free->next;
            block_prev->next=block_next; //Set the next block pointer
          }
          break;
        }
        block_prev=block_prev->next;
      }
      ret=0;
    }
  }
  return ret;
}

/* Function to be used for debug */
/* Prints out a list of all the blocks along with the following information for each block */
/* No.      : Serial number of the block */
/* Status   : free/busy */
/* Begin    : Address of the first useful byte in the block */
/* End      : Address of the last byte in the block */
/* Size     : Size of the block (excluding the header) */
/* t_Size   : Size of the block (including the header) */
/* t_Begin  : Address of the first byte in the block (this is where the header starts) */
void Mem_Dump()
{
  int counter;
  block_header* current = NULL;
  char* t_Begin = NULL;
  char* Begin = NULL;
  int Size;
  int t_Size;
  char* End = NULL;
  int free_size;
  int busy_size;
  int total_size;
  char status[5];

  free_size = 0;
  busy_size = 0;
  total_size = 0;
  current = list_head;
  counter = 1;
  fprintf(stdout,"************************************Block list***********************************\n");
  fprintf(stdout,"No.\tStatus\tBegin\t\tEnd\t\tSize\tt_Size\tt_Begin\n");
  fprintf(stdout,"---------------------------------------------------------------------------------\n");
  while(NULL != current)
  {
    t_Begin = (char*)current;
    Begin = t_Begin + (int)sizeof(block_header);
    Size = current->size_status;
    strcpy(status,"Free");
    if(Size & 1) /*LSB = 1 => busy block*/
    {
      strcpy(status,"Busy");
      Size = Size - 1; /*Minus one for ignoring status in busy block*/
      t_Size = Size + (int)sizeof(block_header);
      busy_size = busy_size + t_Size;
    }
    else
    {
      t_Size = Size + (int)sizeof(block_header);
      free_size = free_size + t_Size;
    }
    End = Begin + Size;
    fprintf(stdout,"%d\t%s\t0x%08lx\t0x%08lx\t%d\t%d\t0x%08lx\n",counter,status,(unsigned long int)Begin,
           (unsigned long int)End,Size,t_Size,(unsigned long int)t_Begin);
    total_size = total_size + t_Size;
    current = current->next;
    counter = counter + 1;
  }
  fprintf(stdout,"---------------------------------------------------------------------------------\n");
  fprintf(stdout,"*********************************************************************************\n");

  fprintf(stdout,"Total busy size = %d\n",busy_size);
  fprintf(stdout,"Total free size = %d\n",free_size);
  fprintf(stdout,"Total size = %d\n",busy_size+free_size);
  fprintf(stdout,"*********************************************************************************\n");
  fflush(stdout);
  return;
}




