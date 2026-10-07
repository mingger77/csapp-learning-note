#include <stdio.h>

void multstore(long, long, long*);

int main()
{
    long p;
    multstore(2, 3, &p);
    printf("2 * 3 --> %ld\n", p);
    return 0;
}

long mult2(long x, long y)
{
    long s = x * y;
    return s;
}
