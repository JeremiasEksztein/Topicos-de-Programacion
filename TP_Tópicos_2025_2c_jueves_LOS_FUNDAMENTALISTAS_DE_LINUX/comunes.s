	.file	"comunes.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\33[1m\33[1;31mError: delimitador incorrecto, vuelva a intenta\12\33[0m\0"
	.align 8
.LC1:
	.ascii "\33[1m\33[1;31mError: mes incorrecto, vuelva a intentar\12\33[0m\0"
	.align 8
.LC2:
	.ascii "\33[1m\33[1;31mError: fecha fuera de rango [2016-12 ; 2025-07], vuelva a intentar\12\33[0m\0"
	.text
	.globl	validarFechaForm
	.def	validarFechaForm;	.scl	2;	.type	32;	.endef
	.seh_proc	validarFechaForm
validarFechaForm:
.LFB17:
	.file 1 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/comunes.c"
	.loc 1 10 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 13 11
	movq	16(%rbp), %rax
	addq	$4, %rax
	movzbl	(%rax), %eax
	.loc 1 13 7
	cmpb	$45, %al
	je	.L2
	.loc 1 14 9
	leaq	.LC0(%rip), %rcx
	call	printf
	.loc 1 15 16
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 18 14
	movq	16(%rbp), %rax
	addq	$5, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	.loc 1 18 18
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 18 28
	movq	16(%rbp), %rax
	addq	$6, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 18 23
	addl	%edx, %eax
	.loc 1 18 9
	subl	$528, %eax
	movl	%eax, -4(%rbp)
	.loc 1 20 7
	cmpl	$0, -4(%rbp)
	js	.L4
	.loc 1 20 16 discriminator 1
	cmpl	$12, -4(%rbp)
	jle	.L5
.L4:
	.loc 1 21 9
	leaq	.LC1(%rip), %rcx
	call	printf
	.loc 1 22 16
	movl	$0, %eax
	jmp	.L3
.L5:
	.loc 1 25 15
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 25 19
	imull	$100000, %eax, %edx
	.loc 1 25 33
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 25 37
	imull	$10000, %eax, %eax
	.loc 1 25 28
	addl	%eax, %edx
	.loc 1 25 50
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 25 54
	imull	$1000, %eax, %eax
	.loc 1 25 45
	addl	%eax, %edx
	.loc 1 25 66
	movq	16(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 25 70
	imull	$100, %eax, %eax
	.loc 1 25 61
	addl	%edx, %eax
	.loc 1 25 76
	subl	$5332800, %eax
	.loc 1 25 9
	addl	%eax, -4(%rbp)
	.loc 1 27 7
	cmpl	$201611, -4(%rbp)
	jle	.L6
	.loc 1 27 21 discriminator 1
	cmpl	$202507, -4(%rbp)
	jle	.L7
.L6:
	.loc 1 28 9
	leaq	.LC2(%rip), %rcx
	call	printf
	.loc 1 29 16
	movl	$0, %eax
	jmp	.L3
.L7:
	.loc 1 32 12
	movl	$1, %eax
.L3:
	.loc 1 33 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "\33[1m\33[1;32m%s\12\0"
.LC4:
	.ascii "\33[0;37m%-*s\11 | \0"
.LC5:
	.ascii "%-*s\11 |\0"
.LC6:
	.ascii "\0"
.LC7:
	.ascii "\33[0m\0"
	.text
	.globl	imprimirHeaderTabla
	.def	imprimirHeaderTabla;	.scl	2;	.type	32;	.endef
	.seh_proc	imprimirHeaderTabla
imprimirHeaderTabla:
.LFB18:
	.loc 1 36 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	%r9d, 40(%rbp)
	.loc 1 37 12
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 38 5
	movq	16(%rbp), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	.loc 1 39 5
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 42 11
	movl	$1, -4(%rbp)
	.loc 1 42 5
	jmp	.L9
.L10:
	.loc 1 43 47 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 43 9 discriminator 3
	movq	(%rax), %rdx
	.loc 1 43 36 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	32(%rbp), %rax
	addq	%rcx, %rax
	.loc 1 43 9 discriminator 3
	movl	(%rax), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC5(%rip), %rcx
	call	printf
	.loc 1 44 24 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 1 44 13 discriminator 3
	addl	%eax, -8(%rbp)
	.loc 1 42 25 discriminator 3
	addl	$1, -4(%rbp)
.L9:
	.loc 1 42 5 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L10
	.loc 1 47 5
	leaq	.LC6(%rip), %rcx
	call	puts
	.loc 1 48 14
	movl	40(%rbp), %eax
	sall	$2, %eax
	.loc 1 48 9
	addl	%eax, -8(%rbp)
	.loc 1 49 5
	jmp	.L11
.L12:
	.loc 1 50 9 discriminator 2
	movl	$45, %ecx
	call	putchar
	.loc 1 49 23 discriminator 2
	subl	$1, -8(%rbp)
.L11:
	.loc 1 49 5 discriminator 1
	cmpl	$0, -8(%rbp)
	jg	.L12
	.loc 1 53 5
	leaq	.LC7(%rip), %rcx
	call	puts
	.loc 1 54 1
	nop
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "%s|%s|%s|%s|%s|%s|%s|%s\12\0"
	.text
	.globl	parsearEscrDivisiones
	.def	parsearEscrDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	parsearEscrDivisiones
parsearEscrDivisiones:
.LFB19:
	.loc 1 57 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$104, %rsp
	.seh_stackalloc	104
	.cfi_def_cfa_offset 128
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 0
	.seh_endprologue
	movq	%rcx, 0(%rbp)
	movq	%rdx, 8(%rbp)
	.loc 1 58 20
	movq	8(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 60 149
	movq	-40(%rbp), %rax
	leaq	185(%rax), %r10
	.loc 1 60 136
	movq	-40(%rbp), %rax
	leaq	170(%rax), %r9
	.loc 1 60 118
	movq	-40(%rbp), %rax
	leaq	152(%rax), %r8
	.loc 1 60 101
	movq	-40(%rbp), %rax
	leaq	134(%rax), %rcx
	.loc 1 60 85
	movq	-40(%rbp), %rax
	leaq	116(%rax), %rdx
	.loc 1 60 72
	movq	-40(%rbp), %rax
	addq	$76, %rax
	.loc 1 60 61
	movq	-40(%rbp), %r11
	leaq	15(%r11), %rbx
	.loc 1 60 51
	movq	-40(%rbp), %r11
	.loc 1 60 5
	movq	%r10, 72(%rsp)
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rbx, %r9
	movq	%r11, %r8
	leaq	.LC8(%rip), %rdx
	movq	0(%rbp), %rcx
	call	fprintf
	.loc 1 61 12
	movl	$0, %eax
	.loc 1 62 1
	addq	$104, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -88
	ret
	.cfi_endproc
.LFE19:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "\33[1m\33[1;36m%s\33[0;37m|\33[1;33m%s\33[0;37m|\33[1;32m%s\33[0;37m|\33[1;31m%s\33[0;37m|\33[1;36m%s\33[0;37m|\33[1;33m%s\33[0;37m|\33[1;32m%s\33[0;37m|\33[1;31m%s\33[0m\12\0"
	.text
	.globl	mostrarDivisiones
	.def	mostrarDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarDivisiones
mostrarDivisiones:
.LFB20:
	.loc 1 65 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%r15
	.seh_pushreg	%r15
	.cfi_def_cfa_offset 24
	.cfi_offset 15, -24
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 32
	.cfi_offset 14, -32
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 40
	.cfi_offset 13, -40
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -48
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	subq	$120, %rsp
	.seh_stackalloc	120
	.cfi_def_cfa_offset 192
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 64
	.seh_endprologue
	movq	%rcx, 64(%rbp)
	.loc 1 66 20
	movq	64(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 69 14
	movl	waitJ.4669(%rip), %eax
	.loc 1 69 7
	cmpl	$126, %eax
	jne	.L16
	.loc 1 70 9
	call	getchar
	.loc 1 71 15
	movl	$0, waitJ.4669(%rip)
.L16:
	.loc 1 78 135
	movq	-24(%rbp), %rax
	leaq	185(%rax), %r14
	.loc 1 78 122
	movq	-24(%rbp), %rax
	leaq	170(%rax), %r13
	.loc 1 78 104
	movq	-24(%rbp), %rax
	leaq	152(%rax), %r12
	.loc 1 78 87
	movq	-24(%rbp), %rax
	leaq	134(%rax), %rdi
	.loc 1 78 71
	movq	-24(%rbp), %rax
	leaq	116(%rax), %rsi
	.loc 1 78 58
	movq	-24(%rbp), %rax
	leaq	76(%rax), %rbx
	.loc 1 78 47
	movq	-24(%rbp), %rax
	addq	$15, %rax
	movq	%rax, -40(%rbp)
	.loc 1 78 37
	movq	-24(%rbp), %r15
	.loc 1 74 5
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL0:
	movq	%r14, 72(%rsp)
	movq	%r13, 64(%rsp)
	movq	%r12, 56(%rsp)
	movq	%rdi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	-40(%rbp), %r9
	movq	%r15, %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	.loc 1 79 10
	movl	waitJ.4669(%rip), %eax
	addl	$1, %eax
	movl	%eax, waitJ.4669(%rip)
	.loc 1 80 1
	nop
	addq	$120, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rdi
	.cfi_restore 5
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%r15
	.cfi_restore 15
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -56
	ret
	.cfi_endproc
.LFE20:
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "%s | %s | %s | %s\12\0"
	.text
	.globl	parsearEscrPromedio
	.def	parsearEscrPromedio;	.scl	2;	.type	32;	.endef
	.seh_proc	parsearEscrPromedio
parsearEscrPromedio:
.LFB21:
	.loc 1 83 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 84 18
	movq	24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 86 81
	movq	-8(%rbp), %rax
	leaq	63(%rax), %rdx
	.loc 1 86 64
	movq	-8(%rbp), %rax
	addq	$45, %rax
	.loc 1 86 53
	movq	-8(%rbp), %rcx
	leaq	30(%rcx), %r8
	.loc 1 86 43
	movq	-8(%rbp), %rcx
	.loc 1 86 5
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC10(%rip), %rdx
	movq	16(%rbp), %rcx
	call	fprintf
	.loc 1 88 12
	movl	$0, %eax
	.loc 1 89 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.seh_endproc
	.globl	parsearEscrAperturas
	.def	parsearEscrAperturas;	.scl	2;	.type	32;	.endef
	.seh_proc	parsearEscrAperturas
parsearEscrAperturas:
.LFB22:
	.loc 1 92 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$104, %rsp
	.seh_stackalloc	104
	.cfi_def_cfa_offset 128
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 0
	.seh_endprologue
	movq	%rcx, 0(%rbp)
	movq	%rdx, 8(%rbp)
	.loc 1 93 19
	movq	8(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 95 150
	movq	-40(%rbp), %rax
	leaq	200(%rax), %r10
	.loc 1 95 132
	movq	-40(%rbp), %rax
	leaq	182(%rax), %r9
	.loc 1 95 115
	movq	-40(%rbp), %rax
	leaq	164(%rax), %r8
	.loc 1 95 99
	movq	-40(%rbp), %rax
	leaq	146(%rax), %rcx
	.loc 1 95 85
	movq	-40(%rbp), %rax
	leaq	116(%rax), %rdx
	.loc 1 95 72
	movq	-40(%rbp), %rax
	addq	$76, %rax
	.loc 1 95 61
	movq	-40(%rbp), %r11
	leaq	15(%r11), %rbx
	.loc 1 95 51
	movq	-40(%rbp), %r11
	.loc 1 95 5
	movq	%r10, 72(%rsp)
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rbx, %r9
	movq	%r11, %r8
	leaq	.LC8(%rip), %rdx
	movq	0(%rbp), %rcx
	call	fprintf
	.loc 1 96 12
	movl	$0, %eax
	.loc 1 97 1
	addq	$104, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -88
	ret
	.cfi_endproc
.LFE22:
	.seh_endproc
	.globl	mostrarAperturas
	.def	mostrarAperturas;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarAperturas
mostrarAperturas:
.LFB23:
	.loc 1 100 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%r15
	.seh_pushreg	%r15
	.cfi_def_cfa_offset 24
	.cfi_offset 15, -24
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 32
	.cfi_offset 14, -32
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 40
	.cfi_offset 13, -40
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -48
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	subq	$120, %rsp
	.seh_stackalloc	120
	.cfi_def_cfa_offset 192
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 64
	.seh_endprologue
	movq	%rcx, 64(%rbp)
	.loc 1 101 19
	movq	64(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 104 10
	movl	i.4684(%rip), %eax
	.loc 1 104 7
	cmpl	$261, %eax
	jne	.L22
	.loc 1 105 9
	call	getchar
	.loc 1 106 11
	movl	$0, i.4684(%rip)
.L22:
	.loc 1 113 136
	movq	-24(%rbp), %rax
	leaq	200(%rax), %r14
	.loc 1 113 118
	movq	-24(%rbp), %rax
	leaq	182(%rax), %r13
	.loc 1 113 101
	movq	-24(%rbp), %rax
	leaq	164(%rax), %r12
	.loc 1 113 85
	movq	-24(%rbp), %rax
	leaq	146(%rax), %rdi
	.loc 1 113 71
	movq	-24(%rbp), %rax
	leaq	116(%rax), %rsi
	.loc 1 113 58
	movq	-24(%rbp), %rax
	leaq	76(%rax), %rbx
	.loc 1 113 47
	movq	-24(%rbp), %rax
	addq	$15, %rax
	movq	%rax, -40(%rbp)
	.loc 1 113 37
	movq	-24(%rbp), %r15
	.loc 1 109 5
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
.LVL1:
	movq	%r14, 72(%rsp)
	movq	%r13, 64(%rsp)
	movq	%r12, 56(%rsp)
	movq	%rdi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	-40(%rbp), %r9
	movq	%r15, %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	.loc 1 115 6
	movl	i.4684(%rip), %eax
	addl	$1, %eax
	movl	%eax, i.4684(%rip)
	.loc 1 116 1
	nop
	addq	$120, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%rsi
	.cfi_restore 4
	popq	%rdi
	.cfi_restore 5
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%r15
	.cfi_restore 15
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -56
	ret
	.cfi_endproc
.LFE23:
	.seh_endproc
	.globl	parsearEscrAlquileres
	.def	parsearEscrAlquileres;	.scl	2;	.type	32;	.endef
	.seh_proc	parsearEscrAlquileres
parsearEscrAlquileres:
.LFB24:
	.loc 1 119 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 120 20
	movq	24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 122 94
	movq	-8(%rbp), %rax
	leaq	66(%rax), %rdx
	.loc 1 122 75
	movq	-8(%rbp), %rax
	addq	$48, %rax
	.loc 1 122 59
	movq	-8(%rbp), %rcx
	leaq	30(%rcx), %r8
	.loc 1 122 45
	movq	-8(%rbp), %rcx
	.loc 1 122 5
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC10(%rip), %rdx
	movq	16(%rbp), %rcx
	call	fprintf
	.loc 1 124 12
	movl	$0, %eax
	.loc 1 125 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.seh_endproc
.lcomm waitJ.4669,4,4
.lcomm i.4684,4,4
.Letext0:
	.file 2 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/crtdefs.h"
	.file 3 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdio.h"
	.file 4 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/malloc.h"
	.file 6 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/ctype.h"
	.file 7 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/comunes.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0xe5c
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C89 8.1.0 -mtune=core2 -march=nocona -g -std=c90\0"
	.byte	0x1
	.ascii "C:\\Users\\LENOVO\\OneDrive\\Escritorio\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\\comunes.c\0"
	.ascii "C:\\\\Users\\\\LENOVO\\\\OneDrive\\\\Escritorio\\\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x2
	.byte	0x62
	.byte	0x18
	.long	0x160
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x4
	.long	0x160
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x5
	.ascii "pthreadlocinfo\0"
	.byte	0x2
	.word	0x1a8
	.byte	0x28
	.long	0x1a6
	.uleb128 0x6
	.byte	0x8
	.long	0x1ac
	.uleb128 0x7
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x2
	.word	0x1bc
	.byte	0x10
	.long	0x356
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1bd
	.byte	0x7
	.long	0x17b
	.byte	0
	.uleb128 0x9
	.ascii "lc_codepage\0"
	.byte	0x2
	.word	0x1be
	.byte	0x10
	.long	0x4a3
	.byte	0x4
	.uleb128 0x9
	.ascii "lc_collate_cp\0"
	.byte	0x2
	.word	0x1bf
	.byte	0x10
	.long	0x4a3
	.byte	0x8
	.uleb128 0x9
	.ascii "lc_handle\0"
	.byte	0x2
	.word	0x1c0
	.byte	0x11
	.long	0x4b3
	.byte	0xc
	.uleb128 0x9
	.ascii "lc_id\0"
	.byte	0x2
	.word	0x1c1
	.byte	0x9
	.long	0x4d8
	.byte	0x24
	.uleb128 0x9
	.ascii "lc_category\0"
	.byte	0x2
	.word	0x1c7
	.byte	0x5
	.long	0x4e8
	.byte	0x48
	.uleb128 0xa
	.ascii "lc_clike\0"
	.byte	0x2
	.word	0x1c8
	.byte	0x7
	.long	0x17b
	.word	0x108
	.uleb128 0xa
	.ascii "mb_cur_max\0"
	.byte	0x2
	.word	0x1c9
	.byte	0x7
	.long	0x17b
	.word	0x10c
	.uleb128 0xa
	.ascii "lconv_intl_refcount\0"
	.byte	0x2
	.word	0x1ca
	.byte	0x8
	.long	0x49d
	.word	0x110
	.uleb128 0xa
	.ascii "lconv_num_refcount\0"
	.byte	0x2
	.word	0x1cb
	.byte	0x8
	.long	0x49d
	.word	0x118
	.uleb128 0xa
	.ascii "lconv_mon_refcount\0"
	.byte	0x2
	.word	0x1cc
	.byte	0x8
	.long	0x49d
	.word	0x120
	.uleb128 0xa
	.ascii "lconv\0"
	.byte	0x2
	.word	0x1cd
	.byte	0x11
	.long	0x4ff
	.word	0x128
	.uleb128 0xa
	.ascii "ctype1_refcount\0"
	.byte	0x2
	.word	0x1ce
	.byte	0x8
	.long	0x49d
	.word	0x130
	.uleb128 0xa
	.ascii "ctype1\0"
	.byte	0x2
	.word	0x1cf
	.byte	0x13
	.long	0x505
	.word	0x138
	.uleb128 0xa
	.ascii "pctype\0"
	.byte	0x2
	.word	0x1d0
	.byte	0x19
	.long	0x50b
	.word	0x140
	.uleb128 0xa
	.ascii "pclmap\0"
	.byte	0x2
	.word	0x1d1
	.byte	0x18
	.long	0x511
	.word	0x148
	.uleb128 0xa
	.ascii "pcumap\0"
	.byte	0x2
	.word	0x1d2
	.byte	0x18
	.long	0x511
	.word	0x150
	.uleb128 0xa
	.ascii "lc_time_curr\0"
	.byte	0x2
	.word	0x1d3
	.byte	0x1a
	.long	0x53d
	.word	0x158
	.byte	0
	.uleb128 0x5
	.ascii "pthreadmbcinfo\0"
	.byte	0x2
	.word	0x1a9
	.byte	0x25
	.long	0x36e
	.uleb128 0x6
	.byte	0x8
	.long	0x374
	.uleb128 0xb
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xc
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x2
	.word	0x1ac
	.byte	0x10
	.long	0x3ca
	.uleb128 0x9
	.ascii "locinfo\0"
	.byte	0x2
	.word	0x1ad
	.byte	0x12
	.long	0x18e
	.byte	0
	.uleb128 0x9
	.ascii "mbcinfo\0"
	.byte	0x2
	.word	0x1ae
	.byte	0x12
	.long	0x356
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.ascii "_locale_tstruct\0"
	.byte	0x2
	.word	0x1af
	.byte	0x3
	.long	0x389
	.uleb128 0xc
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x2
	.word	0x1b3
	.byte	0x10
	.long	0x432
	.uleb128 0x9
	.ascii "wLanguage\0"
	.byte	0x2
	.word	0x1b4
	.byte	0x12
	.long	0x160
	.byte	0
	.uleb128 0x9
	.ascii "wCountry\0"
	.byte	0x2
	.word	0x1b5
	.byte	0x12
	.long	0x160
	.byte	0x2
	.uleb128 0x9
	.ascii "wCodePage\0"
	.byte	0x2
	.word	0x1b6
	.byte	0x12
	.long	0x160
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "LC_ID\0"
	.byte	0x2
	.word	0x1b7
	.byte	0x3
	.long	0x3e3
	.uleb128 0xd
	.byte	0x20
	.byte	0x2
	.word	0x1c2
	.byte	0x3
	.long	0x491
	.uleb128 0x9
	.ascii "locale\0"
	.byte	0x2
	.word	0x1c3
	.byte	0xb
	.long	0x491
	.byte	0
	.uleb128 0x9
	.ascii "wlocale\0"
	.byte	0x2
	.word	0x1c4
	.byte	0xe
	.long	0x497
	.byte	0x8
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1c5
	.byte	0xa
	.long	0x49d
	.byte	0x10
	.uleb128 0x9
	.ascii "wrefcount\0"
	.byte	0x2
	.word	0x1c6
	.byte	0xa
	.long	0x49d
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x11d
	.uleb128 0x6
	.byte	0x8
	.long	0x150
	.uleb128 0x6
	.byte	0x8
	.long	0x17b
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xe
	.long	0x4c3
	.long	0x4c3
	.uleb128 0xf
	.long	0x125
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xe
	.long	0x432
	.long	0x4e8
	.uleb128 0xf
	.long	0x125
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.long	0x441
	.long	0x4f8
	.uleb128 0xf
	.long	0x125
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.ascii "lconv\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x4f8
	.uleb128 0x6
	.byte	0x8
	.long	0x160
	.uleb128 0x6
	.byte	0x8
	.long	0x176
	.uleb128 0x6
	.byte	0x8
	.long	0x528
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.long	0x517
	.uleb128 0xb
	.ascii "__lc_time_data\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x52d
	.uleb128 0x10
	.ascii "_iobuf\0"
	.byte	0x30
	.byte	0x3
	.byte	0x1a
	.byte	0xa
	.long	0x5d3
	.uleb128 0x11
	.ascii "_ptr\0"
	.byte	0x3
	.byte	0x1b
	.byte	0xb
	.long	0x491
	.byte	0
	.uleb128 0x11
	.ascii "_cnt\0"
	.byte	0x3
	.byte	0x1c
	.byte	0x9
	.long	0x17b
	.byte	0x8
	.uleb128 0x11
	.ascii "_base\0"
	.byte	0x3
	.byte	0x1d
	.byte	0xb
	.long	0x491
	.byte	0x10
	.uleb128 0x11
	.ascii "_flag\0"
	.byte	0x3
	.byte	0x1e
	.byte	0x9
	.long	0x17b
	.byte	0x18
	.uleb128 0x11
	.ascii "_file\0"
	.byte	0x3
	.byte	0x1f
	.byte	0x9
	.long	0x17b
	.byte	0x1c
	.uleb128 0x11
	.ascii "_charbuf\0"
	.byte	0x3
	.byte	0x20
	.byte	0x9
	.long	0x17b
	.byte	0x20
	.uleb128 0x11
	.ascii "_bufsiz\0"
	.byte	0x3
	.byte	0x21
	.byte	0x9
	.long	0x17b
	.byte	0x24
	.uleb128 0x11
	.ascii "_tmpfname\0"
	.byte	0x3
	.byte	0x22
	.byte	0xb
	.long	0x491
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.ascii "FILE\0"
	.byte	0x3
	.byte	0x24
	.byte	0x19
	.long	0x543
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x12
	.ascii "__imp___mb_cur_max\0"
	.byte	0x4
	.byte	0x73
	.byte	0x10
	.long	0x49d
	.uleb128 0xe
	.long	0x491
	.long	0x62d
	.uleb128 0xf
	.long	0x125
	.byte	0
	.byte	0
	.uleb128 0x12
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x61d
	.uleb128 0x12
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x17b
	.uleb128 0x13
	.ascii "__imp___argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x49d
	.uleb128 0x13
	.ascii "__imp___argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x680
	.uleb128 0x6
	.byte	0x8
	.long	0x686
	.uleb128 0x6
	.byte	0x8
	.long	0x491
	.uleb128 0x13
	.ascii "__imp___wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x6a3
	.uleb128 0x6
	.byte	0x8
	.long	0x6a9
	.uleb128 0x6
	.byte	0x8
	.long	0x497
	.uleb128 0x13
	.ascii "__imp__environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x680
	.uleb128 0x13
	.ascii "__imp__wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x6a3
	.uleb128 0x13
	.ascii "__imp__pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x686
	.uleb128 0x13
	.ascii "__imp__wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x6a9
	.uleb128 0x13
	.ascii "__imp__osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x72a
	.uleb128 0x6
	.byte	0x8
	.long	0x4a3
	.uleb128 0x13
	.ascii "__imp__osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x72a
	.uleb128 0x13
	.ascii "__imp__winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x72a
	.uleb128 0x13
	.ascii "__imp__winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x72a
	.uleb128 0x13
	.ascii "__imp__winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x72a
	.uleb128 0x12
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x4a3
	.uleb128 0x12
	.ascii "__imp__pctype\0"
	.byte	0x6
	.byte	0x2b
	.byte	0x1c
	.long	0x7b7
	.uleb128 0x6
	.byte	0x8
	.long	0x505
	.uleb128 0x12
	.ascii "__imp__wctype\0"
	.byte	0x6
	.byte	0x3b
	.byte	0x1c
	.long	0x7b7
	.uleb128 0x12
	.ascii "__imp__pwctype\0"
	.byte	0x6
	.byte	0x47
	.byte	0x1c
	.long	0x7b7
	.uleb128 0xe
	.long	0x528
	.long	0x7f5
	.uleb128 0x14
	.byte	0
	.uleb128 0x4
	.long	0x7ea
	.uleb128 0x12
	.ascii "__newclmap\0"
	.byte	0x6
	.byte	0x50
	.byte	0x1e
	.long	0x7f5
	.uleb128 0x12
	.ascii "__newcumap\0"
	.byte	0x6
	.byte	0x51
	.byte	0x1e
	.long	0x7f5
	.uleb128 0x12
	.ascii "__ptlocinfo\0"
	.byte	0x6
	.byte	0x52
	.byte	0x19
	.long	0x18e
	.uleb128 0x12
	.ascii "__ptmbcinfo\0"
	.byte	0x6
	.byte	0x53
	.byte	0x19
	.long	0x356
	.uleb128 0x12
	.ascii "__globallocalestatus\0"
	.byte	0x6
	.byte	0x54
	.byte	0xe
	.long	0x17b
	.uleb128 0x12
	.ascii "__locale_changed\0"
	.byte	0x6
	.byte	0x55
	.byte	0xe
	.long	0x17b
	.uleb128 0x12
	.ascii "__initiallocinfo\0"
	.byte	0x6
	.byte	0x56
	.byte	0x28
	.long	0x1ac
	.uleb128 0x12
	.ascii "__initiallocalestructinfo\0"
	.byte	0x6
	.byte	0x57
	.byte	0x1a
	.long	0x3ca
	.uleb128 0x15
	.byte	0x8
	.uleb128 0x16
	.byte	0xd7
	.byte	0x7
	.byte	0x35
	.byte	0x9
	.long	0x931
	.uleb128 0x11
	.ascii "cod\0"
	.byte	0x7
	.byte	0x36
	.byte	0xa
	.long	0x931
	.byte	0
	.uleb128 0x11
	.ascii "desc\0"
	.byte	0x7
	.byte	0x37
	.byte	0xa
	.long	0x941
	.byte	0xf
	.uleb128 0x11
	.ascii "clasif\0"
	.byte	0x7
	.byte	0x38
	.byte	0xa
	.long	0x951
	.byte	0x4c
	.uleb128 0x17
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x39
	.byte	0xa
	.long	0x961
	.byte	0x74
	.uleb128 0x17
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x3a
	.byte	0xa
	.long	0x961
	.byte	0x86
	.uleb128 0x17
	.secrel32	.LASF3
	.byte	0x7
	.byte	0x3b
	.byte	0xa
	.long	0x961
	.byte	0x98
	.uleb128 0x17
	.secrel32	.LASF4
	.byte	0x7
	.byte	0x3c
	.byte	0xa
	.long	0x931
	.byte	0xaa
	.uleb128 0x17
	.secrel32	.LASF5
	.byte	0x7
	.byte	0x3d
	.byte	0xa
	.long	0x971
	.byte	0xb9
	.byte	0
	.uleb128 0xe
	.long	0x11d
	.long	0x941
	.uleb128 0xf
	.long	0x125
	.byte	0xe
	.byte	0
	.uleb128 0xe
	.long	0x11d
	.long	0x951
	.uleb128 0xf
	.long	0x125
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.long	0x11d
	.long	0x961
	.uleb128 0xf
	.long	0x125
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	0x11d
	.long	0x971
	.uleb128 0xf
	.long	0x125
	.byte	0x11
	.byte	0
	.uleb128 0xe
	.long	0x11d
	.long	0x981
	.uleb128 0xf
	.long	0x125
	.byte	0x1d
	.byte	0
	.uleb128 0x3
	.ascii "IPCDivisiones\0"
	.byte	0x7
	.byte	0x3e
	.byte	0x2
	.long	0x8bb
	.uleb128 0x16
	.byte	0x51
	.byte	0x7
	.byte	0x47
	.byte	0x9
	.long	0x9ec
	.uleb128 0x11
	.ascii "fecha\0"
	.byte	0x7
	.byte	0x48
	.byte	0xa
	.long	0x971
	.byte	0
	.uleb128 0x17
	.secrel32	.LASF4
	.byte	0x7
	.byte	0x49
	.byte	0xa
	.long	0x931
	.byte	0x1e
	.uleb128 0x11
	.ascii "indiceBienes\0"
	.byte	0x7
	.byte	0x4a
	.byte	0xa
	.long	0x961
	.byte	0x2d
	.uleb128 0x11
	.ascii "indiceServicios\0"
	.byte	0x7
	.byte	0x4b
	.byte	0xa
	.long	0x961
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.ascii "IPCPromedio\0"
	.byte	0x7
	.byte	0x4c
	.byte	0x2
	.long	0x997
	.uleb128 0x16
	.byte	0xd7
	.byte	0x7
	.byte	0x5f
	.byte	0x9
	.long	0xa76
	.uleb128 0x11
	.ascii "cod\0"
	.byte	0x7
	.byte	0x60
	.byte	0xa
	.long	0x931
	.byte	0
	.uleb128 0x11
	.ascii "desc\0"
	.byte	0x7
	.byte	0x61
	.byte	0xa
	.long	0x941
	.byte	0xf
	.uleb128 0x11
	.ascii "clasif\0"
	.byte	0x7
	.byte	0x62
	.byte	0xa
	.long	0x951
	.byte	0x4c
	.uleb128 0x17
	.secrel32	.LASF5
	.byte	0x7
	.byte	0x63
	.byte	0xa
	.long	0x971
	.byte	0x74
	.uleb128 0x17
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x64
	.byte	0xa
	.long	0x961
	.byte	0x92
	.uleb128 0x17
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x65
	.byte	0xa
	.long	0x961
	.byte	0xa4
	.uleb128 0x17
	.secrel32	.LASF3
	.byte	0x7
	.byte	0x66
	.byte	0xa
	.long	0x961
	.byte	0xb6
	.uleb128 0x17
	.secrel32	.LASF4
	.byte	0x7
	.byte	0x67
	.byte	0xa
	.long	0x931
	.byte	0xc8
	.byte	0
	.uleb128 0x3
	.ascii "IPCAperturas\0"
	.byte	0x7
	.byte	0x68
	.byte	0x2
	.long	0xa00
	.uleb128 0x16
	.byte	0x54
	.byte	0x7
	.byte	0x71
	.byte	0x9
	.long	0xadc
	.uleb128 0x17
	.secrel32	.LASF5
	.byte	0x7
	.byte	0x72
	.byte	0xa
	.long	0x971
	.byte	0
	.uleb128 0x17
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x73
	.byte	0xa
	.long	0x961
	.byte	0x1e
	.uleb128 0x11
	.ascii "acumuladoIPC\0"
	.byte	0x7
	.byte	0x74
	.byte	0xa
	.long	0x961
	.byte	0x30
	.uleb128 0x11
	.ascii "montoAjustado\0"
	.byte	0x7
	.byte	0x75
	.byte	0xa
	.long	0x961
	.byte	0x42
	.byte	0
	.uleb128 0x3
	.ascii "IPCAlquileres\0"
	.byte	0x7
	.byte	0x76
	.byte	0x2
	.long	0xa8b
	.uleb128 0x18
	.ascii "parsearEscrAlquileres\0"
	.byte	0x1
	.byte	0x76
	.byte	0x5
	.long	0x17b
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xb55
	.uleb128 0x19
	.ascii "arch\0"
	.byte	0x1
	.byte	0x76
	.byte	0x21
	.long	0xb55
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x76
	.byte	0x2d
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x78
	.byte	0x14
	.long	0xb5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5d3
	.uleb128 0x6
	.byte	0x8
	.long	0xadc
	.uleb128 0x1b
	.ascii "mostrarAperturas\0"
	.byte	0x1
	.byte	0x63
	.byte	0x6
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xbcd
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x63
	.byte	0x1d
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x65
	.byte	0x13
	.long	0xbcd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.byte	0x66
	.byte	0x10
	.long	0x17b
	.uleb128 0x9
	.byte	0x3
	.quad	i.4684
	.uleb128 0x1c
	.quad	.LVL1
	.long	0xe53
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa76
	.uleb128 0x18
	.ascii "parsearEscrAperturas\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.long	0x17b
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xc35
	.uleb128 0x19
	.ascii "arch\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x20
	.long	0xb55
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x2c
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x5d
	.byte	0x13
	.long	0xbcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x18
	.ascii "parsearEscrPromedio\0"
	.byte	0x1
	.byte	0x52
	.byte	0x5
	.long	0x17b
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xc94
	.uleb128 0x19
	.ascii "arch\0"
	.byte	0x1
	.byte	0x52
	.byte	0x1f
	.long	0xb55
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x52
	.byte	0x2b
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.byte	0x54
	.byte	0x12
	.long	0xc94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9ec
	.uleb128 0x1b
	.ascii "mostrarDivisiones\0"
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xd0b
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x40
	.byte	0x1e
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x42
	.byte	0x14
	.long	0xd0b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.ascii "waitJ\0"
	.byte	0x1
	.byte	0x43
	.byte	0x10
	.long	0x17b
	.uleb128 0x9
	.byte	0x3
	.quad	waitJ.4669
	.uleb128 0x1c
	.quad	.LVL0
	.long	0xe53
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x981
	.uleb128 0x18
	.ascii "parsearEscrDivisiones\0"
	.byte	0x1
	.byte	0x38
	.byte	0x5
	.long	0x17b
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xd74
	.uleb128 0x19
	.ascii "arch\0"
	.byte	0x1
	.byte	0x38
	.byte	0x21
	.long	0xb55
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "reg\0"
	.byte	0x1
	.byte	0x38
	.byte	0x2d
	.long	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x3a
	.byte	0x14
	.long	0xd0b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1b
	.ascii "imprimirHeaderTabla\0"
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xe05
	.uleb128 0x19
	.ascii "titulo\0"
	.byte	0x1
	.byte	0x23
	.byte	0x20
	.long	0x491
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "campos\0"
	.byte	0x1
	.byte	0x23
	.byte	0x2f
	.long	0x686
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.ascii "paddings\0"
	.byte	0x1
	.byte	0x23
	.byte	0x3c
	.long	0x49d
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x19
	.ascii "cc\0"
	.byte	0x1
	.byte	0x23
	.byte	0x4a
	.long	0x17b
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.byte	0x25
	.byte	0x9
	.long	0x17b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii "sum\0"
	.byte	0x1
	.byte	0x25
	.byte	0xc
	.long	0x17b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "validarFechaForm\0"
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.long	0x17b
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xe53
	.uleb128 0x19
	.ascii "ans\0"
	.byte	0x1
	.byte	0x9
	.byte	0x1c
	.long	0x491
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xb
	.byte	0x9
	.long	0x17b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.secrel32	.LASF6
	.secrel32	.LASF6
	.byte	0x3
	.byte	0x52
	.byte	0x42
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF1:
	.ascii "indiceIPC\0"
.LASF2:
	.ascii "varMensIPC\0"
.LASF0:
	.ascii "refcount\0"
.LASF5:
	.ascii "periodo\0"
.LASF4:
	.ascii "region\0"
.LASF3:
	.ascii "varAnualIPC\0"
.LASF6:
	.ascii "__acrt_iob_func\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
