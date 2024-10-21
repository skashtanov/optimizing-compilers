	.file	"sums.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	sum_recursive
	.type	sum_recursive, @function
sum_recursive:
.LFB0:
	.cfi_startproc
	endbr64
	xor	eax, eax
	cmp	edi, 1
	je	.L8
	.p2align 4,,10
	.p2align 3
.L2:
	mov	edx, edi
	sub	edi, 1
	add	eax, edx
	cmp	edi, 1
	jne	.L2
	add	eax, 1
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	mov	eax, 1
	ret
	.cfi_endproc
.LFE0:
	.size	sum_recursive, .-sum_recursive
	.p2align 4
	.globl	sum_loop
	.type	sum_loop, @function
sum_loop:
.LFB1:
	.cfi_startproc
	endbr64
	mov	eax, 1
	cmp	edi, 1
	je	.L12
	lea	edx, -1[rdi]
	test	dil, 1
	jne	.L11
	lea	eax, 1[rdi]
	mov	edi, edx
	cmp	edx, 1
	je	.L19
	.p2align 4,,10
	.p2align 3
.L11:
	lea	eax, -1[rax+rdi*2]
	sub	edi, 2
	cmp	edi, 1
	jne	.L11
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	ret
.L19:
	ret
	.cfi_endproc
.LFE1:
	.size	sum_loop, .-sum_loop
	.p2align 4
	.globl	sum_formula
	.type	sum_formula, @function
sum_formula:
.LFB2:
	.cfi_startproc
	endbr64
	lea	edx, 1[rdi]
	imul	edx, edi
	mov	eax, edx
	shr	eax, 31
	add	eax, edx
	sar	eax
	ret
	.cfi_endproc
.LFE2:
	.size	sum_formula, .-sum_formula
	.p2align 4
	.globl	sum_recursive_formula
	.type	sum_recursive_formula, @function
sum_recursive_formula:
.LFB3:
	.cfi_startproc
	endbr64
	test	edi, edi
	jg	.L25
.L22:
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L25:
	lea	eax, 1[rdi]
	imul	eax, edi
	sar	eax
	ret
	.cfi_endproc
.LFE3:
	.size	sum_recursive_formula, .-sum_recursive_formula
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	endbr64
	xor	eax, eax
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
