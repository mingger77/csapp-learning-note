#include <stdio.h>

void binary_print(unsigned int x)
{
	unsigned int mask = 1 << 31;

	for (int i = 0; i < 32; i++) {
		printf("%d", (x & mask) ? 1 : 0);
		mask >>= 1;

		if ((i + 1) % 8 == 0 && i < 31) {
			printf(" ");
		}
	}
	printf("\n");
}

int main()
{
	int num1 = 0x00359141;
	int num2 = 0x4a564504;
	binary_print(num1);
	binary_print(num2);

	return 0;
}
