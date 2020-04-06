#include <stdio.h>
#include <stdlib.h>

#define SIZE 1000

void f1();
void f2();
void f3();
void fun(int *);

int main() {
    /* Next two lines are used to see which direction the stack grows */
    int main_local;
    fun(&main_local);

    f1();
    //f2();
    //f3();

    return 0;
}


void f1(){
    char values[SIZE] = {""};
    static int n = 0;
    static long int addr;

    /* Incrementing the number of activation records */
    n++;

    /* Printing activation record information */
    fprintf(stderr, "\nCall \t#%d at %lx", n, (long)&values);
    fprintf(stderr, "\nAR Size #%d is %ld\n", n, (addr - (long)&values));

    /* Storing address of the array `values` */
    addr = (long) &values;

    /* If the AR count is 10, stop doing recursive call; */
    if(n >= 10)
        return;

    f1();
}


void f2(){
    char values[SIZE] = {""};
    static int n = 0;
    static long int addr;

    /* Incrementing the number of activation records */
    n++;

    /* Printing activation record information */
    fprintf(stderr, "\nCall \t\t#%d at %lx", n, (long)&values);
    fprintf(stderr, "\nAR Size \t#%d is %ld", n, (addr - (long)&values));
    fprintf(stderr, "\nStack Size \t#%d is %ld\n\n", n, (addr - (long)&values) * n);

    /* Storing address of the array `values` */
    addr = (long) &values;

    /* Non-Stopping recursive call */
    f2();
}

void f3(){
    char* values;
    static int n = 0;
    static long int addr;
    char c;

    /* Using malloc to dynamically allocate the array in the heap */
    values = (char *)malloc(SIZE * sizeof(char));

    /* Incrementing the number of activation records */
    n++;

    /* Size of current activation record using the introduced variable `c` */
    c = (char)(addr - (long)&values);

    /* Printing activation record information */
    fprintf(stderr, "\nCall \t#%d at %lx", n, (long)&values);
    fprintf(stderr, "\nAR Size #%d is %hhd\n", n, c);

    /* Storing address of the array `values` */
    addr = (long) &values;

    /* Freeing the array from heap before recursive call  */
    free(values);

    /* If the AR count is 10, stop doing recursive call; */
    if(n >= 10)
        return;

    f3();
}

/* Checks to see which direction the stack grows. */
void fun(int *main_local_addr){
    int fun_local;
    if (main_local_addr < &fun_local)
        printf("Stack grows upward\n");
    else
        printf("Stack grows downward\n");
}
