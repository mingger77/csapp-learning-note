	.file	"call_proc.c"
	.text
	.globl	call_prog
	.type	call_prog, @function
call_prog:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movl	$40, %ebx
	movq	%fs:(%rbx), %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	$1, 8(%rsp)
	movq	$2, 16(%rsp)
	movq	$3, 24(%rsp)
	movq	$4, 32(%rsp)
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rsi
	leaq	32(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 72
	pushq	$4
	.cfi_def_cfa_offset 80
	leaq	40(%rsp), %r9
	movl	$3, %r8d
	movl	$2, %edx
	movl	$1, %edi
	call	proc@PLT
	movq	32(%rsp), %rax
	addq	24(%rsp), %rax
	movq	40(%rsp), %rdx
	subq	48(%rsp), %rdx
	imulq	%rdx, %rax
	addq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	40(%rsp), %rdi
	xorq	%fs:(%rbx), %rdi
	jne	.L4
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	call_prog, .-call_prog
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
