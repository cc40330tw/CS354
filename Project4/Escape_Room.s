	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_Is_Number_Correct      ## -- Begin function Is_Number_Correct
	.p2align	4, 0x90
_Is_Number_Correct:                     ## @Is_Number_Correct
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$20, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	$0, -8(%ebp)
	movl	8(%ebp), %esi
	cmpl	12(%ebp), %esi
	jne	LBB0_2
## %bb.1:
	movl	16(%ebp), %eax
	leal	L_.str, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$1, -8(%ebp)
	jmp	LBB0_3
LBB0_2:
	movl	16(%ebp), %eax
	leal	L_.str.1, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$0, -8(%ebp)
LBB0_3:
	movl	-8(%ebp), %eax
	addl	$20, %esp
	popl	%esi
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f0                     ## -- Begin function f0
	.p2align	4, 0x90
_f0:                                    ## @f0
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$136182, %eax           ## imm = 0x213F6
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f1                     ## -- Begin function f1
	.p2align	4, 0x90
_f1:                                    ## @f1
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	$0, -4(%ebp)
	movl	$28069447, -8(%ebp)     ## imm = 0x1AC4E47
	movl	$159934, -12(%ebp)      ## imm = 0x270BE
	movl	$131022, -16(%ebp)      ## imm = 0x1FFCE
	movl	$206829, -20(%ebp)      ## imm = 0x327ED
	movl	-8(%ebp), %eax
	movl	-12(%ebp), %ecx
	addl	-16(%ebp), %ecx
	cmpl	%ecx, %eax
	jg	LBB2_8
## %bb.1:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jle	LBB2_3
## %bb.2:
	movl	-16(%ebp), %eax
	xorl	-20(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	LBB2_7
LBB2_3:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jg	LBB2_5
## %bb.4:
	movl	-8(%ebp), %eax
	cltd
	idivl	-12(%ebp)
	movl	%eax, -4(%ebp)
	jmp	LBB2_6
LBB2_5:
	movl	-16(%ebp), %eax
	xorl	-20(%ebp), %eax
	movl	%eax, -4(%ebp)
LBB2_6:
	jmp	LBB2_7
LBB2_7:
	jmp	LBB2_12
LBB2_8:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	je	LBB2_10
## %bb.9:
	movl	-16(%ebp), %eax
	sarl	$2, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB2_11
LBB2_10:
	movl	-8(%ebp), %eax
	andl	-12(%ebp), %eax
	movl	%eax, -4(%ebp)
LBB2_11:
	jmp	LBB2_12
LBB2_12:
	movl	-4(%ebp), %eax
	addl	$20, %esp
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f2                     ## -- Begin function f2
	.p2align	4, 0x90
_f2:                                    ## @f2
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$21, -8(%ebp)
	jg	LBB3_3
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-8(%ebp), %eax
	imull	-8(%ebp), %eax
	addl	8(%ebp), %eax
	addl	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB3_1
LBB3_3:
	movl	-4(%ebp), %eax
	addl	$8, %esp
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f3                     ## -- Begin function f3
	.p2align	4, 0x90
_f3:                                    ## @f3
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	8(%ebp), %edx
	shll	$3, %edx
	movl	12(%ebp), %esi
	addl	(%esi), %edx
	movl	%edx, (%esi)
	movl	12(%ebp), %edx
	movl	(%edx), %esi
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	movl	%esi, %eax
	movl	%edx, -12(%ebp)         ## 4-byte Spill
	cltd
	movl	$3, %esi
	idivl	%esi
	movl	-12(%ebp), %esi         ## 4-byte Reload
	movl	%eax, (%esi)
	addl	$8, %esp
	popl	%esi
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f4_helper              ## -- Begin function f4_helper
	.p2align	4, 0x90
_f4_helper:                             ## @f4_helper
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	$2, -4(%ebp)
	movl	-4(%ebp), %ecx
	imull	8(%ebp), %ecx
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	movl	%ecx, %eax
	addl	$8, %esp
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f4                     ## -- Begin function f4
	.p2align	4, 0x90
_f4:                                    ## @f4
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$36, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	8(%ebp), %esi
	movl	%esi, (%esp)
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	movl	%ecx, -12(%ebp)         ## 4-byte Spill
	movl	%edx, -16(%ebp)         ## 4-byte Spill
	calll	_f4_helper
	movl	12(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -20(%ebp)         ## 4-byte Spill
	calll	_f4_helper
	movl	-20(%ebp), %ecx         ## 4-byte Reload
	addl	%eax, %ecx
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	movl	%ecx, -24(%ebp)         ## 4-byte Spill
	calll	_f4_helper
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	addl	%eax, %ecx
	movl	%ecx, %eax
	addl	$36, %esp
	popl	%esi
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_f5                     ## -- Begin function f5
	.p2align	4, 0x90
_f5:                                    ## @f5
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$72, %esp
	movl	8(%ebp), %eax
	leal	l___const.f5.nArray, %ecx
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	leal	-44(%ebp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	$36, 8(%esp)
	movl	%eax, -48(%ebp)         ## 4-byte Spill
	calll	_memcpy
	movl	$0, -8(%ebp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$4, -8(%ebp)
	jg	LBB7_4
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movl	-8(%ebp), %eax
	movl	-44(%ebp,%eax,4), %eax
	addl	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
## %bb.3:                               ##   in Loop: Header=BB7_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB7_1
LBB7_4:
	movl	-4(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%eax, 20(%ecx)
	addl	$72, %esp
	popl	%ebp
	retl
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$108, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	xorl	%edx, %edx
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	leal	-48(%ebp), %esi
	movl	%esi, (%esp)
	movl	$0, 4(%esp)
	movl	$24, 8(%esp)
	movl	%eax, -76(%ebp)         ## 4-byte Spill
	movl	%ecx, -80(%ebp)         ## 4-byte Spill
	movl	%edx, -84(%ebp)         ## 4-byte Spill
	calll	_memset
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$24, 8(%esp)
	calll	_memset
	leal	L_.str.2, %eax
	movl	%eax, (%esp)
	calll	_printf
	movl	$0, -20(%ebp)
LBB8_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%ebp)
	jg	LBB8_4
## %bb.2:                               ##   in Loop: Header=BB8_1 Depth=1
	movl	-20(%ebp), %eax
	shll	$2, %eax
	leal	-48(%ebp), %ecx
	addl	%eax, %ecx
	leal	L_.str.3, %eax
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_scanf
## %bb.3:                               ##   in Loop: Header=BB8_1 Depth=1
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
	jmp	LBB8_1
LBB8_4:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %ecx
	movl	-40(%ebp), %edx
	movl	-36(%ebp), %esi
	movl	-32(%ebp), %edi
	movl	-28(%ebp), %ebx
	movl	%eax, -88(%ebp)         ## 4-byte Spill
	leal	L_.str.4, %eax
	movl	%eax, (%esp)
	movl	-88(%ebp), %eax         ## 4-byte Reload
	movl	%eax, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 16(%esp)
	movl	%edi, 20(%esp)
	movl	%ebx, 24(%esp)
	calll	_printf
	movl	%eax, -92(%ebp)         ## 4-byte Spill
	calll	_f0
	movl	%eax, -72(%ebp)
	calll	_f1
	movl	%eax, -68(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	_f2
	movl	%eax, -64(%ebp)
	movl	$36566, -60(%ebp)       ## imm = 0x8ED6
	leal	-72(%ebp), %eax
	addl	$12, %eax
	movl	$36566, (%esp)          ## imm = 0x8ED6
	movl	%eax, 4(%esp)
	calll	_f3
	movl	$783, (%esp)            ## imm = 0x30F
	movl	$838, 4(%esp)           ## imm = 0x346
	movl	$983, 8(%esp)           ## imm = 0x3D7
	calll	_f4
	leal	-72(%ebp), %ecx
	movl	%eax, -56(%ebp)
	movl	%ecx, (%esp)
	calll	_f5
	movl	$0, -20(%ebp)
LBB8_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%ebp)
	jg	LBB8_8
## %bb.6:                               ##   in Loop: Header=BB8_5 Depth=1
	movl	-20(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	movl	-20(%ebp), %ecx
	movl	-72(%ebp,%ecx,4), %ecx
	movl	-20(%ebp), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_Is_Number_Correct
	addl	-24(%ebp), %eax
	movl	%eax, -24(%ebp)
## %bb.7:                               ##   in Loop: Header=BB8_5 Depth=1
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
	jmp	LBB8_5
LBB8_8:
	cmpl	$0, -24(%ebp)
	jne	LBB8_10
## %bb.9:
	leal	L_.str.5, %eax
	movl	%eax, (%esp)
	calll	_puts
LBB8_10:
	xorl	%eax, %eax
	cmpl	-24(%ebp), %eax
	jge	LBB8_13
## %bb.11:
	movl	$5, %eax
	cmpl	-24(%ebp), %eax
	jl	LBB8_13
## %bb.12:
	movl	-24(%ebp), %eax
	leal	L_.str.6, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
LBB8_13:
	movl	$6, %eax
	cmpl	-24(%ebp), %eax
	jne	LBB8_15
## %bb.14:
	leal	L_.str.7, %eax
	movl	%eax, (%esp)
	calll	_puts
LBB8_15:
	xorl	%eax, %eax
	addl	$108, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Number %d: Correct. Nice Job.\n"

L_.str.1:                               ## @.str.1
	.asciz	"Number %d: Incorrect\n"

	.section	__TEXT,__const
	.p2align	2               ## @__const.f5.nArray
l___const.f5.nArray:
	.long	9348                    ## 0x2484
	.long	3957                    ## 0xf75
	.long	2849                    ## 0xb21
	.long	2048                    ## 0x800
	.long	7452                    ## 0x1d1c
	.long	9348                    ## 0x2484
	.long	3957                    ## 0xf75
	.long	2849                    ## 0xb21
	.long	2048                    ## 0x800

	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"Enter six numbers: "

L_.str.3:                               ## @.str.3
	.asciz	"%d"

L_.str.4:                               ## @.str.4
	.asciz	"\nYou have entered: %d, %d, %d, %d, %d, %d\n"

L_.str.5:                               ## @.str.5
	.asciz	"You didn't get nay correct numbers. Please try again."

L_.str.6:                               ## @.str.6
	.asciz	"You got %d correct numbers.  Please try again.\n"

L_.str.7:                               ## @.str.7
	.asciz	"All numbers are correct! Nice work!"


.subsections_via_symbols
