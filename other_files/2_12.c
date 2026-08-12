#include <stdio.h>

int _2_12_a(int x)
{
	return (x & 0xFF);
}

int _2_12_b(int x)
{
	return (x ^ ~0xFF);
}

int _2_12_c(int x)
{
	return (x | 0xFF);
}

void example_1()
{
	int x = 0x87654321;

	printf("%.8x\n", _2_12_a(x));
	printf("%.8x\n", _2_12_b(x));
	printf("%.8x\n", _2_12_c(x));
}

int main()
{
	example_1();
	// example_2();

	return 0;
}
