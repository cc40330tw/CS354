///////////////////////////////////////////////////////////////////////////////
// Title:            P3-LinkedList
// Files:            mylist.c
// Semester:         summer 2020
//
// Author: Mark Wu
// CS Login: wum@best-linux.cs.wisc.edu
//////////////////////////// 80 columns wide //////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_INTS 1000
#define MAX_STRL 65535

const char *USAGE = "Usage: ./mylist <-i|-d> <OUTPUT_FILE> <FILE>...";
const char *BADFILE = "ERROR: unable to process file %s\n";
const char *LSTRECV = "LIST CONTENT AS OF FILE %s: %s\n";
const char *ORIGLST = "ORIGINAL LIST: %s\n";
const char *SORTEDLST = "SORTED LIST: %s\n";

typedef struct node {
    int data;
    struct node *next;
} node_t;

char *list_to_string(node_t *head) {
    char *s = calloc(MAX_STRL, sizeof(char));
    if (head->next == NULL) {
        strcat(s, "Linked List is Empty.");
    } else {
        node_t *curr = head->next;
        strcat(s, "head->");
        while (curr != NULL) {
            char tempstr[12];
            sprintf(tempstr, "|%d|->", curr->data);//print as string
            strcat(s, tempstr);
            curr = curr->next;
        }
        strcat(s, "NULL");
    }
    return s;
}

void insert(node_t *head, int data) {
    if(head!=NULL){
        node_t *new_node = malloc(sizeof(node_t));
        new_node->data = data;
        new_node->next = head->next;
        head->next = new_node;
    }
}

ssize_t build_list_from_file(node_t *head, const char *filename) {
    ssize_t numints = 0;//signed size_t
    FILE *fin=fopen(filename, "r");
    if(fin==NULL){
       printf(BADFILE,filename);
        return -1;
    }
    ssize_t read;
    size_t len = 0;
    char *token;
    char * line = NULL;
    const char tok[2] = "|";
    while ((read = getline(&line, &len, fin)) != -1){
        //printf("%s\n",line);
        token = strtok(line, tok);
        while (token != NULL){
            if(strlen(token) > 1){
                numints++;
                insert(head,atoi(token));
            }
            token = strtok(NULL, tok);
        }
    }
    // printf("abcdabcdabcd\n");
    fclose(fin);
    return numints;
}

void list_to_array(int *integers, node_t *head) {
    head = head->next;
    int i = -1;
    while (head != NULL){
        integers[++i] = head->data;
        head = head->next;
    }
    return;
}

int qsort_inc(const void *p1, const void *p2) {
    return *((int *)p1) > *(int *)p2;
}

int qsort_dec(const void *p1, const void *p2) {
    return *((int *)p1) < *(int *)p2;
}
void array_to_list(node_t *head, int *integers, size_t len) 
{
    for(int i=0;i<len;i++){
        node_t *tmp = malloc(sizeof(node_t));
        tmp->data = integers[i];
        tmp->next = NULL;
        head->next = tmp;
        head = tmp;
    }
    return;
}

int write_to_file(const char *filename, node_t *orighead, node_t *newhead) {
    // printf("ORIGINAL LIST: %s\n",list_to_string(orighead));
    // printf("SORTED LIST: %s\n",list_to_string(newhead));
    FILE *fp = fopen(filename, "w");
    if(fp == NULL){
        //printf(BADFILE,filename);
        printf("%s\n",BADFILE);
        return -1;
    }
    fputs("ORIGINAL LIST: ",fp);
    fputs(list_to_string(orighead),fp);
    fputs("\n",fp);
    fputs("SORTED LIST: ",fp);
    fputs(list_to_string(newhead),fp);
    fputs("\n",fp);
    fclose(fp);
    return 0;
}

//Usage: ./mylist <-i|-d> <OUTPUT_FILE> <FILE>...
int main(int argc, char *argv[]) {
    node_t head = {.data = 0, .next = NULL};
    // Verify and process command line arguments
    if(argc < 4){
        printf("%s\n",USAGE);
        return -1;
    }
    int mode = 0;
    if(strcmp(argv[1],"-i") == 0){
        mode = 1;
    }
    else if(strcmp(argv[1],"-d") == 0){
        mode = 2;
    }
    else{
        printf("%s\n",USAGE);
        return -1;
    }
    // Read from files and generate a list
    int fileNum = (argc-3);
    int total = 0;
    for(int i=0;i<fileNum;i++){
        int len = build_list_from_file(&head,argv[i+3]);
        if(len>0){
            total += len;
            printf(LSTRECV,argv[i+3],list_to_string(&head));
        }
    }
   
    // Convert the list to an array
    int *arrs = (int *)malloc(total*sizeof(int));
    list_to_array(arrs,&head);
    node_t *orighead = malloc(sizeof(node_t));
    array_to_list(orighead,arrs,total);

    // Sort the array
    if(mode == 1){
        qsort(arrs,total,sizeof(int),qsort_inc);
    }
    else if(mode == 2){
        qsort(arrs,total,sizeof(int),qsort_dec);
    }

    // Convert the sorted array to a new list
    node_t *newhead = malloc(sizeof(node_t));
    array_to_list(newhead,arrs,total);
    // Write both lists to an output file
    write_to_file(argv[2],orighead,newhead);
    return 0;
}


