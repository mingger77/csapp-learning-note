	.file	"test.c"
	.text
	.globl	comp
	.type	comp, @function
comp:
.LFB0:
	.cfi_startproc
	endbr64
	cmpq	%rsi, %rdi
	setl	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	comp, .-comp
	.globl	absdiff_se
	.type	absdiff_se, @function
absdiff_se:
.LFB1:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	cmpq	%rsi, %rdi
	jge	.L3
	addq	$1, lt_cnt(%rip)
	subq	%rdi, %rax
	ret
.L3:
	addq	$1, ge_cnt(%rip)
	subq	%rsi, %rdi
	movq	%rdi, %rax
.L4:
	endbr64
	ret
	.cfi_endproc
.LFE1:
	.size	absdiff_se, .-absdiff_se
	.globl	test_01
	.type	test_01, @function
test_01:
.LFB2:
	.cfi_startproc
	endbr64
	leaq	(%rdi,%rsi), %rax
	addq	%rdx, %rax
	cmpq	$-3, %rdi
	jge	.L6
	cmpq	%rdx, %rsi
	jge	.L7
	movq	%rdi, %rax
	imulq	%rsi, %rax
	ret
.L7:
	movq	%rsi, %rax
	imulq	%rdx, %rax
	ret
.L6:
	cmpq	$2, %rdi
	jle	.L5
	movq	%rdi, %rax
	imulq	%rdx, %rax
.L5:
	ret
	.cfi_endproc
.LFE2:
	.size	test_01, .-test_01
	.globl	test_02
	.type	test_02, @function
test_02:
.LFB3:
	.cfi_startproc
	endbr64
	leaq	0(,%rdi,8), %rax
	testq	%rsi, %rsi
	jle	.L10
	cmpq	%rsi, %rdi
	jge	.L11
	movq	%rsi, %rax
	subq	%rdi, %rax
	ret
.L11:
	movq	%rdi, %rax
	andq	%rsi, %rax
	ret
.L10:
	cmpq	$-1, %rsi
	jl	.L13
.L9:
	ret
.L13:
	leaq	(%rdi,%rsi), %rax
	jmp	.L9
	.cfi_endproc
.LFE3:
	.size	test_02, .-test_02
	.globl	fun_a
	.type	fun_a, @function
fun_a:
.LFB4:
	.cfi_startproc
	endbr64
	movl	$0, %eax
.L15:
	testl	%edi, %edi
	je	.L17
	movl	%edi, %edx
	xorq	%rdx, %rax
	shrl	%edi
	jmp	.L15
.L17:
	andl	$1, %eax
	ret
	.cfi_endproc
.LFE4:
	.size	fun_a, .-fun_a
	.globl	ge_cnt
	.bss
	.align 8
	.type	ge_cnt, @object
	.size	ge_cnt, 8
ge_cnt:
	.zero	8
	.globl	lt_cnt
	.align 8
	.type	lt_cnt, @object
	.size	lt_cnt, 8
lt_cnt:
	.zero	8
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
