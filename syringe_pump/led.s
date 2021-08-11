	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_led_on                         ## -- Begin function led_on
	.p2align	4, 0x90
_led_on:                                ## @led_on
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_.str(%rip), %rdi
	leaq	L___func__.led_on(%rip), %rsi
	movb	$0, %al
	callq	_printf
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_led_off                        ## -- Begin function led_off
	.p2align	4, 0x90
_led_off:                               ## @led_off
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_.str(%rip), %rdi
	leaq	L___func__.led_off(%rip), %rsi
	movb	$0, %al
	callq	_printf
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s\n"

L___func__.led_on:                      ## @__func__.led_on
	.asciz	"led_on"

L___func__.led_off:                     ## @__func__.led_off
	.asciz	"led_off"

.subsections_via_symbols
