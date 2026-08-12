#include <stdio.h>
#include <string.h>

typedef unsigned char* byte_pointer;

void bytes_show(byte_pointer start, size_t len)
{
	size_t i;
	for (i = 0; i < len; i++) {
		printf("%.2x", start[i]);
	}
	printf("\n");
}

/*
void int_show(int x)
{
	bytes_show((byte_pointer) &x, sizeof(int));
}

void float_show(float x)
{	
	bytes_show((byte_pointer) &x, sizeof(float));
}
*/

int main()
{
	// int int_number = 12345;
	// float float_number = 12345.0;

	// int_show(int_number);
	// float_show(float_number);

	// int val = 0x87654321;
	//
	// byte_pointer valp = (byte_pointer) &val;
	//
	// printf("A\n");	
	// bytes_show(valp, 1);
	//	
	// printf("B\n");	
	// bytes_show(valp, 2);	
	//
	// printf("C\n");	
	// bytes_show(valp, 3);	

	const char* s = "abcdef";
	bytes_show((byte_pointer) s, strlen(s));

	return 0;
}
