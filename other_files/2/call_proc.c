void proc(long x1,long* _x1, int x2, int* _x2, short x3, short* _x3, char x4, char* _x4);

long call_prog()
{
    long x1 = 1;
    long x2 = 2;
    long x3 = 3;
    long x4 = 4;
    proc(x1, &x1, x2, &x2, x3, &x3, x4, &x4);
    return (x1 + x2) * (x3 - x4);
}

