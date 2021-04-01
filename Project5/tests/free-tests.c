/******************************************************************************
* FILENAME: mem.c
* AUTHOR:   wum@cs.wisc.edu < Mark Wu>
* DATE:     04 AUG 2020
* PROVIDES: Contains a set of library functions for memory allocation
* *****************************************************************************/

/* test Mem_Free after Mem_Alloc, and bad pointers for calling Mem_Free*/
#include <assert.h>
#include <stdlib.h>
#include "mem.h"

int main() {
   void* ptr[4];
   assert(Mem_Init(4096,0) == 0); /*Init*/

   /*Rounding alloc test*/
   ptr[0] = Mem_Alloc(1);
   assert (ptr[0] != NULL);

   /*Memory writing test*/
   *((char*)(ptr[0]))='a';
   assert ('a' == *((char*)(ptr[0])));
   
   /*Normal free test*/
   assert(Mem_Free(ptr[0]) == 0);

   /*Bad pointer*/
   assert(Mem_Free(NULL) == -1);

   /*Bad memory*/
   assert(Mem_Free((void*)0x123456) == -1);

   /*Memory coalesce testing*/
   ptr[0] = Mem_Alloc(7);
   assert (ptr[0] != NULL);
   ptr[1] = Mem_Alloc(2000);
   assert (ptr[1] != NULL);
   ptr[2] = Mem_Alloc(905);
   assert (ptr[2] != NULL);
   ptr[3] = Mem_Alloc(1000);
   assert (ptr[3] != NULL);

   /*Test coalesce upper neighbor*/
   assert(Mem_Free(ptr[0]) == 0);
   assert(Mem_Free(ptr[1]) == 0);
   ptr[0] = Mem_Alloc(2008);
   assert (ptr[0] != NULL);

   assert(Mem_Free(ptr[0]) == 0);

   /*Test coalesce lower neighbor*/
   assert(Mem_Free(ptr[3]) == 0);

   /*Test coalesce both neighbors*/
   assert(Mem_Free(ptr[2]) == 0);
   ptr[0] = Mem_Alloc(4000);
   assert (ptr[0] != NULL);
   /*Mem_Dump ();*/

   /*Alloc 0 bytes*/
   ptr[0] = Mem_Alloc(0);
   assert (ptr[0] == NULL);

   /*Alloc -1 bytes*/
   ptr[0] = Mem_Alloc(-1);
   assert (ptr[0] == NULL);

   /*Alloc max 2^31 - 1 bytes*/
   ptr[0] = Mem_Alloc(0x7fffffff);
   assert (ptr[0] != NULL);
    
   /*Allocate 2^32 */
   ptr[0] = Mem_Alloc(0x80000000);
   assert (ptr[0] == NULL);


   exit(0);
}
