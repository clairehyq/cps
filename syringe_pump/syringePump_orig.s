	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_setup                          ## -- Begin function setup
	.p2align	4, 0x90
_setup:                                 ## @setup
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_lcd@GOTPCREL(%rip), %rdi
	movl	$16, %esi
	movl	$2, %edx
	callq	_lcd_begin
	movq	_lcd@GOTPCREL(%rip), %rdi
	callq	_lcd_clear
	movq	_lcd@GOTPCREL(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$16, %edx
	callq	_lcd_print
	xorl	%esi, %esi
	movl	_triggerPin(%rip), %edi
	callq	_pinMode
	xorl	%esi, %esi
	movl	_bigTriggerPin(%rip), %edi
	callq	_pinMode
	xorl	%esi, %esi
	movl	_triggerPin(%rip), %edi
	callq	_digitalWrite
	xorl	%esi, %esi
	movl	_bigTriggerPin(%rip), %edi
	callq	_digitalWrite
	movl	_motorDirPin(%rip), %edi
	movl	$1, %esi
	callq	_pinMode
	movl	_motorStepPin(%rip), %edi
	movl	$1, %esi
	callq	_pinMode
	movl	$57600, %edi                    ## imm = 0xE100
	callq	_Serial_begin
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function loop
LCPI1_0:
	.quad	0x3f50624dd2f1a9fc              ## double 0.001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_loop
	.p2align	4, 0x90
_loop:                                  ## @loop
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movsd	LCPI1_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movl	%edi, -4(%rbp)
	cvtsi2sdl	-4(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, _mLBolus(%rip)
	movb	$43, _serialStr(%rip)
	movb	$1, _serialStrReady(%rip)
	movb	$0, %al
	callq	_usecs
	movq	%rax, -16(%rbp)
	testb	$1, _serialStrReady(%rip)
	je	LBB1_2
## %bb.1:
	callq	_processSerial
LBB1_2:
	movb	$0, %al
	callq	_usecs
	movq	%rax, -24(%rbp)
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	subq	-16(%rbp), %rax
	leaq	L_.str.1(%rip), %rdi
	movq	%rax, %rsi
	movb	$1, %al
	callq	_printf
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkTriggers                  ## -- Begin function checkTriggers
	.p2align	4, 0x90
_checkTriggers:                         ## @checkTriggers
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	_triggerPin(%rip), %edi
	callq	_digitalRead
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	LBB2_3
## %bb.1:
	cmpl	$1, _prevTrigger(%rip)
	jne	LBB2_3
## %bb.2:
	xorl	%edi, %edi
	callq	_bolus
	callq	_updateScreen
LBB2_3:
	movl	-4(%rbp), %eax
	movl	%eax, _prevTrigger(%rip)
	movl	_bigTriggerPin(%rip), %edi
	callq	_digitalRead
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	LBB2_6
## %bb.4:
	cmpl	$1, _prevBigTrigger(%rip)
	jne	LBB2_6
## %bb.5:
	xorl	%edi, %edi
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -12(%rbp)
	movss	_mLBigBolus(%rip), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, _mLBolus(%rip)
	callq	_bolus
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, _mLBolus(%rip)
	callq	_updateScreen
LBB2_6:
	movl	-8(%rbp), %eax
	movl	%eax, _prevBigTrigger(%rip)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2                               ## -- Begin function bolus
LCPI3_0:
	.long	0x42c80000                      ## float 100
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_bolus
	.p2align	4, 0x90
_bolus:                                 ## @bolus
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	cvtsi2ssq	_ustepsPerML(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %rax
	movq	%rax, -16(%rbp)
	cmpl	$0, -4(%rbp)
	jne	LBB3_2
## %bb.1:
	callq	_led_on
	xorl	%esi, %esi
	movl	_motorDirPin(%rip), %edi
	callq	_digitalWrite
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	cvtsi2ssq	_ustepsPerML(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	addss	_mLUsed(%rip), %xmm0
	movss	%xmm0, _mLUsed(%rip)
	jmp	LBB3_8
LBB3_2:
	cmpl	$1, -4(%rbp)
	jne	LBB3_7
## %bb.3:
	callq	_led_off
	movl	_motorDirPin(%rip), %edi
	movl	$1, %esi
	callq	_digitalWrite
	movss	_mLUsed(%rip), %xmm0            ## xmm0 = mem[0],zero,zero,zero
	subss	_mLBolus(%rip), %xmm0
	xorps	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	LBB3_5
## %bb.4:
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	movss	_mLUsed(%rip), %xmm1            ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, _mLUsed(%rip)
	jmp	LBB3_6
LBB3_5:
	xorps	%xmm0, %xmm0
	movss	%xmm0, _mLUsed(%rip)
LBB3_6:
	jmp	LBB3_7
LBB3_7:
	jmp	LBB3_8
LBB3_8:
	movss	LCPI3_0(%rip), %xmm0            ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -20(%rbp)
	movq	$0, -32(%rbp)
LBB3_9:                                 ## =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jge	LBB3_12
## %bb.10:                              ##   in Loop: Header=BB3_9 Depth=1
	xorl	%esi, %esi
	movl	_motorStepPin(%rip), %edi
	callq	_digitalWrite
	movss	-20(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	callq	_delayMicroseconds
	movl	_motorStepPin(%rip), %edi
	movl	$1, %esi
	callq	_digitalWrite
	movss	-20(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	callq	_delayMicroseconds
## %bb.11:                              ##   in Loop: Header=BB3_9 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	LBB3_9
LBB3_12:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_readSerial                     ## -- Begin function readSerial
	.p2align	4, 0x90
_readSerial:                            ## @readSerial
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	movb	$0, %al
	callq	_Serial_available
	cmpl	$0, %eax
	je	LBB4_6
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	movb	$0, %al
	callq	_Serial_read
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %ecx
	cmpl	$32, %ecx
	jge	LBB4_4
## %bb.3:                               ##   in Loop: Header=BB4_1 Depth=1
	movb	$1, _serialStrReady(%rip)
	jmp	LBB4_5
LBB4_4:                                 ##   in Loop: Header=BB4_1 Depth=1
	movb	-1(%rbp), %al
	movslq	_serialStrLen(%rip), %rcx
	leaq	_serialStr(%rip), %rdx
	movb	%al, (%rdx,%rcx)
	movl	_serialStrLen(%rip), %esi
	addl	$1, %esi
	movl	%esi, _serialStrLen(%rip)
LBB4_5:                                 ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_1
LBB4_6:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function processSerial
LCPI5_0:
	.quad	0x408f400000000000              ## double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_processSerial
	.p2align	4, 0x90
_processSerial:                         ## @processSerial
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movsbl	_serialStr(%rip), %eax
	cmpl	$43, %eax
	jne	LBB5_2
## %bb.1:
	xorl	%edi, %edi
	callq	_bolus
	callq	_updateScreen
	jmp	LBB5_9
LBB5_2:
	movsbl	_serialStr(%rip), %eax
	cmpl	$45, %eax
	jne	LBB5_4
## %bb.3:
	movl	$1, %edi
	callq	_bolus
	callq	_updateScreen
	jmp	LBB5_8
LBB5_4:
	movl	_serialStrLen(%rip), %esi
	leaq	_serialStr(%rip), %rdi
	callq	_toUInt
	cmpl	$0, %eax
	je	LBB5_6
## %bb.5:
	movl	_serialStrLen(%rip), %esi
	leaq	_serialStr(%rip), %rdi
	callq	_toUInt
	movsd	LCPI5_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movl	%eax, -4(%rbp)
	cvtsi2ssl	-4(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, _mLBolus(%rip)
	callq	_updateScreen
	jmp	LBB5_7
LBB5_6:
	leaq	L_.str.2(%rip), %rdi
	movl	$18, %esi
	callq	_Serial_write
	movl	_serialStrLen(%rip), %esi
	leaq	_serialStr(%rip), %rdi
	movl	%eax, -8(%rbp)                  ## 4-byte Spill
	callq	_Serial_write
	leaq	L_.str.3(%rip), %rdi
	movl	$2, %esi
	movl	%eax, -12(%rbp)                 ## 4-byte Spill
	callq	_Serial_write
LBB5_7:
	jmp	LBB5_8
LBB5_8:
	jmp	LBB5_9
LBB5_9:
	movb	$0, _serialStrReady(%rip)
	movl	$0, _serialStrLen(%rip)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_readKey                        ## -- Begin function readKey
	.p2align	4, 0x90
_readKey:                               ## @readKey
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%edi, %edi
	callq	_analogRead
	movq	_adc_key_in@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movl	(%rcx), %edi
	callq	_get_key
	movl	%eax, _key(%rip)
	movb	$0, %al
	callq	_millis
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	_lastKeyRepeatAt(%rip), %rax
	movq	%rax, -16(%rbp)
	movb	$0, -17(%rbp)
	movl	_prevKey(%rip), %edx
	cmpl	_key(%rip), %edx
	jne	LBB6_3
## %bb.1:
	movq	-16(%rbp), %rax
	cmpq	_keyRepeatDelay(%rip), %rax
	jle	LBB6_3
## %bb.2:
	movb	$1, -17(%rbp)
LBB6_3:
	cmpl	$5, _prevKey(%rip)
	jne	LBB6_6
## %bb.4:
	movq	-16(%rbp), %rax
	cmpq	_keyDebounce(%rip), %rax
	jle	LBB6_6
## %bb.5:
	movb	$1, -17(%rbp)
LBB6_6:
	cmpl	$5, _key(%rip)
	jne	LBB6_8
## %bb.7:
	movb	$0, -17(%rbp)
LBB6_8:
	movl	_key(%rip), %eax
	movl	%eax, _prevKey(%rip)
	testb	$1, -17(%rbp)
	je	LBB6_10
## %bb.9:
	movl	_key(%rip), %edi
	callq	_doKeyAction
	movq	-8(%rbp), %rax
	movq	%rax, _lastKeyRepeatAt(%rip)
LBB6_10:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_key                        ## -- Begin function get_key
	.p2align	4, 0x90
_get_key:                               ## @get_key
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	_NUM_KEYS(%rip), %eax
	jge	LBB7_6
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movl	-8(%rbp), %eax
	movslq	-12(%rbp), %rcx
	leaq	_adc_key_val(%rip), %rdx
	cmpl	(%rdx,%rcx,4), %eax
	jae	LBB7_4
## %bb.3:
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB7_9
LBB7_4:                                 ##   in Loop: Header=BB7_1 Depth=1
	jmp	LBB7_5
LBB7_5:                                 ##   in Loop: Header=BB7_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB7_1
LBB7_6:
	movl	-12(%rbp), %eax
	cmpl	_NUM_KEYS(%rip), %eax
	jl	LBB7_8
## %bb.7:
	movl	$5, -12(%rbp)
LBB7_8:
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
LBB7_9:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_doKeyAction                    ## -- Begin function doKeyAction
	.p2align	4, 0x90
_doKeyAction:                           ## @doKeyAction
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$5, -4(%rbp)
	jne	LBB8_2
## %bb.1:
	jmp	LBB8_36
LBB8_2:
	cmpl	$4, -4(%rbp)
	jne	LBB8_7
## %bb.3:
	cmpl	$0, _uiState(%rip)
	jne	LBB8_5
## %bb.4:
	movl	$1, _uiState(%rip)
	jmp	LBB8_6
LBB8_5:
	movl	$0, _uiState(%rip)
LBB8_6:
	jmp	LBB8_7
LBB8_7:
	cmpl	$0, _uiState(%rip)
	jne	LBB8_20
## %bb.8:
	cmpl	$3, -4(%rbp)
	jne	LBB8_10
## %bb.9:
	movl	$1, %edi
	callq	_bolus
LBB8_10:
	cmpl	$0, -4(%rbp)
	jne	LBB8_12
## %bb.11:
	xorl	%edi, %edi
	callq	_bolus
LBB8_12:
	cmpl	$1, -4(%rbp)
	jne	LBB8_14
## %bb.13:
	movss	_mLBolusStep(%rip), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	addss	_mLBolus(%rip), %xmm0
	movss	%xmm0, _mLBolus(%rip)
LBB8_14:
	cmpl	$2, -4(%rbp)
	jne	LBB8_19
## %bb.15:
	movss	_mLBolus(%rip), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	subss	_mLBolusStep(%rip), %xmm0
	xorps	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	LBB8_17
## %bb.16:
	movss	_mLBolusStep(%rip), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	_mLBolus(%rip), %xmm1           ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	%xmm1, _mLBolus(%rip)
	jmp	LBB8_18
LBB8_17:
	xorps	%xmm0, %xmm0
	movss	%xmm0, _mLBolus(%rip)
LBB8_18:
	jmp	LBB8_19
LBB8_19:
	jmp	LBB8_35
LBB8_20:
	cmpl	$1, _uiState(%rip)
	jne	LBB8_34
## %bb.21:
	cmpl	$3, -4(%rbp)
	jne	LBB8_23
## %bb.22:
	jmp	LBB8_23
LBB8_23:
	cmpl	$0, -4(%rbp)
	jne	LBB8_25
## %bb.24:
	jmp	LBB8_25
LBB8_25:
	cmpl	$1, -4(%rbp)
	jne	LBB8_29
## %bb.26:
	cmpl	$8, _mLBolusStepIdx(%rip)
	jge	LBB8_28
## %bb.27:
	movl	_mLBolusStepIdx(%rip), %eax
	addl	$1, %eax
	movl	%eax, _mLBolusStepIdx(%rip)
	movslq	_mLBolusStepIdx(%rip), %rcx
	leaq	_mLBolusSteps(%rip), %rdx
	movss	(%rdx,%rcx,4), %xmm0            ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, _mLBolusStep(%rip)
LBB8_28:
	jmp	LBB8_29
LBB8_29:
	cmpl	$2, -4(%rbp)
	jne	LBB8_33
## %bb.30:
	cmpl	$0, _mLBolusStepIdx(%rip)
	jle	LBB8_32
## %bb.31:
	movl	_mLBolusStepIdx(%rip), %eax
	subl	$1, %eax
	movl	%eax, _mLBolusStepIdx(%rip)
	movslq	_mLBolusStepIdx(%rip), %rcx
	leaq	_mLBolusSteps(%rip), %rdx
	movss	(%rdx,%rcx,4), %xmm0            ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, _mLBolusStep(%rip)
LBB8_32:
	jmp	LBB8_33
LBB8_33:
	jmp	LBB8_34
LBB8_34:
	jmp	LBB8_35
LBB8_35:
	callq	_updateScreen
LBB8_36:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function updateScreen
LCPI9_0:
	.quad	0x408f400000000000              ## double 1000
LCPI9_1:
	.quad	0x3fe0000000000000              ## double 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_updateScreen
	.p2align	4, 0x90
_updateScreen:                          ## @updateScreen
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -180(%rbp)
	movl	$0, -184(%rbp)
	cmpl	$0, _uiState(%rip)
	jne	LBB9_2
## %bb.1:
	xorl	%esi, %esi
	movsd	LCPI9_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	LCPI9_1(%rip), %xmm1            ## xmm1 = mem[0],zero
	leaq	-96(%rbp), %rdi
	cvttss2si	_mLUsed(%rip), %r8d
	movss	_mLUsed(%rip), %xmm2            ## xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	cvttss2si	_mLUsed(%rip), %eax
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm0, %xmm1
	subsd	%xmm1, %xmm2
	cvttsd2si	%xmm2, %r9d
	movl	$80, %edx
	leaq	L_.str.4(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	xorl	%esi, %esi
	movsd	LCPI9_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	LCPI9_1(%rip), %xmm1            ## xmm1 = mem[0],zero
	leaq	-176(%rbp), %rdi
	movl	%eax, -180(%rbp)
	cvttss2si	_mLBolus(%rip), %r8d
	movss	_mLBolus(%rip), %xmm2           ## xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	cvttss2si	_mLBolus(%rip), %eax
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm0, %xmm1
	subsd	%xmm1, %xmm2
	cvttsd2si	%xmm2, %r9d
	movl	$80, %edx
	leaq	L_.str.5(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movl	%eax, -184(%rbp)
	jmp	LBB9_5
LBB9_2:
	cmpl	$1, _uiState(%rip)
	jne	LBB9_4
## %bb.3:
	xorl	%esi, %esi
	leaq	-96(%rbp), %rdi
	movl	$80, %edx
	leaq	L_.str.6(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	xorl	%esi, %esi
	movsd	LCPI9_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	LCPI9_1(%rip), %xmm1            ## xmm1 = mem[0],zero
	leaq	-176(%rbp), %rdi
	movl	%eax, -180(%rbp)
	cvttss2si	_mLBolusStep(%rip), %r8d
	movss	_mLBolusStep(%rip), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	cvttss2si	_mLBolusStep(%rip), %eax
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm0, %xmm1
	subsd	%xmm1, %xmm2
	cvttsd2si	%xmm2, %r9d
	movl	$80, %edx
	leaq	L_.str.7(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movl	%eax, -184(%rbp)
LBB9_4:
	jmp	LBB9_5
LBB9_5:
	movq	_lcd@GOTPCREL(%rip), %rdi
	callq	_lcd_clear
	movq	_lcd@GOTPCREL(%rip), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	callq	_lcd_setCursor
	movq	_lcd@GOTPCREL(%rip), %rdi
	leaq	-96(%rbp), %rsi
	movl	-180(%rbp), %edx
	callq	_lcd_print
	movq	_lcd@GOTPCREL(%rip), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	_lcd_setCursor
	movq	_lcd@GOTPCREL(%rip), %rdi
	leaq	-176(%rbp), %rsi
	movl	-184(%rbp), %edx
	callq	_lcd_print
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rsi
	cmpq	%rsi, %rcx
	jne	LBB9_7
## %bb.6:
	addq	$192, %rsp
	popq	%rbp
	retq
LBB9_7:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)                 ## 4-byte Spill
	callq	_setup
	movl	$1, -20(%rbp)
LBB10_1:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$62, -20(%rbp)
	jge	LBB10_3
## %bb.2:                               ##   in Loop: Header=BB10_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$10, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edi
	callq	_loop
	jmp	LBB10_1
LBB10_3:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_ustepsPerMM                    ## @ustepsPerMM
	.p2align	3
_ustepsPerMM:
	.quad	2560                            ## 0xa00

	.globl	_ustepsPerML                    ## @ustepsPerML
	.p2align	3
_ustepsPerML:
	.quad	6826                            ## 0x1aaa

	.globl	_motorDirPin                    ## @motorDirPin
	.p2align	2
_motorDirPin:
	.long	2                               ## 0x2

	.globl	_motorStepPin                   ## @motorStepPin
	.p2align	2
_motorStepPin:
	.long	3                               ## 0x3

	.globl	_triggerPin                     ## @triggerPin
.zerofill __DATA,__common,_triggerPin,4,2
	.globl	_bigTriggerPin                  ## @bigTriggerPin
.zerofill __DATA,__common,_bigTriggerPin,4,2
	.globl	_adc_key_val                    ## @adc_key_val
	.p2align	4
_adc_key_val:
	.long	30                              ## 0x1e
	.long	150                             ## 0x96
	.long	360                             ## 0x168
	.long	535                             ## 0x217
	.long	760                             ## 0x2f8

	.globl	_NUM_KEYS                       ## @NUM_KEYS
	.p2align	2
_NUM_KEYS:
	.long	5                               ## 0x5

	.globl	_key                            ## @key
	.p2align	2
_key:
	.long	5                               ## 0x5

	.section	__TEXT,__const
	.globl	_mLBolusStepsLength             ## @mLBolusStepsLength
	.p2align	2
_mLBolusStepsLength:
	.long	9                               ## 0x9

	.section	__DATA,__data
	.globl	_mLBolusSteps                   ## @mLBolusSteps
	.p2align	4
_mLBolusSteps:
	.long	0x3a83126f                      ## float 0.00100000005
	.long	0x3ba3d70a                      ## float 0.00499999989
	.long	0x3c23d70a                      ## float 0.00999999977
	.long	0x3d4ccccd                      ## float 0.0500000007
	.long	0x3dcccccd                      ## float 0.100000001
	.long	0x3f000000                      ## float 0.5
	.long	0x3f800000                      ## float 1
	.long	0x40a00000                      ## float 5
	.long	0x41200000                      ## float 10

	.globl	_mLBolus                        ## @mLBolus
	.p2align	2
_mLBolus:
	.long	0x3f000000                      ## float 0.5

	.globl	_mLBigBolus                     ## @mLBigBolus
	.p2align	2
_mLBigBolus:
	.long	0x3f800000                      ## float 1

	.globl	_mLUsed                         ## @mLUsed
.zerofill __DATA,__common,_mLUsed,4,2
	.globl	_mLBolusStepIdx                 ## @mLBolusStepIdx
	.p2align	2
_mLBolusStepIdx:
	.long	3                               ## 0x3

	.globl	_mLBolusStep                    ## @mLBolusStep
	.p2align	2
_mLBolusStep:
	.long	0x3d4ccccd                      ## float 0.0500000007

	.globl	_stepperPos                     ## @stepperPos
.zerofill __DATA,__common,_stepperPos,8,3
	.globl	_lastKeyRepeatAt                ## @lastKeyRepeatAt
.zerofill __DATA,__common,_lastKeyRepeatAt,8,3
	.globl	_keyRepeatDelay                 ## @keyRepeatDelay
	.p2align	3
_keyRepeatDelay:
	.quad	400                             ## 0x190

	.globl	_keyDebounce                    ## @keyDebounce
	.p2align	3
_keyDebounce:
	.quad	125                             ## 0x7d

	.globl	_prevKey                        ## @prevKey
	.p2align	2
_prevKey:
	.long	5                               ## 0x5

	.globl	_uiState                        ## @uiState
.zerofill __DATA,__common,_uiState,4,2
	.globl	_prevBigTrigger                 ## @prevBigTrigger
.zerofill __DATA,__common,_prevBigTrigger,4,2
	.globl	_prevTrigger                    ## @prevTrigger
.zerofill __DATA,__common,_prevTrigger,4,2
	.globl	_serialStr                      ## @serialStr
.zerofill __DATA,__common,_serialStr,80,4
	.globl	_serialStrReady                 ## @serialStrReady
.zerofill __DATA,__common,_serialStrReady,1,0
	.globl	_serialStrLen                   ## @serialStrLen
.zerofill __DATA,__common,_serialStrLen,4,2
	.comm	_lcd,4,2                        ## @lcd
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"SyringePump v2.0"

L_.str.1:                               ## @.str.1
	.asciz	"mLBolus = %f, time usecs: %lu\n"

L_.str.2:                               ## @.str.2
	.asciz	"Invalid command: ["

L_.str.3:                               ## @.str.3
	.asciz	"]\n"

	.comm	_adc_key_in,4,2                 ## @adc_key_in
L_.str.4:                               ## @.str.4
	.asciz	"Used %d.%d mL"

L_.str.5:                               ## @.str.5
	.asciz	"Bolus %d.%d mL"

L_.str.6:                               ## @.str.6
	.asciz	"Menu> BolusStep"

L_.str.7:                               ## @.str.7
	.asciz	"%d.%d"

L_.str.8:                               ## @.str.8
	.asciz	"Starting syringe pump"

	.comm	_charBuf,16,4                   ## @charBuf
	.comm	_tim,4,2                        ## @tim
.subsections_via_symbols
