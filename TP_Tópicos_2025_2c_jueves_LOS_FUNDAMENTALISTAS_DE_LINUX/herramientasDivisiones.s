	.file	"herramientasDivisiones.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "No se encontraron registros que coincidan con los parametros ingresados.\0"
.LC3:
	.ascii "\33[2J\33[H\0"
	.align 8
.LC4:
	.ascii "La variacion porcentual del IPC Region \33[1m\33[1;36m%s\33[0m entre \33[1m\33[1;36m%s\33[0m y \33[1m\33[1;36m%s\33[0m fue del \33[1;33m%%%0.1lf\12\33[0mEl monto actualizado para el periodo seleccionado es: \33[1;36m$ %0.2lf\33[0m -> \33[1m\33[1;33m$ %0.2lf\12\33[0m\0"
	.text
	.globl	herramientaAjustarMontosIPCDivisiones
	.def	herramientaAjustarMontosIPCDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	herramientaAjustarMontosIPCDivisiones
herramientaAjustarMontosIPCDivisiones:
.LFB17:
	.file 1 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/herramientasDivisiones.c"
	.loc 1 12 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$320, %rsp
	.seh_stackalloc	320
	.cfi_def_cfa_offset 336
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 208
	movaps	%xmm6, 160(%rbp)
	.seh_savexmm	%xmm6, 288
	movaps	%xmm7, 176(%rbp)
	.seh_savexmm	%xmm7, 304
	.cfi_offset 23, -48
	.cfi_offset 24, -32
	.seh_endprologue
	movq	%rcx, 208(%rbp)
	.loc 1 15 20
	movq	$0, 152(%rbp)
	.loc 1 15 30
	movq	$0, 144(%rbp)
	.loc 1 18 11
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	preguntarAjustarMonto
	movq	-64(%rbp), %rax
	movq	%rax, 32(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, 40(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, 48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, 56(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, 64(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, 72(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, 80(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, 88(%rbp)
	movq	0(%rbp), %rax
	movq	%rax, 96(%rbp)
	movq	8(%rbp), %rax
	movq	%rax, 104(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, 112(%rbp)
	.loc 1 20 11
	leaq	32(%rbp), %rax
	movq	%rax, %r8
	leaq	filtrarIPCDivisiones(%rip), %rdx
	movq	208(%rbp), %rcx
	call	filtrarVector
	movq	%rax, 136(%rbp)
	.loc 1 22 7
	cmpq	$0, 136(%rbp)
	je	.L2
	.loc 1 22 16 discriminator 1
	movq	136(%rbp), %rax
	movq	%rax, %rcx
	call	vectorCantElem
	.loc 1 22 13 discriminator 1
	cmpq	$1, %rax
	ja	.L3
.L2:
	.loc 1 23 9
	leaq	.LC0(%rip), %rcx
	call	puts
	.loc 1 24 16
	movl	$6, %eax
	jmp	.L5
.L3:
	.loc 1 27 9
	movq	136(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	vectorObtener
	movq	%rax, 152(%rbp)
	.loc 1 28 9
	movq	136(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vectorObtener
	movq	%rax, 144(%rbp)
	.loc 1 30 22
	movq	144(%rbp), %rax
	addq	$116, %rax
	.loc 1 30 16
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm6
	.loc 1 30 44
	movq	152(%rbp), %rax
	addq	$116, %rax
	.loc 1 30 37
	movq	%rax, %rcx
	call	atof
	.loc 1 30 35
	divsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	.loc 1 30 59
	movsd	.LC1(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	.loc 1 30 12
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 128(%rbp)
	.loc 1 31 20
	movsd	32(%rbp), %xmm6
	.loc 1 31 37
	movq	144(%rbp), %rax
	addq	$116, %rax
	.loc 1 31 31
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm7
	.loc 1 31 58
	movq	152(%rbp), %rax
	addq	$116, %rax
	.loc 1 31 52
	movq	%rax, %rcx
	call	atof
	.loc 1 31 50
	divsd	%xmm0, %xmm7
	movapd	%xmm7, %xmm0
	.loc 1 31 15
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, 120(%rbp)
	.loc 1 33 5
	leaq	.LC3(%rip), %rcx
	call	puts
	.loc 1 34 5
	movsd	32(%rbp), %xmm0
	leaq	32(%rbp), %rax
	leaq	53(%rax), %rcx
	leaq	32(%rbp), %rax
	leaq	23(%rax), %rdx
	leaq	32(%rbp), %rax
	addq	$8, %rax
	movsd	120(%rbp), %xmm1
	movsd	%xmm1, 48(%rsp)
	movsd	%xmm0, 40(%rsp)
	movsd	128(%rbp), %xmm0
	movsd	%xmm0, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 36 5
	call	esperarInput
	.loc 1 38 5
	movq	136(%rbp), %rax
	movq	%rax, %rcx
	call	vectorDestruir
	.loc 1 40 12
	movl	$0, %eax
.L5:
	.loc 1 41 1 discriminator 1
	movaps	160(%rbp), %xmm6
	movaps	176(%rbp), %xmm7
	addq	$320, %rsp
	.cfi_restore 24
	.cfi_restore 23
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -312
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "Nacional\0"
.LC6:
	.ascii "GBA\0"
.LC7:
	.ascii "Pampeana\0"
.LC8:
	.ascii "Cuyo\0"
.LC9:
	.ascii "Noroeste\0"
.LC10:
	.ascii "Noreste\0"
.LC11:
	.ascii "Patagonia\0"
.LC12:
	.ascii "Ajustar montos por IPC\0"
.LC13:
	.ascii "Monto a ajustar ($)\0"
.LC16:
	.ascii "La region a evaluar\0"
.LC17:
	.ascii "Periodo de inicio (AAAA-MM)\0"
.LC18:
	.ascii "Periodo de fin (AAAA-MM)\0"
	.text
	.globl	preguntarAjustarMonto
	.def	preguntarAjustarMonto;	.scl	2;	.type	32;	.endef
	.seh_proc	preguntarAjustarMonto
preguntarAjustarMonto:
.LFB18:
	.loc 1 44 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 24
	.cfi_offset 5, -24
	subq	$3832, %rsp
	.seh_stackalloc	3832
	.cfi_def_cfa_offset 3856
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 3728
	.seh_endprologue
	movq	%rcx, 3728(%rbp)
	.loc 1 47 17
	leaq	-64(%rbp), %rdx
	movl	$0, %eax
	movl	$15, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	.LC5(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC8(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC10(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -16(%rbp)
	.loc 1 49 5
	leaq	64(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	formularioInit
	.loc 1 50 5
	leaq	64(%rbp), %rax
	movsd	.LC14(%rip), %xmm0
	movsd	%xmm0, 40(%rsp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %r8d
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 51 5
	leaq	64(%rbp), %rax
	leaq	-64(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	$7, 32(%rsp)
	movl	$2, %r9d
	movl	$1, %r8d
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 52 5
	leaq	64(%rbp), %rax
	leaq	convertirFechaResDivs(%rip), %rdx
	movq	%rdx, 48(%rsp)
	movq	.refptr.validarFechaForm(%rip), %rdx
	movq	%rdx, 40(%rsp)
	movl	$30, 32(%rsp)
	movl	$1, %r9d
	movl	$1, %r8d
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 53 5
	leaq	64(%rbp), %rax
	leaq	convertirFechaResDivs(%rip), %rdx
	movq	%rdx, 48(%rsp)
	movq	.refptr.validarFechaForm(%rip), %rdx
	movq	%rdx, 40(%rsp)
	movl	$30, 32(%rsp)
	movl	$1, %r9d
	movl	$1, %r8d
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 55 5
	leaq	64(%rbp), %rax
	leaq	validarFechaResDivs(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarValidado
	.loc 1 57 5
	leaq	64(%rbp), %rax
	movq	%rax, %rcx
	call	formularioPublicar
	.loc 1 59 22
	leaq	64(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	.loc 1 59 17
	movq	%rax, %rcx
	call	atof
	movq	%xmm0, %rax
	.loc 1 59 15
	movq	%rax, 3600(%rbp)
	.loc 1 60 29
	leaq	64(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 60 5
	leaq	3600(%rbp), %rax
	addq	$8, %rax
	movl	$15, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 61 33
	leaq	64(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 61 5
	leaq	3600(%rbp), %rax
	addq	$23, %rax
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 62 33
	leaq	64(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 62 5
	leaq	3600(%rbp), %rax
	addq	$53, %rax
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 64 5
	leaq	64(%rbp), %rax
	movq	%rax, %rcx
	call	formularioDestruir
	.loc 1 66 12
	movq	3728(%rbp), %rax
	movq	3600(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	3608(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	3616(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	3624(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	3632(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	3640(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	3648(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	3656(%rbp), %rdx
	movq	%rdx, 56(%rax)
	movq	3664(%rbp), %rdx
	movq	%rdx, 64(%rax)
	movq	3672(%rbp), %rdx
	movq	%rdx, 72(%rax)
	movq	3680(%rbp), %rdx
	movq	%rdx, 80(%rax)
	.loc 1 67 1
	movq	3728(%rbp), %rax
	addq	$3832, %rsp
	popq	%rdi
	.cfi_restore 5
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -3816
	ret
	.cfi_endproc
.LFE18:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "\33[1m\33[1;31mError: fecha de inicio no puede ser mayor o igual a la fecha de fin, vuelva a intentar\12\33[0m\0"
	.text
	.globl	validarFechaResDivs
	.def	validarFechaResDivs;	.scl	2;	.type	32;	.endef
	.seh_proc	validarFechaResDivs
validarFechaResDivs:
.LFB19:
	.loc 1 70 1
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
	.loc 1 71 19
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 72 17
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	formularioRawRespuesta
	movq	%rax, -16(%rbp)
	.loc 1 73 17
	movq	-8(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	formularioRawRespuesta
	movq	%rax, -24(%rbp)
	.loc 1 76 15
	movq	-16(%rbp), %rax
	addq	$5, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	.loc 1 76 19
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 76 29
	movq	-16(%rbp), %rax
	addq	$6, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 76 24
	addl	%edx, %eax
	.loc 1 76 10
	subl	$528, %eax
	movl	%eax, -28(%rbp)
	.loc 1 77 15
	movq	-24(%rbp), %rax
	addq	$5, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	.loc 1 77 19
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 77 29
	movq	-24(%rbp), %rax
	addq	$6, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 77 24
	addl	%edx, %eax
	.loc 1 77 10
	subl	$528, %eax
	movl	%eax, -32(%rbp)
	.loc 1 79 16
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 79 20
	imull	$100000, %eax, %edx
	.loc 1 79 34
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 79 38
	imull	$10000, %eax, %eax
	.loc 1 79 29
	addl	%eax, %edx
	.loc 1 79 51
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 79 55
	imull	$1000, %eax, %eax
	.loc 1 79 46
	addl	%eax, %edx
	.loc 1 79 67
	movq	-16(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 79 71
	imull	$100, %eax, %eax
	.loc 1 79 62
	addl	%edx, %eax
	.loc 1 79 77
	subl	$5332800, %eax
	.loc 1 79 10
	addl	%eax, -28(%rbp)
	.loc 1 80 16
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 80 20
	imull	$100000, %eax, %edx
	.loc 1 80 34
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 80 38
	imull	$10000, %eax, %eax
	.loc 1 80 29
	addl	%eax, %edx
	.loc 1 80 51
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 80 55
	imull	$1000, %eax, %eax
	.loc 1 80 46
	addl	%eax, %edx
	.loc 1 80 67
	movq	-24(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 80 71
	imull	$100, %eax, %eax
	.loc 1 80 62
	addl	%edx, %eax
	.loc 1 80 77
	subl	$5332800, %eax
	.loc 1 80 10
	addl	%eax, -32(%rbp)
	.loc 1 82 7
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.L9
	.loc 1 83 9
	leaq	.LC19(%rip), %rcx
	call	printf
	.loc 1 84 9
	call	getchar
	.loc 1 85 16
	movl	$0, %eax
	jmp	.L10
.L9:
	.loc 1 88 12
	movl	$1, %eax
.L10:
	.loc 1 89 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.seh_endproc
	.section .rdata,"dr"
.LC20:
	.ascii "%s - %s\0"
	.text
	.globl	convertirFechaResDivs
	.def	convertirFechaResDivs;	.scl	2;	.type	32;	.endef
	.seh_proc	convertirFechaResDivs
convertirFechaResDivs:
.LFB20:
	.loc 1 92 1
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
	.loc 1 99 26
	movq	16(%rbp), %rax
	addq	$5, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	.loc 1 99 30
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 99 40
	movq	16(%rbp), %rax
	addq	$6, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 99 35
	addl	%edx, %eax
	.loc 1 99 55
	subl	$529, %eax
	.loc 1 99 11
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	meses.4783(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 101 5
	leaq	-13(%rbp), %rax
	movl	$4, %r8d
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 103 5
	leaq	-13(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC20(%rip), %rdx
	movq	16(%rbp), %rcx
	call	sprintf
	.loc 1 105 12
	movq	16(%rbp), %rax
	.loc 1 106 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.seh_endproc
	.section .rdata,"dr"
.LC21:
	.ascii "Nivel general\0"
	.text
	.globl	filtrarIPCDivisiones
	.def	filtrarIPCDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	filtrarIPCDivisiones
filtrarIPCDivisiones:
.LFB21:
	.loc 1 109 1
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
	.loc 1 110 20
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 111 22
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 113 22
	movq	-8(%rbp), %rax
	addq	$15, %rax
	.loc 1 113 8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 113 7
	testl	%eax, %eax
	je	.L14
	.loc 1 114 16
	movl	$0, %eax
	jmp	.L15
.L14:
	.loc 1 117 39
	movq	-16(%rbp), %rax
	leaq	23(%rax), %rdx
	.loc 1 117 24
	movq	-8(%rbp), %rax
	addq	$185, %rax
	.loc 1 117 10
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 117 7
	testl	%eax, %eax
	je	.L16
	.loc 1 117 86 discriminator 2
	movq	-16(%rbp), %rax
	leaq	53(%rax), %rdx
	.loc 1 117 71 discriminator 2
	movq	-8(%rbp), %rax
	addq	$185, %rax
	.loc 1 117 57 discriminator 2
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 117 53 discriminator 2
	testl	%eax, %eax
	jne	.L17
.L16:
	.loc 1 117 133 discriminator 3
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	.loc 1 117 119 discriminator 3
	movq	-8(%rbp), %rax
	addq	$170, %rax
	.loc 1 117 105 discriminator 3
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 117 101 discriminator 3
	testl	%eax, %eax
	jne	.L17
	.loc 1 118 16
	movl	$1, %eax
	jmp	.L15
.L17:
	.loc 1 121 12
	movl	$0, %eax
.L15:
	.loc 1 122 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "---------------------------\33[1m\33[1;33mPromedio IPC a nivel nacional por grupos\33[0m---------------------------\0"
.LC23:
	.ascii "Periodo\0"
	.align 8
.LC24:
	.ascii "\33[1m\33[1;37m%-*s\11\33[0m | \33[1m\33[1;37m%-*s\11\33[0m | \33[1m\33[1;37m%-*s\11\33[0m | \33[1m\33[1;37m%-*s\11\33[0m\12\0"
.LC25:
	.ascii "Servicios\0"
.LC26:
	.ascii "Bienes\0"
.LC27:
	.ascii "Region\0"
	.align 8
.LC28:
	.ascii "\33[1m\33[1;37m----------------------------------------------------------------------------------------------\33[0m\0"
	.text
	.globl	clasificarBySIPCDivisiones
	.def	clasificarBySIPCDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	clasificarBySIPCDivisiones
clasificarBySIPCDivisiones:
.LFB22:
	.loc 1 125 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 130 14
	movl	$0, %r8d
	leaq	filtrarBienes(%rip), %rdx
	movq	16(%rbp), %rcx
	call	filtrarVector
	movq	%rax, -8(%rbp)
	.loc 1 131 17
	movl	$0, %r8d
	leaq	filtrarServicios(%rip), %rdx
	movq	16(%rbp), %rcx
	call	filtrarVector
	movq	%rax, -16(%rbp)
	.loc 1 136 14
	movq	-8(%rbp), %rax
	leaq	reducirBySProm(%rip), %r9
	leaq	compararPeriodo(%rip), %r8
	leaq	obtenerPeriodo(%rip), %rdx
	movq	%rax, %rcx
	call	reducirVectorPorClave
	movq	%rax, -8(%rbp)
	.loc 1 137 17
	movq	-16(%rbp), %rax
	leaq	reducirBySProm(%rip), %r9
	leaq	compararPeriodo(%rip), %r8
	leaq	obtenerPeriodo(%rip), %rdx
	movq	%rax, %rcx
	call	reducirVectorPorClave
	movq	%rax, -16(%rbp)
	.loc 1 139 16
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$81, %r9d
	leaq	unirBienesYServicios(%rip), %r8
	movq	%rax, %rcx
	call	unirVectores
	movq	%rax, -24(%rbp)
	.loc 1 143 5
	leaq	.LC3(%rip), %rcx
	call	puts
	.loc 1 144 5
	leaq	.LC22(%rip), %rcx
	call	puts
	.loc 1 145 5
	leaq	.LC25(%rip), %rax
	movq	%rax, 64(%rsp)
	movl	$18, 56(%rsp)
	leaq	.LC26(%rip), %rax
	movq	%rax, 48(%rsp)
	movl	$18, 40(%rsp)
	leaq	.LC27(%rip), %rax
	movq	%rax, 32(%rsp)
	movl	$15, %r9d
	leaq	.LC23(%rip), %r8
	movl	$30, %edx
	leaq	.LC24(%rip), %rcx
	call	printf
	.loc 1 146 5
	leaq	.LC28(%rip), %rcx
	call	puts
	.loc 1 148 5
	movq	-24(%rbp), %rax
	leaq	mostrarPromedio(%rip), %rdx
	movq	%rax, %rcx
	call	mostrarVector
	.loc 1 150 5
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	vectorDestruir
	.loc 1 151 5
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	vectorDestruir
	.loc 1 152 5
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	vectorDestruir
	.loc 1 154 12
	movl	$0, %eax
	.loc 1 155 1
	addq	$112, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.seh_endproc
	.globl	filtrarBienes
	.def	filtrarBienes;	.scl	2;	.type	32;	.endef
	.seh_proc	filtrarBienes
filtrarBienes:
.LFB23:
	.loc 1 158 1
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
	.loc 1 159 20
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 163 19
	movq	-16(%rbp), %rax
	movzbl	170(%rax), %eax
	.loc 1 163 7
	cmpb	$78, %al
	jne	.L21
	.loc 1 163 46 discriminator 1
	movq	-16(%rbp), %rax
	addq	$170, %rax
	.loc 1 163 33 discriminator 1
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 163 30 discriminator 1
	testl	%eax, %eax
	je	.L22
.L21:
	.loc 1 164 16
	movl	$0, %eax
	jmp	.L23
.L22:
	.loc 1 167 11
	movl	$0, -4(%rbp)
	.loc 1 167 5
	jmp	.L24
.L26:
	.loc 1 168 20
	movq	-16(%rbp), %rax
	movzbl	(%rax), %ecx
	.loc 1 168 38
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	leaq	codsBien.4803(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 168 11
	cmpb	%al, %cl
	jne	.L25
	.loc 1 168 53 discriminator 1
	movq	-16(%rbp), %rax
	movzbl	1(%rax), %ecx
	.loc 1 168 71 discriminator 1
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	leaq	1+codsBien.4803(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 168 42 discriminator 1
	cmpb	%al, %cl
	jne	.L25
	.loc 1 168 86 discriminator 2
	movq	-16(%rbp), %rax
	movzbl	2(%rax), %eax
	.loc 1 168 75 discriminator 2
	testb	%al, %al
	jne	.L25
	.loc 1 169 20
	movl	$1, %eax
	jmp	.L23
.L25:
	.loc 1 167 24 discriminator 2
	addl	$1, -4(%rbp)
.L24:
	.loc 1 167 5 discriminator 1
	cmpl	$4, -4(%rbp)
	jle	.L26
	.loc 1 173 12
	movl	$0, %eax
.L23:
	.loc 1 174 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.seh_endproc
	.globl	filtrarServicios
	.def	filtrarServicios;	.scl	2;	.type	32;	.endef
	.seh_proc	filtrarServicios
filtrarServicios:
.LFB24:
	.loc 1 177 1
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
	.loc 1 178 20
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 182 19
	movq	-16(%rbp), %rax
	movzbl	170(%rax), %eax
	.loc 1 182 7
	cmpb	$78, %al
	jne	.L28
	.loc 1 182 46 discriminator 1
	movq	-16(%rbp), %rax
	addq	$170, %rax
	.loc 1 182 33 discriminator 1
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 182 30 discriminator 1
	testl	%eax, %eax
	je	.L29
.L28:
	.loc 1 183 16
	movl	$0, %eax
	jmp	.L30
.L29:
	.loc 1 186 11
	movl	$0, -4(%rbp)
	.loc 1 186 5
	jmp	.L31
.L33:
	.loc 1 187 20
	movq	-16(%rbp), %rax
	movzbl	(%rax), %ecx
	.loc 1 187 37
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	leaq	codsSer.4813(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 187 11
	cmpb	%al, %cl
	jne	.L32
	.loc 1 187 52 discriminator 1
	movq	-16(%rbp), %rax
	movzbl	1(%rax), %ecx
	.loc 1 187 69 discriminator 1
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	leaq	1+codsSer.4813(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 187 41 discriminator 1
	cmpb	%al, %cl
	jne	.L32
	.loc 1 187 84 discriminator 2
	movq	-16(%rbp), %rax
	movzbl	2(%rax), %eax
	.loc 1 187 73 discriminator 2
	testb	%al, %al
	jne	.L32
	.loc 1 188 20
	movl	$1, %eax
	jmp	.L30
.L32:
	.loc 1 186 24 discriminator 2
	addl	$1, -4(%rbp)
.L31:
	.loc 1 186 5 discriminator 1
	cmpl	$6, -4(%rbp)
	jle	.L33
	.loc 1 192 12
	movl	$0, %eax
.L30:
	.loc 1 193 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.seh_endproc
	.globl	obtenerPeriodo
	.def	obtenerPeriodo;	.scl	2;	.type	32;	.endef
	.seh_proc	obtenerPeriodo
obtenerPeriodo:
.LFB25:
	.loc 1 196 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 197 20
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 199 12
	movq	-8(%rbp), %rax
	addq	$185, %rax
	.loc 1 200 1
	addq	$16, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.seh_endproc
	.globl	compararPeriodo
	.def	compararPeriodo;	.scl	2;	.type	32;	.endef
	.seh_proc	compararPeriodo
compararPeriodo:
.LFB26:
	.loc 1 203 1
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
	.loc 1 204 11
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 205 11
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 207 12
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCmp
	.loc 1 208 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.seh_endproc
	.section .rdata,"dr"
.LC29:
	.ascii "%0.6lf\0"
	.text
	.globl	reducirBySProm
	.def	reducirBySProm;	.scl	2;	.type	32;	.endef
	.seh_proc	reducirBySProm
reducirBySProm:
.LFB27:
	.loc 1 211 1
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
	movaps	%xmm6, -16(%rbp)
	.seh_savexmm	%xmm6, 48
	.cfi_offset 23, -32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 212 20
	movq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 213 20
	movq	24(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 215 31
	movq	-24(%rbp), %rdx
	.loc 1 215 21
	movq	-32(%rbp), %rax
	.loc 1 215 5
	movl	$15, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 216 32
	movq	-24(%rbp), %rax
	leaq	15(%rax), %rdx
	.loc 1 216 21
	movq	-32(%rbp), %rax
	addq	$15, %rax
	.loc 1 216 5
	movl	$61, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 217 34
	movq	-24(%rbp), %rax
	leaq	76(%rax), %rdx
	.loc 1 217 21
	movq	-32(%rbp), %rax
	addq	$76, %rax
	.loc 1 217 5
	movl	$40, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 218 21
	movq	-32(%rbp), %rax
	addq	$170, %rax
	.loc 1 218 5
	movl	$15, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 219 35
	movq	-24(%rbp), %rax
	leaq	185(%rax), %rdx
	.loc 1 219 21
	movq	-32(%rbp), %rax
	addq	$185, %rax
	.loc 1 219 5
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 220 48
	movq	-24(%rbp), %rax
	addq	$116, %rax
	.loc 1 220 40
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm6
	.loc 1 220 72
	movq	-32(%rbp), %rax
	addq	$116, %rax
	.loc 1 220 63
	movq	%rax, %rcx
	call	atof
	.loc 1 220 5
	addsd	%xmm6, %xmm0
	.loc 1 220 17
	movq	-32(%rbp), %rax
	addq	$116, %rax
	.loc 1 220 5
	movq	%xmm0, %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	movq	%r8, %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm2
	movq	%xmm0, %r8
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 222 12
	movq	-32(%rbp), %rax
	.loc 1 223 1
	movaps	-16(%rbp), %xmm6
	addq	$64, %rsp
	.cfi_restore 23
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.seh_endproc
	.globl	unirBienesYServicios
	.def	unirBienesYServicios;	.scl	2;	.type	32;	.endef
	.seh_proc	unirBienesYServicios
unirBienesYServicios:
.LFB28:
	.loc 1 226 1
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
	movq	%r8, 32(%rbp)
	.loc 1 227 20
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 228 20
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 229 18
	movq	32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 231 33
	movq	-8(%rbp), %rax
	leaq	185(%rax), %rdx
	.loc 1 231 20
	movq	-24(%rbp), %rax
	.loc 1 231 5
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 232 51
	movq	-8(%rbp), %rax
	addq	$116, %rax
	.loc 1 232 42
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm1
	.loc 1 232 5
	movsd	.LC30(%rip), %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	.loc 1 232 16
	movq	-24(%rbp), %rax
	addq	$45, %rax
	.loc 1 232 5
	movq	%xmm0, %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	movq	%r8, %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm2
	movq	%xmm0, %r8
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 233 54
	movq	-16(%rbp), %rax
	addq	$116, %rax
	.loc 1 233 45
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm1
	.loc 1 233 5
	movsd	.LC31(%rip), %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	.loc 1 233 16
	movq	-24(%rbp), %rax
	addq	$63, %rax
	.loc 1 233 5
	movq	%xmm0, %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	movq	%r8, %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm2
	movq	%xmm0, %r8
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 234 20
	movq	-24(%rbp), %rax
	addq	$30, %rax
	.loc 1 234 5
	movl	$15, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 236 12
	movq	-24(%rbp), %rax
	.loc 1 237 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC32:
	.ascii "\33[1m\33[1;36m%-*s\11\33[0m | \33[1m\33[1;36m%-*s\11\33[0m | \33[1m\33[1;36m%-*s\11\33[0m | \33[1m\33[1;36m%-*s\11\33[0m\12\0"
	.text
	.globl	mostrarPromedio
	.def	mostrarPromedio;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarPromedio
mostrarPromedio:
.LFB29:
	.loc 1 240 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 241 18
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 243 255
	movq	-8(%rbp), %rax
	leaq	63(%rax), %rcx
	.loc 1 243 232
	movq	-8(%rbp), %rax
	leaq	45(%rax), %rdx
	.loc 1 243 215
	movq	-8(%rbp), %rax
	addq	$30, %rax
	.loc 1 243 199
	movq	-8(%rbp), %r8
	.loc 1 243 5
	movq	%rcx, 64(%rsp)
	movl	$18, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movl	$18, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$15, %r9d
	movl	$30, %edx
	leaq	.LC32(%rip), %rcx
	call	printf
	.loc 1 244 1
	nop
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.seh_endproc
	.section .rdata,"dr"
.LC33:
	.ascii "Enero\0"
.LC34:
	.ascii "Febrero\0"
.LC35:
	.ascii "Marzo\0"
.LC36:
	.ascii "Abril\0"
.LC37:
	.ascii "Mayo\0"
.LC38:
	.ascii "Junio\0"
.LC39:
	.ascii "Julio\0"
.LC40:
	.ascii "Agosto\0"
.LC41:
	.ascii "Septiembre\0"
.LC42:
	.ascii "Octubre\0"
.LC43:
	.ascii "Noviembre\0"
.LC44:
	.ascii "Diciembre\0"
	.data
	.align 32
meses.4783:
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.align 8
codsBien.4803:
	.ascii "01\0"
	.ascii "02\0"
	.ascii "03\0"
	.ascii "05\0"
	.ascii "12\0"
	.align 16
codsSer.4813:
	.ascii "04\0"
	.ascii "06\0"
	.ascii "07\0"
	.ascii "08\0"
	.ascii "09\0"
	.ascii "10\0"
	.ascii "11\0"
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1079574528
	.align 8
.LC14:
	.long	0
	.long	1097011920
	.align 8
.LC30:
	.long	0
	.long	1075052544
	.align 8
.LC31:
	.long	0
	.long	1075576832
	.text
.Letext0:
	.file 2 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/crtdefs.h"
	.file 3 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdlib.h"
	.file 4 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/malloc.h"
	.file 5 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/ctype.h"
	.file 6 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/vector.h"
	.file 7 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/comunes.h"
	.file 8 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/formulario.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x1236
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C89 8.1.0 -mtune=core2 -march=nocona -g -std=c90\0"
	.byte	0x1
	.ascii "C:\\Users\\LENOVO\\OneDrive\\Escritorio\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\\herramientasDivisiones.c\0"
	.ascii "C:\\\\Users\\\\LENOVO\\\\OneDrive\\\\Escritorio\\\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.long	0x12c
	.uleb128 0x4
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x23
	.byte	0x2a
	.long	0x148
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x4
	.ascii "wchar_t\0"
	.byte	0x2
	.byte	0x62
	.byte	0x18
	.long	0x183
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.long	0x183
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
	.long	0x1c9
	.uleb128 0x6
	.byte	0x8
	.long	0x1cf
	.uleb128 0x7
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x2
	.word	0x1bc
	.byte	0x10
	.long	0x379
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1bd
	.byte	0x7
	.long	0x19e
	.byte	0
	.uleb128 0x9
	.ascii "lc_codepage\0"
	.byte	0x2
	.word	0x1be
	.byte	0x10
	.long	0x4c6
	.byte	0x4
	.uleb128 0x9
	.ascii "lc_collate_cp\0"
	.byte	0x2
	.word	0x1bf
	.byte	0x10
	.long	0x4c6
	.byte	0x8
	.uleb128 0x9
	.ascii "lc_handle\0"
	.byte	0x2
	.word	0x1c0
	.byte	0x11
	.long	0x4d6
	.byte	0xc
	.uleb128 0x9
	.ascii "lc_id\0"
	.byte	0x2
	.word	0x1c1
	.byte	0x9
	.long	0x4fb
	.byte	0x24
	.uleb128 0x9
	.ascii "lc_category\0"
	.byte	0x2
	.word	0x1c7
	.byte	0x5
	.long	0x50b
	.byte	0x48
	.uleb128 0xa
	.ascii "lc_clike\0"
	.byte	0x2
	.word	0x1c8
	.byte	0x7
	.long	0x19e
	.word	0x108
	.uleb128 0xa
	.ascii "mb_cur_max\0"
	.byte	0x2
	.word	0x1c9
	.byte	0x7
	.long	0x19e
	.word	0x10c
	.uleb128 0xa
	.ascii "lconv_intl_refcount\0"
	.byte	0x2
	.word	0x1ca
	.byte	0x8
	.long	0x4c0
	.word	0x110
	.uleb128 0xa
	.ascii "lconv_num_refcount\0"
	.byte	0x2
	.word	0x1cb
	.byte	0x8
	.long	0x4c0
	.word	0x118
	.uleb128 0xa
	.ascii "lconv_mon_refcount\0"
	.byte	0x2
	.word	0x1cc
	.byte	0x8
	.long	0x4c0
	.word	0x120
	.uleb128 0xa
	.ascii "lconv\0"
	.byte	0x2
	.word	0x1cd
	.byte	0x11
	.long	0x522
	.word	0x128
	.uleb128 0xa
	.ascii "ctype1_refcount\0"
	.byte	0x2
	.word	0x1ce
	.byte	0x8
	.long	0x4c0
	.word	0x130
	.uleb128 0xa
	.ascii "ctype1\0"
	.byte	0x2
	.word	0x1cf
	.byte	0x13
	.long	0x528
	.word	0x138
	.uleb128 0xa
	.ascii "pctype\0"
	.byte	0x2
	.word	0x1d0
	.byte	0x19
	.long	0x52e
	.word	0x140
	.uleb128 0xa
	.ascii "pclmap\0"
	.byte	0x2
	.word	0x1d1
	.byte	0x18
	.long	0x534
	.word	0x148
	.uleb128 0xa
	.ascii "pcumap\0"
	.byte	0x2
	.word	0x1d2
	.byte	0x18
	.long	0x534
	.word	0x150
	.uleb128 0xa
	.ascii "lc_time_curr\0"
	.byte	0x2
	.word	0x1d3
	.byte	0x1a
	.long	0x560
	.word	0x158
	.byte	0
	.uleb128 0x5
	.ascii "pthreadmbcinfo\0"
	.byte	0x2
	.word	0x1a9
	.byte	0x25
	.long	0x391
	.uleb128 0x6
	.byte	0x8
	.long	0x397
	.uleb128 0xb
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xc
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x2
	.word	0x1ac
	.byte	0x10
	.long	0x3ed
	.uleb128 0x9
	.ascii "locinfo\0"
	.byte	0x2
	.word	0x1ad
	.byte	0x12
	.long	0x1b1
	.byte	0
	.uleb128 0x9
	.ascii "mbcinfo\0"
	.byte	0x2
	.word	0x1ae
	.byte	0x12
	.long	0x379
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.ascii "_locale_tstruct\0"
	.byte	0x2
	.word	0x1af
	.byte	0x3
	.long	0x3ac
	.uleb128 0xc
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x2
	.word	0x1b3
	.byte	0x10
	.long	0x455
	.uleb128 0x9
	.ascii "wLanguage\0"
	.byte	0x2
	.word	0x1b4
	.byte	0x12
	.long	0x183
	.byte	0
	.uleb128 0x9
	.ascii "wCountry\0"
	.byte	0x2
	.word	0x1b5
	.byte	0x12
	.long	0x183
	.byte	0x2
	.uleb128 0x9
	.ascii "wCodePage\0"
	.byte	0x2
	.word	0x1b6
	.byte	0x12
	.long	0x183
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "LC_ID\0"
	.byte	0x2
	.word	0x1b7
	.byte	0x3
	.long	0x406
	.uleb128 0xd
	.byte	0x20
	.byte	0x2
	.word	0x1c2
	.byte	0x3
	.long	0x4b4
	.uleb128 0x9
	.ascii "locale\0"
	.byte	0x2
	.word	0x1c3
	.byte	0xb
	.long	0x4b4
	.byte	0
	.uleb128 0x9
	.ascii "wlocale\0"
	.byte	0x2
	.word	0x1c4
	.byte	0xe
	.long	0x4ba
	.byte	0x8
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1c5
	.byte	0xa
	.long	0x4c0
	.byte	0x10
	.uleb128 0x9
	.ascii "wrefcount\0"
	.byte	0x2
	.word	0x1c6
	.byte	0xa
	.long	0x4c0
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12c
	.uleb128 0x6
	.byte	0x8
	.long	0x173
	.uleb128 0x6
	.byte	0x8
	.long	0x19e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xe
	.long	0x4e6
	.long	0x4e6
	.uleb128 0xf
	.long	0x148
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xe
	.long	0x455
	.long	0x50b
	.uleb128 0xf
	.long	0x148
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.long	0x464
	.long	0x51b
	.uleb128 0xf
	.long	0x148
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.ascii "lconv\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x51b
	.uleb128 0x6
	.byte	0x8
	.long	0x183
	.uleb128 0x6
	.byte	0x8
	.long	0x199
	.uleb128 0x6
	.byte	0x8
	.long	0x54b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.long	0x53a
	.uleb128 0xb
	.ascii "__lc_time_data\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x550
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
	.uleb128 0x10
	.ascii "__imp___mb_cur_max\0"
	.byte	0x3
	.byte	0x73
	.byte	0x10
	.long	0x4c0
	.uleb128 0xe
	.long	0x4b4
	.long	0x5b3
	.uleb128 0xf
	.long	0x148
	.byte	0
	.byte	0
	.uleb128 0x10
	.ascii "_sys_errlist\0"
	.byte	0x3
	.byte	0xac
	.byte	0x2b
	.long	0x5a3
	.uleb128 0x10
	.ascii "_sys_nerr\0"
	.byte	0x3
	.byte	0xad
	.byte	0x29
	.long	0x19e
	.uleb128 0x11
	.ascii "__imp___argc\0"
	.byte	0x3
	.word	0x119
	.byte	0x10
	.long	0x4c0
	.uleb128 0x11
	.ascii "__imp___argv\0"
	.byte	0x3
	.word	0x11d
	.byte	0x13
	.long	0x606
	.uleb128 0x6
	.byte	0x8
	.long	0x60c
	.uleb128 0x6
	.byte	0x8
	.long	0x4b4
	.uleb128 0x11
	.ascii "__imp___wargv\0"
	.byte	0x3
	.word	0x121
	.byte	0x16
	.long	0x629
	.uleb128 0x6
	.byte	0x8
	.long	0x62f
	.uleb128 0x6
	.byte	0x8
	.long	0x4ba
	.uleb128 0x11
	.ascii "__imp__environ\0"
	.byte	0x3
	.word	0x127
	.byte	0x13
	.long	0x606
	.uleb128 0x11
	.ascii "__imp__wenviron\0"
	.byte	0x3
	.word	0x12c
	.byte	0x16
	.long	0x629
	.uleb128 0x11
	.ascii "__imp__pgmptr\0"
	.byte	0x3
	.word	0x132
	.byte	0x12
	.long	0x60c
	.uleb128 0x11
	.ascii "__imp__wpgmptr\0"
	.byte	0x3
	.word	0x137
	.byte	0x15
	.long	0x62f
	.uleb128 0x11
	.ascii "__imp__osplatform\0"
	.byte	0x3
	.word	0x13c
	.byte	0x19
	.long	0x6b0
	.uleb128 0x6
	.byte	0x8
	.long	0x4c6
	.uleb128 0x11
	.ascii "__imp__osver\0"
	.byte	0x3
	.word	0x141
	.byte	0x19
	.long	0x6b0
	.uleb128 0x11
	.ascii "__imp__winver\0"
	.byte	0x3
	.word	0x146
	.byte	0x19
	.long	0x6b0
	.uleb128 0x11
	.ascii "__imp__winmajor\0"
	.byte	0x3
	.word	0x14b
	.byte	0x19
	.long	0x6b0
	.uleb128 0x11
	.ascii "__imp__winminor\0"
	.byte	0x3
	.word	0x150
	.byte	0x19
	.long	0x6b0
	.uleb128 0x10
	.ascii "_amblksiz\0"
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.long	0x4c6
	.uleb128 0x10
	.ascii "__imp__pctype\0"
	.byte	0x5
	.byte	0x2b
	.byte	0x1c
	.long	0x73d
	.uleb128 0x6
	.byte	0x8
	.long	0x528
	.uleb128 0x10
	.ascii "__imp__wctype\0"
	.byte	0x5
	.byte	0x3b
	.byte	0x1c
	.long	0x73d
	.uleb128 0x10
	.ascii "__imp__pwctype\0"
	.byte	0x5
	.byte	0x47
	.byte	0x1c
	.long	0x73d
	.uleb128 0xe
	.long	0x54b
	.long	0x77b
	.uleb128 0x12
	.byte	0
	.uleb128 0x3
	.long	0x770
	.uleb128 0x10
	.ascii "__newclmap\0"
	.byte	0x5
	.byte	0x50
	.byte	0x1e
	.long	0x77b
	.uleb128 0x10
	.ascii "__newcumap\0"
	.byte	0x5
	.byte	0x51
	.byte	0x1e
	.long	0x77b
	.uleb128 0x10
	.ascii "__ptlocinfo\0"
	.byte	0x5
	.byte	0x52
	.byte	0x19
	.long	0x1b1
	.uleb128 0x10
	.ascii "__ptmbcinfo\0"
	.byte	0x5
	.byte	0x53
	.byte	0x19
	.long	0x379
	.uleb128 0x10
	.ascii "__globallocalestatus\0"
	.byte	0x5
	.byte	0x54
	.byte	0xe
	.long	0x19e
	.uleb128 0x10
	.ascii "__locale_changed\0"
	.byte	0x5
	.byte	0x55
	.byte	0xe
	.long	0x19e
	.uleb128 0x10
	.ascii "__initiallocinfo\0"
	.byte	0x5
	.byte	0x56
	.byte	0x28
	.long	0x1cf
	.uleb128 0x10
	.ascii "__initiallocalestructinfo\0"
	.byte	0x5
	.byte	0x57
	.byte	0x1a
	.long	0x3ed
	.uleb128 0x13
	.byte	0x20
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.long	0x88d
	.uleb128 0x14
	.ascii "data\0"
	.byte	0x6
	.byte	0x17
	.byte	0xb
	.long	0x88d
	.byte	0
	.uleb128 0x14
	.ascii "cantElem\0"
	.byte	0x6
	.byte	0x18
	.byte	0xc
	.long	0x139
	.byte	0x8
	.uleb128 0x14
	.ascii "tamElem\0"
	.byte	0x6
	.byte	0x19
	.byte	0xc
	.long	0x139
	.byte	0x10
	.uleb128 0x14
	.ascii "capacidad\0"
	.byte	0x6
	.byte	0x1a
	.byte	0xc
	.long	0x139
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x8
	.uleb128 0x4
	.ascii "Vector_t\0"
	.byte	0x6
	.byte	0x1b
	.byte	0x2
	.long	0x83f
	.uleb128 0x6
	.byte	0x8
	.long	0x88f
	.uleb128 0x13
	.byte	0xd7
	.byte	0x7
	.byte	0x35
	.byte	0x9
	.long	0x935
	.uleb128 0x14
	.ascii "cod\0"
	.byte	0x7
	.byte	0x36
	.byte	0xa
	.long	0x935
	.byte	0
	.uleb128 0x14
	.ascii "desc\0"
	.byte	0x7
	.byte	0x37
	.byte	0xa
	.long	0x945
	.byte	0xf
	.uleb128 0x14
	.ascii "clasif\0"
	.byte	0x7
	.byte	0x38
	.byte	0xa
	.long	0x955
	.byte	0x4c
	.uleb128 0x14
	.ascii "indiceIPC\0"
	.byte	0x7
	.byte	0x39
	.byte	0xa
	.long	0x965
	.byte	0x74
	.uleb128 0x14
	.ascii "varMensIPC\0"
	.byte	0x7
	.byte	0x3a
	.byte	0xa
	.long	0x965
	.byte	0x86
	.uleb128 0x14
	.ascii "varAnualIPC\0"
	.byte	0x7
	.byte	0x3b
	.byte	0xa
	.long	0x965
	.byte	0x98
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x3c
	.byte	0xa
	.long	0x935
	.byte	0xaa
	.uleb128 0x14
	.ascii "periodo\0"
	.byte	0x7
	.byte	0x3d
	.byte	0xa
	.long	0x975
	.byte	0xb9
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x945
	.uleb128 0xf
	.long	0x148
	.byte	0xe
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x955
	.uleb128 0xf
	.long	0x148
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x965
	.uleb128 0xf
	.long	0x148
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x975
	.uleb128 0xf
	.long	0x148
	.byte	0x11
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x985
	.uleb128 0xf
	.long	0x148
	.byte	0x1d
	.byte	0
	.uleb128 0x4
	.ascii "IPCDivisiones\0"
	.byte	0x7
	.byte	0x3e
	.byte	0x2
	.long	0x8a6
	.uleb128 0x13
	.byte	0x58
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0x9e9
	.uleb128 0x14
	.ascii "monto\0"
	.byte	0x7
	.byte	0x41
	.byte	0xc
	.long	0x566
	.byte	0
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x42
	.byte	0xa
	.long	0x935
	.byte	0x8
	.uleb128 0x14
	.ascii "periodoIni\0"
	.byte	0x7
	.byte	0x43
	.byte	0xa
	.long	0x975
	.byte	0x17
	.uleb128 0x14
	.ascii "periodoFin\0"
	.byte	0x7
	.byte	0x44
	.byte	0xa
	.long	0x975
	.byte	0x35
	.byte	0
	.uleb128 0x4
	.ascii "RespuestaMontos\0"
	.byte	0x7
	.byte	0x45
	.byte	0x2
	.long	0x99b
	.uleb128 0x13
	.byte	0x51
	.byte	0x7
	.byte	0x47
	.byte	0x9
	.long	0xa56
	.uleb128 0x14
	.ascii "fecha\0"
	.byte	0x7
	.byte	0x48
	.byte	0xa
	.long	0x975
	.byte	0
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x49
	.byte	0xa
	.long	0x935
	.byte	0x1e
	.uleb128 0x14
	.ascii "indiceBienes\0"
	.byte	0x7
	.byte	0x4a
	.byte	0xa
	.long	0x965
	.byte	0x2d
	.uleb128 0x14
	.ascii "indiceServicios\0"
	.byte	0x7
	.byte	0x4b
	.byte	0xa
	.long	0x965
	.byte	0x3f
	.byte	0
	.uleb128 0x4
	.ascii "IPCPromedio\0"
	.byte	0x7
	.byte	0x4c
	.byte	0x2
	.long	0xa01
	.uleb128 0x13
	.byte	0xd0
	.byte	0x8
	.byte	0x1c
	.byte	0x9
	.long	0xac7
	.uleb128 0x14
	.ascii "etiqueta\0"
	.byte	0x8
	.byte	0x1d
	.byte	0xa
	.long	0xac7
	.byte	0
	.uleb128 0x14
	.ascii "respuesta\0"
	.byte	0x8
	.byte	0x1e
	.byte	0xa
	.long	0xad7
	.byte	0x40
	.uleb128 0x14
	.ascii "validado\0"
	.byte	0x8
	.byte	0x1f
	.byte	0x9
	.long	0x19e
	.byte	0xc0
	.uleb128 0x14
	.ascii "tipo\0"
	.byte	0x8
	.byte	0x20
	.byte	0x9
	.long	0x19e
	.byte	0xc4
	.uleb128 0x14
	.ascii "info\0"
	.byte	0x8
	.byte	0x21
	.byte	0xb
	.long	0x88d
	.byte	0xc8
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0xad7
	.uleb128 0xf
	.long	0x148
	.byte	0x3f
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0xae7
	.uleb128 0xf
	.long	0x148
	.byte	0x7f
	.byte	0
	.uleb128 0x4
	.ascii "Campo\0"
	.byte	0x8
	.byte	0x22
	.byte	0x2
	.long	0xa6a
	.uleb128 0x17
	.word	0xdd0
	.byte	0x8
	.byte	0x25
	.byte	0x9
	.long	0xb51
	.uleb128 0x14
	.ascii "titulo\0"
	.byte	0x8
	.byte	0x26
	.byte	0xa
	.long	0xac7
	.byte	0
	.uleb128 0x14
	.ascii "campos\0"
	.byte	0x8
	.byte	0x27
	.byte	0xb
	.long	0xb51
	.byte	0x40
	.uleb128 0x18
	.ascii "ce\0"
	.byte	0x8
	.byte	0x28
	.byte	0x9
	.long	0x19e
	.word	0xd40
	.uleb128 0x18
	.ascii "Validaciones\0"
	.byte	0x8
	.byte	0x2a
	.byte	0xb
	.long	0xb61
	.word	0xd48
	.uleb128 0x18
	.ascii "cv\0"
	.byte	0x8
	.byte	0x2b
	.byte	0x9
	.long	0x19e
	.word	0xdc8
	.byte	0
	.uleb128 0xe
	.long	0xae7
	.long	0xb61
	.uleb128 0xf
	.long	0x148
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.long	0xb71
	.long	0xb71
	.uleb128 0xf
	.long	0x148
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb77
	.uleb128 0x19
	.long	0x19e
	.long	0xb86
	.uleb128 0x1a
	.long	0x88d
	.byte	0
	.uleb128 0x4
	.ascii "Formulario_t\0"
	.byte	0x8
	.byte	0x2c
	.byte	0x2
	.long	0xaf5
	.uleb128 0x1b
	.ascii "mostrarPromedio\0"
	.byte	0x1
	.byte	0xef
	.byte	0x6
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe4
	.uleb128 0x1c
	.ascii "reg\0"
	.byte	0x1
	.byte	0xef
	.byte	0x1c
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xf1
	.byte	0x12
	.long	0xbe4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa56
	.uleb128 0x1e
	.ascii "unirBienesYServicios\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x7
	.long	0x88d
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xc7b
	.uleb128 0x1c
	.ascii "lhs\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x22
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "rhs\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x2d
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "elem\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x38
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.ascii "tmpL\0"
	.byte	0x1
	.byte	0xe3
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "tmpR\0"
	.byte	0x1
	.byte	0xe4
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xe5
	.byte	0x12
	.long	0xbe4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x985
	.uleb128 0x1e
	.ascii "reducirBySProm\0"
	.byte	0x1
	.byte	0xd2
	.byte	0x7
	.long	0x88d
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xcf3
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0xd2
	.byte	0x1c
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "acumulado\0"
	.byte	0x1
	.byte	0xd2
	.byte	0x28
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xd4
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.ascii "tmpA\0"
	.byte	0x1
	.byte	0xd5
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1e
	.ascii "compararPeriodo\0"
	.byte	0x1
	.byte	0xca
	.byte	0x5
	.long	0x19e
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xd5a
	.uleb128 0x1c
	.ascii "lhs\0"
	.byte	0x1
	.byte	0xca
	.byte	0x1b
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "rhs\0"
	.byte	0x1
	.byte	0xca
	.byte	0x26
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0xcc
	.byte	0xb
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "j\0"
	.byte	0x1
	.byte	0xcd
	.byte	0xb
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1f
	.ascii "obtenerPeriodo\0"
	.byte	0x1
	.byte	0xc3
	.byte	0x7
	.long	0x88d
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xda7
	.uleb128 0x1c
	.ascii "elem\0"
	.byte	0x1
	.byte	0xc3
	.byte	0x1c
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xc5
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.ascii "filtrarServicios\0"
	.byte	0x1
	.byte	0xb0
	.byte	0x5
	.long	0x19e
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xe2c
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0xb0
	.byte	0x1c
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.secrel32	.LASF2
	.byte	0x1
	.byte	0xb0
	.byte	0x28
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xb2
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "codsSer\0"
	.byte	0x1
	.byte	0xb3
	.byte	0x11
	.long	0xe2c
	.uleb128 0x9
	.byte	0x3
	.quad	codsSer.4813
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0xb4
	.byte	0x9
	.long	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0xe42
	.uleb128 0xf
	.long	0x148
	.byte	0x6
	.uleb128 0xf
	.long	0x148
	.byte	0x2
	.byte	0
	.uleb128 0x1e
	.ascii "filtrarBienes\0"
	.byte	0x1
	.byte	0x9d
	.byte	0x5
	.long	0x19e
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xec5
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0x9d
	.byte	0x19
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.secrel32	.LASF2
	.byte	0x1
	.byte	0x9d
	.byte	0x25
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x9f
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "codsBien\0"
	.byte	0x1
	.byte	0xa0
	.byte	0x11
	.long	0xec5
	.uleb128 0x9
	.byte	0x3
	.quad	codsBien.4803
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0xa1
	.byte	0x9
	.long	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0xedb
	.uleb128 0xf
	.long	0x148
	.byte	0x4
	.uleb128 0xf
	.long	0x148
	.byte	0x2
	.byte	0
	.uleb128 0x1e
	.ascii "clasificarBySIPCDivisiones\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x5
	.long	0x19e
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xf60
	.uleb128 0x1c
	.ascii "divs\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x2a
	.long	0x8a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "bienes\0"
	.byte	0x1
	.byte	0x7e
	.byte	0xf
	.long	0x8a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "servicios\0"
	.byte	0x1
	.byte	0x7f
	.byte	0xf
	.long	0x8a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "nacional\0"
	.byte	0x1
	.byte	0x80
	.byte	0xf
	.long	0x8a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1e
	.ascii "filtrarIPCDivisiones\0"
	.byte	0x1
	.byte	0x6c
	.byte	0x5
	.long	0x19e
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xfd3
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0x6c
	.byte	0x20
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.secrel32	.LASF2
	.byte	0x1
	.byte	0x6c
	.byte	0x2c
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "tmpD\0"
	.byte	0x1
	.byte	0x6e
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "tmpC\0"
	.byte	0x1
	.byte	0x6f
	.byte	0x16
	.long	0xfd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9e9
	.uleb128 0x1e
	.ascii "convertirFechaResDivs\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.long	0x4b4
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x1051
	.uleb128 0x1c
	.ascii "ans\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "meses\0"
	.byte	0x1
	.byte	0x5d
	.byte	0x12
	.long	0x1051
	.uleb128 0x9
	.byte	0x3
	.quad	meses.4783
	.uleb128 0x1d
	.ascii "a\0"
	.byte	0x1
	.byte	0x62
	.byte	0xa
	.long	0x1061
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1d
	.ascii "mes\0"
	.byte	0x1
	.byte	0x63
	.byte	0xb
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	0x4b4
	.long	0x1061
	.uleb128 0xf
	.long	0x148
	.byte	0xb
	.byte	0
	.uleb128 0xe
	.long	0x12c
	.long	0x1071
	.uleb128 0xf
	.long	0x148
	.byte	0x4
	.byte	0
	.uleb128 0x1e
	.ascii "validarFechaResDivs\0"
	.byte	0x1
	.byte	0x45
	.byte	0x5
	.long	0x19e
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x10fe
	.uleb128 0x1c
	.ascii "ptr\0"
	.byte	0x1
	.byte	0x45
	.byte	0x1f
	.long	0x88d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.byte	0x47
	.byte	0x13
	.long	0x10fe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "ini\0"
	.byte	0x1
	.byte	0x48
	.byte	0xb
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "fin\0"
	.byte	0x1
	.byte	0x49
	.byte	0xb
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.ascii "tmpI\0"
	.byte	0x1
	.byte	0x4a
	.byte	0x9
	.long	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1d
	.ascii "tmpF\0"
	.byte	0x1
	.byte	0x4a
	.byte	0xf
	.long	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb86
	.uleb128 0x1e
	.ascii "preguntarAjustarMonto\0"
	.byte	0x1
	.byte	0x2b
	.byte	0x11
	.long	0x9e9
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x116f
	.uleb128 0x1d
	.ascii "ans\0"
	.byte	0x1
	.byte	0x2d
	.byte	0x15
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1d
	.ascii "form\0"
	.byte	0x1
	.byte	0x2e
	.byte	0x12
	.long	0xb86
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3664
	.uleb128 0x1d
	.ascii "regiones\0"
	.byte	0x1
	.byte	0x2f
	.byte	0x11
	.long	0x116f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3792
	.byte	0
	.uleb128 0xe
	.long	0x117f
	.long	0x117f
	.uleb128 0xf
	.long	0x148
	.byte	0xe
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x134
	.uleb128 0x21
	.ascii "herramientaAjustarMontosIPCDivisiones\0"
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.long	0x19e
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.ascii "divs\0"
	.byte	0x1
	.byte	0xb
	.byte	0x35
	.long	0x8a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.ascii "ans\0"
	.byte	0x1
	.byte	0xe
	.byte	0x15
	.long	0x9e9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0xf
	.byte	0x14
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.byte	0xf
	.byte	0x1e
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.ascii "varPor\0"
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.long	0x566
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1d
	.ascii "montoAjus\0"
	.byte	0x1
	.byte	0x10
	.byte	0x14
	.long	0x566
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x18
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
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
.LASF2:
	.ascii "contexto\0"
.LASF0:
	.ascii "refcount\0"
.LASF1:
	.ascii "region\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	filtrarVector;	.scl	2;	.type	32;	.endef
	.def	vectorCantElem;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	vectorObtener;	.scl	2;	.type	32;	.endef
	.def	atof;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	esperarInput;	.scl	2;	.type	32;	.endef
	.def	vectorDestruir;	.scl	2;	.type	32;	.endef
	.def	formularioInit;	.scl	2;	.type	32;	.endef
	.def	formularioAgregarCampoVA;	.scl	2;	.type	32;	.endef
	.def	formularioAgregarValidado;	.scl	2;	.type	32;	.endef
	.def	formularioPublicar;	.scl	2;	.type	32;	.endef
	.def	formularioRespuesta;	.scl	2;	.type	32;	.endef
	.def	stringNCopy;	.scl	2;	.type	32;	.endef
	.def	formularioDestruir;	.scl	2;	.type	32;	.endef
	.def	formularioRawRespuesta;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	stringCmp;	.scl	2;	.type	32;	.endef
	.def	reducirVectorPorClave;	.scl	2;	.type	32;	.endef
	.def	unirVectores;	.scl	2;	.type	32;	.endef
	.def	mostrarVector;	.scl	2;	.type	32;	.endef
	.def	stringNCmp;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.validarFechaForm, "dr"
	.globl	.refptr.validarFechaForm
	.linkonce	discard
.refptr.validarFechaForm:
	.quad	validarFechaForm
