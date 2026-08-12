#include <stdio.h>

void swap_inplace(int *x, int *y)
{
	*y = *x ^ *y;
	*x = *x ^ *y;
	*y = *x ^ *y;
}

void array_reverse(int *array, int length)
{
	int start, last;
	for (start = 0, last = length - 1; start < last; start++, last--) {
		swap_inplace(&array[start], &array[last]);
	}
}

void example_1()
{
	int a = 100;
	int b = 1002;

	int *int_pointer_1 = &a;
	int *int_pointer_2 = &b;

	swap_inplace(int_pointer_1, int_pointer_2);
	printf("%d %d\n", *int_pointer_1, *int_pointer_2);
	printf("%d %d\n", a, b);
}

void example_2()
{
	int array[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
	array_reverse(array, 9);
	for (int i = 0; i < 9; i++) {
		printf("%d ", array[i]);
	}
	printf("\n");
}

int main()
{
	// example_1();
	example_2();

	return 0;
}
