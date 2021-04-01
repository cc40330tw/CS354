/*
 *Courese:CS354
 *Name:Mark Wu
 *NetID:hwu378@wisc.edu
 *
 *Project1
 * */




#include <stdio.h>

// avoid hardcoding with numeric constants for array lengths
#define MAX_BINARY_STRING_LENGTH 33
#define MAX_HEXADECIMAL_STRING_LENGTH 9

// function declarations (prototypes)
// do not change these
int Get_Number_From_User();
void Convert_Number_To_Binary(const int num,char *binary);
void Convert_Number_To_Hexadecimal(const int num, const char *binary, char *hexadecimal);

// you do not need to change main
// feel free to add additional printf statments while debugging 
// but remove them before submitting
// this is know as scaffolding and can be helpful when debugging
int main () {
    int num;
    char binary[MAX_BINARY_STRING_LENGTH];
    char hexadecimal[MAX_HEXADECIMAL_STRING_LENGTH] ;
    
    num = Get_Number_From_User();
    if (num > 0) { 
        Convert_Number_To_Binary(num, binary);
        Convert_Number_To_Hexadecimal(num, binary, hexadecimal);
        printf("num = %d\tbinary = %s\thexadecimal = 0x%s\n",num, binary, hexadecimal);
    }
    return 0;
}

int Get_Number_From_User() {
    printf("Enter a positive integer: \n");
    int n;
    scanf("%d",&n);
    return n;
}

void Convert_Number_To_Binary(const int num,char *binary) {
    for(int i = 0; i < 32; i++) {
        int shift = num >> i; //shift the current bit value of remainder i bits
        // printf("i: %d, %d \n", i,  (shift) );

        //If shift is greater than 0, then remainder is divisible by 2^i
        if( (shift & 1) > 0) {
                binary[32-i-1] = '1';
        }
        else
                binary[32-i-1] = '0';
        //printf("i:%d, 32-i-1:%d\n", i, (32-i-1));
    }

    //printf("%c, %c", binary[0], binary[31]);

    binary[32] = '\0';
}

//references: https://stackoverflow.com/questions/62506361/shifting-gives-a-1-at-the-most-significant-digit


void Convert_Number_To_Hexadecimal(const int num, const char *binary, char *hexadecimal) {
    
       int num2 = num;
       int index = 0;
       while(num2 !=  0){
           int remain  = 0;
           remain = num2 % 16;
       if(remain>=10){
           hexadecimal[index] = (char) (remain + 55);
           index++;
       }else{
           hexadecimal[index] = (char) (remain + 48) ;
           index++;
           }
       num2 = num2 / 16;
       }
       hexadecimal[index] = '\0';
       int length = index;
       for(int j = 0;j < length / 2 ;j++){
           char temp = hexadecimal[j];
           hexadecimal[j] = hexadecimal[index-1];
           hexadecimal[index-1] = temp;
           index--;
       }
}
