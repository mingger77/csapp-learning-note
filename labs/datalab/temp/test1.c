#include <stdio.h>

int main()
{
	int a = 12345;
	unsigned b = 12345.0;

	printf("%.8x %.8x\n", a, b);

	return 0;
}
