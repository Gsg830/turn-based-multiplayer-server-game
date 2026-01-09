	.file	"battle.c"
	.text
	.globl	rangeHP
	.data
	.align 4
	.type	rangeHP, @object
	.size	rangeHP, 4
rangeHP:
	.long	11
	.globl	rangeDMG
	.align 4
	.type	rangeDMG, @object
	.size	rangeDMG, 4
rangeDMG:
	.long	5
	.globl	rangePWR
	.align 4
	.type	rangePWR, @object
	.size	rangePWR, 4
rangePWR:
	.long	3
	.globl	playerCount
	.bss
	.align 4
	.type	playerCount, @object
	.size	playerCount, 4
playerCount:
	.zero	4
	.section	.rodata
	.align 8
.LC0:
	.string	"No response from clients in %d seconds\n"
.LC1:
	.string	"select"
.LC2:
	.string	"a new client is connecting"
.LC3:
	.string	"accept"
.LC4:
	.string	"connection from %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$368, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -320(%rbp)
	call	bindandlisten
	movl	%eax, -348(%rbp)
	leaq	-272(%rbp), %rax
	movq	%rax, -312(%rbp)
	movl	$0, -352(%rbp)
	jmp	.L2
.L3:
	movq	-312(%rbp), %rax
	movl	-352(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -352(%rbp)
.L2:
	cmpl	$15, -352(%rbp)
	jbe	.L3
	movl	-348(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-272(%rbp,%rax,8), %rdx
	movl	-348(%rbp), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -272(%rbp,%rax,8)
	movl	-348(%rbp), %eax
	movl	%eax, -360(%rbp)
.L17:
	movq	-272(%rbp), %rax
	movq	-264(%rbp), %rdx
	movq	%rax, -144(%rbp)
	movq	%rdx, -136(%rbp)
	movq	-256(%rbp), %rax
	movq	-248(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-240(%rbp), %rax
	movq	-232(%rbp), %rdx
	movq	%rax, -112(%rbp)
	movq	%rdx, -104(%rbp)
	movq	-224(%rbp), %rax
	movq	-216(%rbp), %rdx
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	movq	-208(%rbp), %rax
	movq	-200(%rbp), %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-192(%rbp), %rax
	movq	-184(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-176(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-160(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$10, -304(%rbp)
	movq	$0, -296(%rbp)
	movl	-360(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-304(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	%eax, -344(%rbp)
	cmpl	$0, -344(%rbp)
	jne	.L4
	movl	$10, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L4:
	cmpl	$-1, -344(%rbp)
	jne	.L6
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L6:
	movl	-348(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-144(%rbp,%rax,8), %rdx
	movl	-348(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L7
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$16, -364(%rbp)
	leaq	-364(%rbp), %rdx
	leaq	-288(%rbp), %rcx
	movl	-348(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -340(%rbp)
	cmpl	$0, -340(%rbp)
	jns	.L8
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L8:
	movl	-340(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-272(%rbp,%rax,8), %rdx
	movl	-340(%rbp), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	orq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -272(%rbp,%rax,8)
	movl	-340(%rbp), %eax
	cmpl	-360(%rbp), %eax
	jle	.L9
	movl	-340(%rbp), %eax
	movl	%eax, -360(%rbp)
.L9:
	movl	-284(%rbp), %eax
	movl	%eax, %edi
	call	inet_ntoa@PLT
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-284(%rbp), %edx
	movl	-340(%rbp), %ecx
	movq	-320(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	addclient
	movq	%rax, -320(%rbp)
.L7:
	movl	$0, -356(%rbp)
	jmp	.L10
.L16:
	movl	-356(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-144(%rbp,%rax,8), %rdx
	movl	-356(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L11
	movq	-320(%rbp), %rax
	movq	%rax, -328(%rbp)
	jmp	.L12
.L15:
	movq	-328(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -356(%rbp)
	jne	.L13
	movq	-320(%rbp), %rdx
	movq	-328(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handleclient
	movl	%eax, -336(%rbp)
	cmpl	$-1, -336(%rbp)
	jne	.L19
	movq	-328(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -332(%rbp)
	movq	-328(%rbp), %rax
	movl	(%rax), %edx
	movq	-320(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	removeclient
	movq	%rax, -320(%rbp)
	movl	-332(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-272(%rbp,%rax,8), %rdx
	movl	-332(%rbp), %eax
	andl	$63, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rax
	notq	%rax
	andq	%rax, %rdx
	movslq	%esi, %rax
	movq	%rdx, -272(%rbp,%rax,8)
	movl	-332(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L19
.L13:
	movq	-328(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -328(%rbp)
.L12:
	cmpq	$0, -328(%rbp)
	jne	.L15
	jmp	.L11
.L19:
	nop
.L11:
	addl	$1, -356(%rbp)
.L10:
	movl	-356(%rbp), %eax
	cmpl	-360(%rbp), %eax
	jle	.L16
.L5:
	jmp	.L17
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC5:
	.string	"You hit %s for %d damage! \n"
	.align 8
.LC6:
	.string	"Your hitpoints: %d \nYour powermoves: %d \n%s's hitpoints: %d \n"
.LC7:
	.string	"%s hits you for %d damage! \n"
	.align 8
.LC8:
	.string	"%s powermoves you for %d damage! \n"
.LC9:
	.string	"Power attack missed\n"
.LC10:
	.string	"%s missed\n"
	.text
	.globl	damage
	.type	damage, @function
damage:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movq	%rdi, -1064(%rbp)
	movq	%rsi, -1072(%rbp)
	movq	%rdx, -1080(%rbp)
	movl	%ecx, %eax
	movb	%al, -1084(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpb	$97, -1084(%rbp)
	jne	.L21
	call	rand@PLT
	movl	rangeDMG(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$2, %eax
	movl	%eax, -1044(%rbp)
	movq	-1080(%rbp), %rax
	movl	68(%rax), %eax
	subl	-1044(%rbp), %eax
	movl	%eax, %edx
	movq	-1080(%rbp), %rax
	movl	%edx, 68(%rax)
	movq	-1072(%rbp), %rax
	movl	$0, 76(%rax)
	movq	-1080(%rbp), %rax
	movl	$1, 76(%rax)
	movq	-1080(%rbp), %rax
	leaq	32(%rax), %rsi
	movl	-1044(%rbp), %edx
	leaq	-528(%rbp), %rax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1072(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1080(%rbp), %rax
	movl	68(%rax), %esi
	movq	-1080(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-1072(%rbp), %rax
	movl	72(%rax), %ecx
	movq	-1072(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1072(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1072(%rbp), %rax
	leaq	32(%rax), %rsi
	movl	-1044(%rbp), %edx
	leaq	-528(%rbp), %rax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1080(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1072(%rbp), %rax
	movl	68(%rax), %esi
	movq	-1072(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-1080(%rbp), %rax
	movl	72(%rax), %ecx
	movq	-1080(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1080(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	jmp	.L22
.L21:
	cmpb	$112, -1084(%rbp)
	jne	.L22
	movq	-1072(%rbp), %rax
	movl	72(%rax), %eax
	leal	-1(%rax), %edx
	movq	-1072(%rbp), %rax
	movl	%edx, 72(%rax)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, -1052(%rbp)
	movl	-1052(%rbp), %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -1052(%rbp)
	cmpl	$49, -1052(%rbp)
	jle	.L23
	call	rand@PLT
	movl	rangePWR(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$6, %eax
	movl	%eax, -1048(%rbp)
	movq	-1080(%rbp), %rax
	movl	68(%rax), %eax
	subl	-1048(%rbp), %eax
	movl	%eax, %edx
	movq	-1080(%rbp), %rax
	movl	%edx, 68(%rax)
	movq	-1080(%rbp), %rax
	leaq	32(%rax), %rsi
	movl	-1048(%rbp), %edx
	leaq	-528(%rbp), %rax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1072(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1080(%rbp), %rax
	movl	68(%rax), %esi
	movq	-1080(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-1072(%rbp), %rax
	movl	72(%rax), %ecx
	movq	-1072(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1072(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1072(%rbp), %rax
	leaq	32(%rax), %rsi
	movl	-1048(%rbp), %edx
	leaq	-528(%rbp), %rax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1080(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1072(%rbp), %rax
	movl	68(%rax), %esi
	movq	-1072(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-1080(%rbp), %rax
	movl	72(%rax), %ecx
	movq	-1080(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1080(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	jmp	.L24
.L23:
	leaq	-1040(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1072(%rbp), %rax
	movl	(%rax), %eax
	leaq	-1040(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-1072(%rbp), %rax
	leaq	32(%rax), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1080(%rbp), %rax
	movl	(%rax), %eax
	leaq	-1040(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L24:
	movq	-1072(%rbp), %rax
	movl	$0, 76(%rax)
	movq	-1080(%rbp), %rax
	movl	$1, 76(%rax)
.L22:
	movq	-1080(%rbp), %rax
	movl	68(%rax), %eax
	testl	%eax, %eax
	jg	.L25
	movq	-1072(%rbp), %rax
	movl	80(%rax), %eax
	leal	1(%rax), %edx
	movq	-1072(%rbp), %rax
	movl	%edx, 80(%rax)
	movq	-1072(%rbp), %rdx
	movq	-1064(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_leaderboard
	movl	$1, %eax
	jmp	.L26
.L25:
	movl	$0, %eax
.L26:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	damage, .-damage
	.section	.rodata
.LC11:
	.string	"You Said: "
.LC12:
	.string	"\n"
.LC13:
	.string	"%s said %s \n"
.LC14:
	.string	"\nSpeak: "
.LC15:
	.string	"%s gives up. You win!\n"
	.align 8
.LC16:
	.string	"You are no match for %s. You scurry away...\n"
.LC17:
	.string	"%s and %s no longer matched"
.LC18:
	.string	"Disconnect from %s\n"
.LC19:
	.string	"Goodbye %s\r\n"
.LC20:
	.string	"--%s Dropped. You win!\n"
	.text
	.globl	handleclient
	.type	handleclient, @function
handleclient:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$960, %rsp
	movq	%rdi, -952(%rbp)
	movq	%rsi, -960(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	leaq	-784(%rbp), %rcx
	movl	$255, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -932(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	cmpl	$0, -932(%rbp)
	jle	.L29
	movl	-932(%rbp), %eax
	cltq
	movb	$0, -784(%rbp,%rax)
	movq	-952(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$1, %eax
	jne	.L30
	movq	-952(%rbp), %rax
	movl	76(%rax), %eax
	cmpl	$1, %eax
	jne	.L30
	movq	-952(%rbp), %rax
	movl	84(%rax), %eax
	cmpl	$1, %eax
	jne	.L30
	movq	-952(%rbp), %rax
	movl	$0, 84(%rax)
	movl	-932(%rbp), %eax
	cltq
	movb	$0, -784(%rbp,%rax)
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	movl	$10, %edx
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	-932(%rbp), %eax
	movslq	%eax, %rdx
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	leaq	-784(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, %edx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	leaq	32(%rax), %rsi
	leaq	-784(%rbp), %rdx
	leaq	-528(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printInstructions
	jmp	.L31
.L30:
	movq	-952(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$1, %eax
	jne	.L31
	movq	-952(%rbp), %rax
	movl	76(%rax), %eax
	cmpl	$1, %eax
	jne	.L31
	movq	-952(%rbp), %rax
	movl	84(%rax), %eax
	testl	%eax, %eax
	jne	.L31
	cmpl	$2, -932(%rbp)
	jne	.L31
	movzbl	-784(%rbp), %eax
	cmpb	$97, %al
	jne	.L32
	movq	-952(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rsi
	movl	$97, %ecx
	movq	%rax, %rdi
	call	damage
	movl	%eax, -936(%rbp)
	movq	-952(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printInstructions
	jmp	.L33
.L32:
	movzbl	-784(%rbp), %eax
	cmpb	$112, %al
	jne	.L34
	movq	-952(%rbp), %rax
	movl	72(%rax), %eax
	testl	%eax, %eax
	jle	.L34
	movq	-952(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rsi
	movl	$112, %ecx
	movq	%rax, %rdi
	call	damage
	movl	%eax, -936(%rbp)
	movq	-952(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printInstructions
	jmp	.L33
.L34:
	movzbl	-784(%rbp), %eax
	cmpb	$115, %al
	jne	.L33
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	movl	$8, %edx
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	movl	$1, 84(%rax)
.L33:
	cmpl	$1, -936(%rbp)
	jne	.L31
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	32(%rax), %rdx
	leaq	-896(%rbp), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-896(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	leaq	-896(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	leaq	32(%rax), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	32(%rax), %rdx
	movq	-952(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-952(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-952(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-952(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -904(%rbp)
	movq	-904(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-904(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-904(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-952(%rbp), %rax
	movq	$0, 24(%rax)
	leaq	-960(%rbp), %rax
	movq	%rax, -928(%rbp)
	jmp	.L35
.L39:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	jne	.L36
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L36
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L37
	movq	-928(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L38
.L37:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movl	(%rax), %edx
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L36
	movq	-928(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L38
.L36:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -928(%rbp)
.L35:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L39
.L38:
	leaq	-960(%rbp), %rax
	movq	%rax, -928(%rbp)
	jmp	.L40
.L44:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	jne	.L41
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-904(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L41
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L42
	movq	-928(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-904(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L31
.L42:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movl	(%rax), %edx
	movq	-904(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L41
	movq	-928(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-904(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L31
.L41:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -928(%rbp)
.L40:
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L44
.L31:
	movl	$0, %eax
	jmp	.L52
.L29:
	cmpl	$0, -932(%rbp)
	jg	.L46
	movq	-952(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-952(%rbp), %rax
	leaq	32(%rax), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	movq	-960(%rbp), %rax
	leaq	-528(%rbp), %rsi
	movl	$-2, %ecx
	movq	%rax, %rdi
	call	broadcast
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	leaq	32(%rax), %rdx
	leaq	-896(%rbp), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-896(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-952(%rbp), %rax
	movl	(%rax), %eax
	leaq	-896(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-952(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -912(%rbp)
	movq	-952(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-952(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-952(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-912(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-912(%rbp), %rax
	movq	-952(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-912(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-952(%rbp), %rax
	movq	$0, 24(%rax)
	leaq	-960(%rbp), %rax
	movq	%rax, -920(%rbp)
	jmp	.L47
.L51:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	jne	.L48
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-912(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L48
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L49
	movq	-920(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-912(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L50
.L49:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movl	(%rax), %edx
	movq	-912(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L48
	movq	-920(%rbp), %rax
	movq	(%rax), %rcx
	movq	-960(%rbp), %rax
	movq	-912(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L50
.L48:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -920(%rbp)
.L47:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L51
.L50:
	movl	$-1, %eax
	jmp	.L52
.L46:
	movl	$0, %eax
.L52:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	handleclient, .-handleclient
	.section	.rodata
.LC21:
	.string	"socket"
.LC22:
	.string	"setsockopt"
.LC23:
	.string	"bind"
.LC24:
	.string	"listen"
	.text
	.globl	bindandlisten
	.type	bindandlisten, @function
bindandlisten:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L55
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L55:
	movl	$1, -40(%rbp)
	leaq	-40(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	$4, %r8d
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	setsockopt@PLT
	cmpl	$-1, %eax
	jne	.L56
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L56:
	leaq	-32(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$52688, %edi
	call	htons@PLT
	movw	%ax, -30(%rbp)
	leaq	-32(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	testl	%eax, %eax
	je	.L57
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L57:
	movl	-36(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen@PLT
	testl	%eax, %eax
	je	.L58
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L58:
	movl	-36(%rbp), %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L60
	call	__stack_chk_fail@PLT
.L60:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	bindandlisten, .-bindandlisten
	.section	.rodata
.LC25:
	.string	"malloc"
.LC26:
	.string	"Adding client %s\n"
	.align 8
.LC27:
	.string	"Enter your username (maximum 30 chars): "
.LC28:
	.string	"read"
	.align 8
.LC29:
	.string	"**%s entered the server**, %d players online\n"
	.text
	.type	addclient, @function
addclient:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$608, %rsp
	movq	%rdi, -600(%rbp)
	movl	%esi, -604(%rbp)
	movl	%edx, -608(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -568(%rbp)
	cmpq	$0, -568(%rbp)
	jne	.L62
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L62:
	movl	-608(%rbp), %eax
	movl	%eax, %edi
	call	inet_ntoa@PLT
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	playerCount(%rip), %eax
	addl	$1, %eax
	movl	%eax, playerCount(%rip)
	movq	-568(%rbp), %rax
	movl	-604(%rbp), %edx
	movl	%edx, (%rax)
	movq	-568(%rbp), %rax
	movl	-608(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-600(%rbp), %rdx
	movq	-568(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-568(%rbp), %rax
	movq	%rax, -600(%rbp)
	movq	-568(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-568(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-568(%rbp), %rax
	movl	$0, 64(%rax)
	movq	-568(%rbp), %rax
	movl	$0, 76(%rax)
	movq	-568(%rbp), %rax
	movl	$0, 80(%rax)
	movq	-568(%rbp), %rax
	movl	$0, 84(%rax)
	leaq	-528(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-600(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-560(%rbp), %rcx
	movl	-604(%rbp), %eax
	movl	$31, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -580(%rbp)
	cmpl	$0, -580(%rbp)
	jg	.L63
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L63:
	movl	-580(%rbp), %eax
	subl	$1, %eax
	cltq
	movb	$0, -560(%rbp,%rax)
	movq	-568(%rbp), %rax
	leaq	32(%rax), %rcx
	leaq	-560(%rbp), %rax
	movl	$32, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	strncpy@PLT
	movl	playerCount(%rip), %edx
	movq	-568(%rbp), %rax
	leaq	32(%rax), %rsi
	leaq	-528(%rbp), %rax
	movl	%edx, %ecx
	movq	%rsi, %rdx
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	movq	-600(%rbp), %rax
	leaq	-528(%rbp), %rsi
	movl	$-2, %ecx
	movq	%rax, %rdi
	call	broadcast
	movl	playerCount(%rip), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L64
	leaq	-600(%rbp), %rax
	movq	%rax, -576(%rbp)
	jmp	.L65
.L68:
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	jne	.L66
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	movq	-568(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L66
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L67
	movq	-576(%rbp), %rax
	movq	(%rax), %rcx
	movq	-600(%rbp), %rax
	movq	-568(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L64
.L67:
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movl	(%rax), %edx
	movq	-568(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L66
	movq	-576(%rbp), %rax
	movq	(%rax), %rcx
	movq	-600(%rbp), %rax
	movq	-568(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	matchplayers
	jmp	.L64
.L66:
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -576(%rbp)
.L65:
	movq	-576(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L68
.L64:
	movq	-600(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L70
	call	__stack_chk_fail@PLT
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	addclient, .-addclient
	.section	.rodata
.LC30:
	.string	"Removing client %d %s\n"
	.align 8
.LC31:
	.string	"Trying to remove fd %d, but I don't know about it\n"
	.text
	.type	removeclient, @function
removeclient:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L72
.L74:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -16(%rbp)
.L72:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L73
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L74
.L73:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L75
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	inet_ntoa@PLT
	movq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L76
.L75:
	movq	stderr(%rip), %rax
	movl	-28(%rbp), %edx
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L76:
	movl	playerCount(%rip), %eax
	subl	$1, %eax
	movl	%eax, playerCount(%rip)
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	removeclient, .-removeclient
	.section	.rodata
.LC32:
	.string	"Writing Error"
	.text
	.type	broadcast, @function
broadcast:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L79
.L81:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -40(%rbp)
	je	.L80
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L80
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	nop
.L80:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L79:
	cmpq	$0, -8(%rbp)
	jne	.L81
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	broadcast, .-broadcast
	.section	.rodata
	.align 8
.LC33:
	.string	"Waiting for %s to strike.... \n"
	.align 8
.LC34:
	.string	"Your hitpoints: %d \n \n%s's hitpoints: %d \n"
	.align 8
.LC35:
	.string	"(s) to speak to the other player\n(a) to do a regular attack (2-6 damage)\n"
	.align 8
.LC36:
	.string	"Your hitpoints: %d \nYour powermoves: %d \n \n%s's hitpoints: %d \n"
	.align 8
.LC37:
	.string	"(s) to speak to the other player\n(a) to do a regular attack (2-6 damage)\n(p) to do a powermove with a 50%% of hitting (6-18 damage)\n\n"
	.text
	.globl	printInstructions
	.type	printInstructions, @function
printInstructions:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -536(%rbp)
	movq	%rsi, -544(%rbp)
	movq	%rdx, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-552(%rbp), %rax
	movl	76(%rax), %eax
	testl	%eax, %eax
	jne	.L83
	movq	-544(%rbp), %rax
	leaq	32(%rax), %rdx
	leaq	-528(%rbp), %rax
	leaq	.LC33(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L83:
	movq	-544(%rbp), %rax
	movl	76(%rax), %eax
	testl	%eax, %eax
	je	.L87
	movq	-544(%rbp), %rax
	movl	72(%rax), %eax
	testl	%eax, %eax
	jg	.L85
	movq	-552(%rbp), %rax
	movl	68(%rax), %esi
	movq	-552(%rbp), %rax
	leaq	32(%rax), %rcx
	movq	-544(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r8d
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-544(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-528(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-544(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	jmp	.L87
.L85:
	movq	-552(%rbp), %rax
	movl	68(%rax), %esi
	movq	-552(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-544(%rbp), %rax
	movl	72(%rax), %ecx
	movq	-544(%rbp), %rax
	movl	68(%rax), %edx
	leaq	-528(%rbp), %rax
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-544(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-528(%rbp), %rax
	leaq	.LC37(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-544(%rbp), %rax
	movl	(%rax), %eax
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L87:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L86
	call	__stack_chk_fail@PLT
.L86:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	printInstructions, .-printInstructions
	.section	.rodata
	.align 8
.LC38:
	.string	"player 1: %s, is already in a match\n"
	.align 8
.LC39:
	.string	"player 2: %s, is already in a match\n"
	.align 8
.LC40:
	.string	"players: %s & %s cannot be matched up\n"
.LC41:
	.string	"%s engages %s!\n"
.LC42:
	.string	"You engage %s!\n\n"
	.text
	.globl	matchplayers
	.type	matchplayers, @function
matchplayers:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$568, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -552(%rbp)
	movq	%rsi, -560(%rbp)
	movq	%rdx, -568(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-560(%rbp), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	je	.L89
	movq	-560(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L88
.L89:
	movq	-568(%rbp), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	je	.L91
	movq	-568(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L88
.L91:
	movq	-560(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -568(%rbp)
	jne	.L92
	movq	-568(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -560(%rbp)
	jne	.L92
	movq	-568(%rbp), %rax
	leaq	32(%rax), %rdx
	movq	-560(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L88
.L92:
	movq	-568(%rbp), %rax
	leaq	32(%rax), %rcx
	movq	-560(%rbp), %rax
	leaq	32(%rax), %rdx
	leaq	-544(%rbp), %rax
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-560(%rbp), %rax
	movl	(%rax), %ebx
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	leaq	-544(%rbp), %rsi
	movq	-552(%rbp), %rax
	movl	%ebx, %ecx
	movq	%rax, %rdi
	call	broadcast
	movq	-560(%rbp), %rax
	movq	-568(%rbp), %rdx
	movq	%rdx, 24(%rax)
	call	rand@PLT
	movl	rangeHP(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	leal	20(%rax), %edx
	movq	-560(%rbp), %rax
	movl	%edx, 68(%rax)
	call	rand@PLT
	movl	rangePWR(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	leal	1(%rax), %edx
	movq	-560(%rbp), %rax
	movl	%edx, 72(%rax)
	movq	-560(%rbp), %rax
	movl	$1, 76(%rax)
	movq	-560(%rbp), %rax
	movl	$1, 64(%rax)
	movq	-568(%rbp), %rax
	movq	-560(%rbp), %rdx
	movq	%rdx, 24(%rax)
	call	rand@PLT
	movl	rangeHP(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	leal	20(%rax), %edx
	movq	-568(%rbp), %rax
	movl	%edx, 68(%rax)
	call	rand@PLT
	movl	rangePWR(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	leal	1(%rax), %edx
	movq	-568(%rbp), %rax
	movl	%edx, 72(%rax)
	movq	-568(%rbp), %rax
	movl	$1, 64(%rax)
	movq	-560(%rbp), %rax
	movq	24(%rax), %rax
	leaq	32(%rax), %rdx
	leaq	-544(%rbp), %rax
	leaq	.LC42(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-560(%rbp), %rax
	movl	(%rax), %eax
	leaq	-544(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-568(%rbp), %rax
	movq	24(%rax), %rax
	leaq	32(%rax), %rdx
	leaq	-544(%rbp), %rax
	leaq	.LC42(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-568(%rbp), %rax
	movl	(%rax), %eax
	leaq	-544(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-568(%rbp), %rdx
	movq	-560(%rbp), %rcx
	movq	-552(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printInstructions
.L88:
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L93
	call	__stack_chk_fail@PLT
.L93:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	matchplayers, .-matchplayers
	.globl	leaderboard
	.data
	.align 32
	.type	leaderboard, @object
	.size	leaderboard, 99
leaderboard:
	.string	"-"
	.zero	31
	.string	"-"
	.zero	31
	.string	"-"
	.zero	31
	.globl	winsNumber
	.bss
	.align 8
	.type	winsNumber, @object
	.size	winsNumber, 12
winsNumber:
	.zero	12
	.section	.rodata
	.align 8
.LC43:
	.string	"\n\nLeaderboard:\n1: %s with %d wins\n2: %s with %d wins\n3: %s with %d wins\n\n"
	.text
	.globl	print_leaderboard
	.type	print_leaderboard, @function
print_leaderboard:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%rdi, -1048(%rbp)
	movq	%rsi, -1056(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-1056(%rbp), %rax
	movl	80(%rax), %edx
	movl	winsNumber(%rip), %eax
	cmpl	%eax, %edx
	jle	.L95
	movl	4+winsNumber(%rip), %eax
	movl	%eax, 8+winsNumber(%rip)
	movl	winsNumber(%rip), %eax
	movl	%eax, 4+winsNumber(%rip)
	movq	-1056(%rbp), %rax
	movl	80(%rax), %eax
	movl	%eax, winsNumber(%rip)
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rsi
	leaq	66+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	leaderboard(%rip), %rax
	movq	%rax, %rsi
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L96
.L95:
	movq	-1056(%rbp), %rax
	movl	80(%rax), %edx
	movl	4+winsNumber(%rip), %eax
	cmpl	%eax, %edx
	jle	.L97
	movl	4+winsNumber(%rip), %eax
	movl	%eax, 8+winsNumber(%rip)
	movq	-1056(%rbp), %rax
	movl	80(%rax), %eax
	movl	%eax, 4+winsNumber(%rip)
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rsi
	leaq	66+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	33+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L96
.L97:
	movq	-1056(%rbp), %rax
	movl	80(%rax), %edx
	movl	8+winsNumber(%rip), %eax
	cmpl	%eax, %edx
	jle	.L96
	movq	-1056(%rbp), %rax
	movl	80(%rax), %eax
	movl	%eax, 8+winsNumber(%rip)
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	leaq	66+leaderboard(%rip), %rax
	movq	%rax, %rdi
	call	strncpy@PLT
.L96:
	movl	8+winsNumber(%rip), %ecx
	movl	4+winsNumber(%rip), %esi
	movl	winsNumber(%rip), %edx
	leaq	-1040(%rbp), %rax
	pushq	%rcx
	leaq	66+leaderboard(%rip), %rcx
	pushq	%rcx
	movl	%esi, %r9d
	leaq	33+leaderboard(%rip), %r8
	movl	%edx, %ecx
	leaq	leaderboard(%rip), %rdx
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	addq	$16, %rsp
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	leaq	-1040(%rbp), %rsi
	movq	-1048(%rbp), %rax
	movl	$-2, %ecx
	movq	%rax, %rdi
	call	broadcast
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L98
	call	__stack_chk_fail@PLT
.L98:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	print_leaderboard, .-print_leaderboard
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
