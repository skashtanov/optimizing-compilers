	.text
	.intel_syntax noprefix
	.file	"sums.c"
	.globl	sum_recursive                   # -- Begin function sum_recursive
	.p2align	4, 0x90
	.type	sum_recursive,@function
sum_recursive:                          # @sum_recursive
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	mov	eax, 1
	cmp	edi, 1
	je	.LBB0_2
# %bb.1:
	lea	eax, [rdi - 1]
	lea	ecx, [rdi - 2]
	imul	eax, ecx
	lea	edx, [rdi - 3]
	imul	rdx, rcx
	shr	rdx
	add	eax, edi
	sub	eax, edx
	inc	eax
.LBB0_2:
	ret
.Lfunc_end0:
	.size	sum_recursive, .Lfunc_end0-sum_recursive
	.cfi_endproc
                                        # -- End function
	.globl	sum_loop                        # -- Begin function sum_loop
	.p2align	4, 0x90
	.type	sum_loop,@function
sum_loop:                               # @sum_loop
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	mov	eax, 1
	cmp	edi, 1
	je	.LBB1_2
# %bb.1:
	lea	eax, [rdi - 1]
	lea	ecx, [rdi - 2]
	imul	eax, ecx
	add	eax, edi
	add	edi, -3
	imul	rdi, rcx
	shr	rdi
	sub	eax, edi
	inc	eax
.LBB1_2:
	ret
.Lfunc_end1:
	.size	sum_loop, .Lfunc_end1-sum_loop
	.cfi_endproc
                                        # -- End function
	.globl	sum_formula                     # -- Begin function sum_formula
	.p2align	4, 0x90
	.type	sum_formula,@function
sum_formula:                            # @sum_formula
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	lea	ecx, [rdi + 1]
	imul	ecx, edi
	mov	eax, ecx
	shr	eax, 31
	add	eax, ecx
	sar	eax
	ret
.Lfunc_end2:
	.size	sum_formula, .Lfunc_end2-sum_formula
	.cfi_endproc
                                        # -- End function
	.globl	sum_recursive_formula           # -- Begin function sum_recursive_formula
	.p2align	4, 0x90
	.type	sum_recursive_formula,@function
sum_recursive_formula:                  # @sum_recursive_formula
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	test	edi, edi
	jle	.LBB3_2
# %bb.1:
	lea	eax, [rdi + 1]
	imul	eax, edi
	shr	eax
	ret
	.p2align	4, 0x90
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	jmp	.LBB3_2
.Lfunc_end3:
	.size	sum_recursive_formula, .Lfunc_end3-sum_recursive_formula
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	xor	eax, eax
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
