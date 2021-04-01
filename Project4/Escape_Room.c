///////////////////////////////////////////////////////////////////////////////
// Title:            P4-Escape_Room
// Files:            Escape_Room.c
// Semester:         summer 2020
//
// Author: Mark Wu
// CS Login: wum@best-linux.cs.wisc.edu
//////////////////////////// 80 columns wide //////////////////////////////////


#include <stdio.h>

int Is_Number_Correct (int n1,int n2,int n){
    int nRet=0;
    if (n1 == n2){
        printf ("Number %d: Correct. Nice Job.\n",n);
        nRet=1;
    }
    
    else{
        printf ("Number %d: Incorrect\n",n);
        nRet=0;
    }
    
    return nRet;
}

int f0 (){
    return 136182;
}

int f1 (){
    int nRet=0;
    int n1=28069447;//4
    int n2=159934;//8
    int n3=131022;//c
    int n4=206829;//10
    if (n1 <= n2 + n3){ //comp n1-(n2+n3) less equal
        if (n2 > n3)
            nRet=n3 ^ n4;
        else if (n2 <= n4)
            nRet = n1 / n2;
        else
            nRet=n3 ^ n4;
    }
    else if (n2 != n4)
        nRet = n3>>2;
    else
        nRet = n1 & n2;
    return nRet;//32755;
}

int f2 (int n){
    int nRet = 0,i=0;
    while (i <= 21)
    {
        nRet+=i * i + n;
        ++i;
    }
    return nRet;
}

void f3 (int n,int* pn){
    *pn+=8 * n;
    //*pN=(int)(((LONGLONG)(0x55555556 * (*pN))) >> 32) -(*pN >> 0x1f);
    *pn/=3;
}

int f4_helper (int n){
    int m=2;
    return m * n;
}

int f4 (int x1,int x2,int x3){
    return f4_helper (x1) + f4_helper (x2) + f4_helper (x3);
}

void f5 (int *pN){
    int n=0,i=0,nArray[9]={9348,3957,2849,2048,7452,9348,3957,2849,2048};
    for (i=0;i <= 4;++i)
        n+=nArray[i];
    pN[5]=n;
}



int main (int argc,char** argv){
    int i = 0,nCnt = 0;
    
    int arrayA[6]={0},arrayB[6]={0};
    printf ("Enter six numbers: ");
    for (i=0; i <= 5; ++i)
        scanf ("%d",&arrayA[i]);
    printf ("\nYou have entered: %d, %d, %d, %d, %d, %d\n",arrayA[0],arrayA[1],arrayA[2],arrayA[3],arrayA[4],arrayA[5]);
    arrayB[0]=f0 ();
    arrayB[1]=f1 ();
    arrayB[2]=f2 (i);
    arrayB[3]=36566;
    f3 (36566,&arrayB[3]);
    arrayB[4]=f4 (783,838,983);
    f5 (&arrayB[0]);
    for (i=0;i <= 5;++i)
        nCnt+=Is_Number_Correct (arrayA[i],arrayB[i],i);
    if (!nCnt)
        puts ("You didn't get any correct numbers. Please try again.");
    if ((0 < nCnt) && (5 >= nCnt))
        printf ("You got %d correct numbers.  Please try again.\n",nCnt);
    if (6 == nCnt)
        puts ("All numbers are correct! Nice work!");
    return 0;
}

