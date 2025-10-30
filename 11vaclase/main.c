#include <stdio.h>

double factorial(unsigned n);
unsigned dcm(unsigned a, unsigned b);

int main(void){
    printf("Hello, World!\n");

    unsigned a, b;
    scanf("%u %u", &a, &b);

    printf("DCM(%u, %u) = %u\n", a, b, dcm(a, b));
    

    return 0;
}

//Lol lo hice de una
double factorial(unsigned n)
{
    if(n <= 1){
        return 1;
    }

    return factorial(n - 1) * n;
}

unsigned dcm(unsigned a, unsigned b)
{
    if(b == 0){
        return a;
    }

    return dcm(b, a % b);
}