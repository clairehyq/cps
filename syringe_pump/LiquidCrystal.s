	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_lcd_begin                      ## -- Begin function lcd_begin
	.p2align	4, 0x90
_lcd_begin:                             ## @lcd_begin
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movl	-16(%rbp), %r8d
	leaq	L_.str(%rip), %rdi
	leaq	L___func__.lcd_begin(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lcd_clear                      ## -- Begin function lcd_clear
	.p2align	4, 0x90
_lcd_clear:                             ## @lcd_clear
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	L_.str.1(%rip), %rdi
	leaq	L___func__.lcd_clear(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lcd_print                      ## -- Begin function lcd_print
	.p2align	4, 0x90
_lcd_print:                             ## @lcd_print
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-20(%rbp), %r8d
	leaq	L_.str.2(%rip), %rdi
	leaq	L___func__.lcd_print(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lcd_setCursor                  ## -- Begin function lcd_setCursor
	.p2align	4, 0x90
_lcd_setCursor:                         ## @lcd_setCursor
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %edx
	movl	-16(%rbp), %ecx
	leaq	L_.str.3(%rip), %rdi
	leaq	L___func__.lcd_setCursor(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s (LiquidCrystal * lcd = 0x%x, unsigned int cols = %u, unsigned int rows = %u)\n"

L___func__.lcd_begin:                   ## @__func__.lcd_begin
	.asciz	"lcd_begin"

L_.str.1:                               ## @.str.1
	.asciz	"%s (LiquidCrystal * lcd = 0x%x\n"

L___func__.lcd_clear:                   ## @__func__.lcd_clear
	.asciz	"lcd_clear"

L_.str.2:                               ## @.str.2
	.asciz	"%s (LiquidCrystal * lcd = 0x%x, char* output = %s, int len = %d)\n"

L___func__.lcd_print:                   ## @__func__.lcd_print
	.asciz	"lcd_print"

L_.str.3:                               ## @.str.3
	.asciz	"%s (LiquidCrystal * lcd = 0x%x, int x = %d, int y = %d\n"

L___func__.lcd_setCursor:               ## @__func__.lcd_setCursor
	.asciz	"lcd_setCursor"

.subsections_via_symbols
