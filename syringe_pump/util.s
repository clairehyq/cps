	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_pinMode                        ## -- Begin function pinMode
	.p2align	4, 0x90
_pinMode:                               ## @pinMode
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %ecx
	leaq	L_.str(%rip), %rdi
	leaq	L___func__.pinMode(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_digitalRead                    ## -- Begin function digitalRead
	.p2align	4, 0x90
_digitalRead:                           ## @digitalRead
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edx
	leaq	L_.str.1(%rip), %rdi
	leaq	L___func__.digitalRead(%rip), %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	leaq	-8(%rbp), %rsi
	movl	%eax, -12(%rbp)                 ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movl	-8(%rbp), %ecx
	movl	%eax, -16(%rbp)                 ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_digitalWrite                   ## -- Begin function digitalWrite
	.p2align	4, 0x90
_digitalWrite:                          ## @digitalWrite
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Serial_begin                   ## -- Begin function Serial_begin
	.p2align	4, 0x90
_Serial_begin:                          ## @Serial_begin
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edx
	leaq	L_.str.3(%rip), %rdi
	leaq	L___func__.Serial_begin(%rip), %rsi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Serial_available               ## -- Begin function Serial_available
	.p2align	4, 0x90
_Serial_available:                      ## @Serial_available
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	callq	_getchar
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -5(%rbp)
	movsbl	-5(%rbp), %edx
	leaq	L_.str.4(%rip), %rdi
	leaq	L___func__.Serial_available(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movsbl	-5(%rbp), %ecx
	cmpl	$121, %ecx
	jne	LBB4_2
## %bb.1:
	movl	$1, -4(%rbp)
	jmp	LBB4_3
LBB4_2:
	movl	$0, -4(%rbp)
LBB4_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Serial_read                    ## -- Begin function Serial_read
	.p2align	4, 0x90
_Serial_read:                           ## @Serial_read
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	callq	_getchar
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Serial_write                   ## -- Begin function Serial_write
	.p2align	4, 0x90
_Serial_write:                          ## @Serial_write
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
	movq	-8(%rbp), %rdx
	movl	-12(%rbp), %ecx
	leaq	L_.str.5(%rip), %rdi
	leaq	L___func__.Serial_write(%rip), %rsi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -16(%rbp)                 ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_analogRead                     ## -- Begin function analogRead
	.p2align	4, 0x90
_analogRead:                            ## @analogRead
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	leaq	L_.str.6(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	leaq	-8(%rbp), %rsi
	movl	%eax, -12(%rbp)                 ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movl	-8(%rbp), %ecx
	movl	%eax, -16(%rbp)                 ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_millis                         ## -- Begin function millis
	.p2align	4, 0x90
_millis:                                ## @millis
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
	movl	%eax, %esi
	leaq	-16(%rbp), %rdi
	callq	_gettimeofday
	imulq	$1000, -16(%rbp), %rcx          ## imm = 0x3E8
	movl	-8(%rbp), %edx
	movl	%eax, -20(%rbp)                 ## 4-byte Spill
	movl	%edx, %eax
	cltd
	movl	$1000, %r8d                     ## imm = 0x3E8
	idivl	%r8d
	movslq	%eax, %rsi
	addq	%rsi, %rcx
	movq	%rcx, %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_usecs                          ## -- Begin function usecs
	.p2align	4, 0x90
_usecs:                                 ## @usecs
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
	movl	%eax, %esi
	leaq	-16(%rbp), %rdi
	callq	_gettimeofday
	imulq	$1000, -16(%rbp), %rcx          ## imm = 0x3E8
	imulq	$1000, %rcx, %rcx               ## imm = 0x3E8
	movslq	-8(%rbp), %rdx
	addq	%rdx, %rcx
	movl	%eax, -20(%rbp)                 ## 4-byte Spill
	movq	%rcx, %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_delayMicroseconds              ## -- Begin function delayMicroseconds
	.p2align	4, 0x90
_delayMicroseconds:                     ## @delayMicroseconds
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movss	%xmm0, -4(%rbp)
	cvttss2si	-4(%rbp), %rax
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, %edi
	callq	_usleep
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_toUInt                         ## -- Begin function toUInt
	.p2align	4, 0x90
_toUInt:                                ## @toUInt
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
	movq	-8(%rbp), %rdi
	callq	_atoi
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s (int pin = %d, int mode = %d)\n"

L___func__.pinMode:                     ## @__func__.pinMode
	.asciz	"pinMode"

L_.str.1:                               ## @.str.1
	.asciz	"%s (int pin = %d)\n"

L___func__.digitalRead:                 ## @__func__.digitalRead
	.asciz	"digitalRead"

L_.str.2:                               ## @.str.2
	.asciz	"%d"

L_.str.3:                               ## @.str.3
	.asciz	"%s (int baud = %d)\n"

L___func__.Serial_begin:                ## @__func__.Serial_begin
	.asciz	"Serial_begin"

L_.str.4:                               ## @.str.4
	.asciz	"%s() c:%c\n"

L___func__.Serial_available:            ## @__func__.Serial_available
	.asciz	"Serial_available"

L_.str.5:                               ## @.str.5
	.asciz	"%s (char *output = %s, int len = %d)\n"

L___func__.Serial_write:                ## @__func__.Serial_write
	.asciz	"Serial_write"

L_.str.6:                               ## @.str.6
	.asciz	"read from pin %d\n"

.subsections_via_symbols
