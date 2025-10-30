	.file	"herramientasAperturas.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section .rdata,"dr"
.LC0:
	.ascii "%s\0"
.LC1:
	.ascii "\33[2J\33[H\0"
	.align 8
.LC2:
	.ascii "El alquiler original de \33[1m\33[1;36m$%s\33[0m a la fecha \33[1m\33[1;36m%s\33[0m en la region \33[1m\33[1;36m%s\33[0m, ha variado en un \33[1m\33[1;33m%%%s\33[0m hacia un total ajustado de \33[1m\33[1;33m$%s\33[0m al periodo \33[1m\33[1;36m%s\33[0m\12\0"
.LC3:
	.ascii "Periodo\0"
	.align 8
.LC4:
	.ascii "\33[1m%-*s\11 | %-*s\11 | %-*s\11 | %-*s\33[0m\12\0"
.LC5:
	.ascii "Monto ajustado\0"
.LC6:
	.ascii "Variacion%\0"
.LC7:
	.ascii "Indice\0"
	.align 8
.LC8:
	.ascii "\33[1m\33[1;37m-------------------------------------------------------------------------------------------------\33[0m\0"
	.align 8
.LC9:
	.ascii "./archivos/pruebaAlquileres.dat\0"
	.align 8
.LC10:
	.ascii "\33[1mContenidos del archivo binario\12\33[0m\0"
	.text
	.globl	herramientaCalcularAlquilerIPCAperturas
	.def	herramientaCalcularAlquilerIPCAperturas;	.scl	2;	.type	32;	.endef
	.seh_proc	herramientaCalcularAlquilerIPCAperturas
herramientaCalcularAlquilerIPCAperturas:
.LFB17:
	.file 1 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/herramientasAperturas.c"
	.loc 1 12 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subq	$304, %rsp
	.seh_stackalloc	304
	.cfi_def_cfa_offset 320
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.cfi_def_cfa 6, 192
	.seh_endprologue
	movq	%rcx, 192(%rbp)
	.loc 1 15 10
	movq	$0, 49(%rbp)
	movl	$0, 57(%rbp)
	movw	$0, 61(%rbp)
	movb	$0, 63(%rbp)
	.loc 1 17 11
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	preguntarAlquileres
	movq	-48(%rbp), %rax
	movq	%rax, 64(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, 72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, 80(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, 88(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, 96(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, 104(%rbp)
	movq	0(%rbp), %rax
	movq	%rax, 112(%rbp)
	movq	8(%rbp), %rax
	movq	%rax, 120(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, 128(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, 136(%rbp)
	movzbl	32(%rbp), %eax
	movb	%al, 144(%rbp)
	.loc 1 19 18
	leaq	64(%rbp), %rax
	movq	%rax, %r8
	leaq	filtrarAlquileres(%rip), %rdx
	movq	192(%rbp), %rcx
	call	filtrarVector
	movq	%rax, 168(%rbp)
	.loc 1 21 5
	leaq	64(%rbp), %rax
	leaq	48(%rax), %rdx
	leaq	49(%rbp), %rax
	movl	$15, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 22 50
	movq	168(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	vectorObtener
	.loc 1 22 79
	leaq	146(%rax), %rdx
	.loc 1 22 5
	leaq	64(%rbp), %rax
	addq	$63, %rax
	movq	%rdx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 24 18
	leaq	64(%rbp), %rdx
	movq	168(%rbp), %rax
	movq	%rdx, %r9
	movl	$84, %r8d
	leaq	mapearAlquileres(%rip), %rdx
	movq	%rax, %rcx
	call	mapearVector
	movq	%rax, 168(%rbp)
	.loc 1 28 55
	movq	168(%rbp), %rax
	movq	%rax, %rcx
	call	vectorCantElem
	.loc 1 28 29
	leaq	-1(%rax), %rdx
	movq	168(%rbp), %rax
	movq	%rax, %rcx
	call	vectorObtener
	movq	%rax, 160(%rbp)
	.loc 1 29 5
	leaq	.LC1(%rip), %rcx
	call	puts
	.loc 1 33 96
	movq	160(%rbp), %r10
	.loc 1 33 73
	movq	160(%rbp), %rax
	leaq	66(%rax), %r9
	.loc 1 33 51
	movq	160(%rbp), %rax
	leaq	48(%rax), %r8
	.loc 1 30 5
	leaq	49(%rbp), %rcx
	leaq	64(%rbp), %rdx
	leaq	64(%rbp), %rax
	addq	$30, %rax
	movq	%r10, 48(%rsp)
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	.loc 1 35 5
	call	esperarInput
	.loc 1 37 5
	leaq	.LC1(%rip), %rcx
	call	puts
	.loc 1 38 5
	leaq	.LC5(%rip), %rax
	movq	%rax, 64(%rsp)
	movl	$18, 56(%rsp)
	leaq	.LC6(%rip), %rax
	movq	%rax, 48(%rsp)
	movl	$18, 40(%rsp)
	leaq	.LC7(%rip), %rax
	movq	%rax, 32(%rsp)
	movl	$18, %r9d
	leaq	.LC3(%rip), %r8
	movl	$30, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 39 5
	leaq	.LC8(%rip), %rcx
	call	puts
	.loc 1 41 5
	movq	168(%rbp), %rax
	leaq	mostrarAlquileres(%rip), %rdx
	movq	%rax, %rcx
	call	mostrarVector
	.loc 1 43 5
	call	esperarInput
	.loc 1 45 5
	movq	168(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	vectorEscribirABinario
	.loc 1 46 5
	movq	168(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	vectorLeerDeBinario
	.loc 1 48 5
	leaq	.LC1(%rip), %rcx
	call	puts
	.loc 1 49 5
	leaq	.LC10(%rip), %rcx
	call	printf
	.loc 1 50 5
	leaq	.LC5(%rip), %rax
	movq	%rax, 64(%rsp)
	movl	$18, 56(%rsp)
	leaq	.LC6(%rip), %rax
	movq	%rax, 48(%rsp)
	movl	$18, 40(%rsp)
	leaq	.LC7(%rip), %rax
	movq	%rax, 32(%rsp)
	movl	$18, %r9d
	leaq	.LC3(%rip), %r8
	movl	$30, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 51 5
	leaq	.LC8(%rip), %rcx
	call	puts
	.loc 1 52 5
	movq	168(%rbp), %rax
	leaq	mostrarAlquileres(%rip), %rdx
	movq	%rax, %rcx
	call	mostrarVector
	.loc 1 54 5
	call	esperarInput
	.loc 1 56 5
	movq	168(%rbp), %rax
	movq	%rax, %rcx
	call	vectorDestruir
	.loc 1 58 12
	movl	$0, %eax
	.loc 1 59 1
	addq	$304, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, -296
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "Nacional\0"
.LC12:
	.ascii "GBA\0"
.LC13:
	.ascii "Pampeana\0"
.LC14:
	.ascii "Cuyo\0"
.LC15:
	.ascii "Noroeste\0"
.LC16:
	.ascii "Noreste\0"
.LC17:
	.ascii "Patagonia\0"
	.align 8
.LC18:
	.ascii "Calcular alquileres por inflacion\0"
	.align 8
.LC19:
	.ascii "Ingrese monto del alquiler ($)\0"
.LC22:
	.ascii "Seleccione region de analisis\0"
	.align 8
.LC23:
	.ascii "Ingrese periodo de inicio del contrato (AAAA-MM)\0"
	.text
	.globl	preguntarAlquileres
	.def	preguntarAlquileres;	.scl	2;	.type	32;	.endef
	.seh_proc	preguntarAlquileres
preguntarAlquileres:
.LFB18:
	.loc 1 62 1
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
	.loc 1 66 11
	leaq	-64(%rbp), %rdx
	movl	$0, %eax
	movl	$15, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	.LC11(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC13(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC14(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, -16(%rbp)
	.loc 1 68 5
	leaq	64(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	formularioInit
	.loc 1 70 5
	leaq	64(%rbp), %rax
	movsd	.LC20(%rip), %xmm0
	movsd	%xmm0, 40(%rsp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %r8d
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 71 5
	leaq	64(%rbp), %rax
	leaq	-64(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movl	$6, 32(%rsp)
	movl	$2, %r9d
	movl	$1, %r8d
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 72 5
	leaq	64(%rbp), %rax
	leaq	convertirFechaResAper(%rip), %rdx
	movq	%rdx, 48(%rsp)
	movq	.refptr.validarFechaForm(%rip), %rdx
	movq	%rdx, 40(%rsp)
	movl	$30, 32(%rsp)
	movl	$1, %r9d
	movl	$1, %r8d
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	formularioAgregarCampoVA
	.loc 1 74 5
	leaq	64(%rbp), %rax
	movq	%rax, %rcx
	call	formularioPublicar
	.loc 1 76 28
	leaq	64(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 76 5
	leaq	3600(%rbp), %rax
	addq	$30, %rax
	movl	$18, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 77 29
	leaq	64(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 77 5
	leaq	3600(%rbp), %rax
	addq	$48, %rax
	movl	$15, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 78 30
	leaq	64(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	formularioRespuesta
	movq	%rax, %rdx
	.loc 1 78 5
	leaq	3600(%rbp), %rax
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 80 5
	leaq	64(%rbp), %rax
	movq	%rax, %rcx
	call	formularioDestruir
	.loc 1 82 12
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
	movzbl	3680(%rbp), %edx
	movb	%dl, 80(%rax)
	.loc 1 83 1
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
.LC24:
	.ascii "-01\0"
	.text
	.globl	convertirFechaResAper
	.def	convertirFechaResAper;	.scl	2;	.type	32;	.endef
	.seh_proc	convertirFechaResAper
convertirFechaResAper:
.LFB19:
	.loc 1 86 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 87 5
	leaq	.LC24(%rip), %rdx
	movq	16(%rbp), %rcx
	call	stringCat
	.loc 1 88 12
	movq	16(%rbp), %rax
	.loc 1 89 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.seh_endproc
	.section .rdata,"dr"
.LC25:
	.ascii "04.1.1\0"
	.text
	.globl	filtrarAlquileres
	.def	filtrarAlquileres;	.scl	2;	.type	32;	.endef
	.seh_proc	filtrarAlquileres
filtrarAlquileres:
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
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 93 19
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 94 26
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 99 17
	movl	fechaIni.4764(%rip), %eax
	.loc 1 99 7
	testl	%eax, %eax
	jne	.L8
	.loc 1 100 33
	movq	-16(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %edx
	.loc 1 100 37
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 100 57
	movq	-16(%rbp), %rax
	movzbl	6(%rax), %eax
	movsbl	%al, %eax
	.loc 1 100 42
	addl	%edx, %eax
	.loc 1 100 61
	subl	$528, %eax
	.loc 1 100 18
	movl	%eax, fechaIni.4764(%rip)
	.loc 1 101 34
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 101 38
	imull	$100000, %eax, %edx
	.loc 1 101 62
	movq	-16(%rbp), %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %eax
	.loc 1 101 66
	imull	$10000, %eax, %eax
	.loc 1 101 47
	addl	%eax, %edx
	.loc 1 101 89
	movq	-16(%rbp), %rax
	movzbl	2(%rax), %eax
	movsbl	%al, %eax
	.loc 1 101 93
	imull	$1000, %eax, %eax
	.loc 1 101 74
	addl	%eax, %edx
	.loc 1 101 115
	movq	-16(%rbp), %rax
	movzbl	3(%rax), %eax
	movsbl	%al, %eax
	.loc 1 101 119
	imull	$100, %eax, %eax
	.loc 1 101 100
	addl	%edx, %eax
	.loc 1 101 125
	leal	-5332800(%rax), %edx
	.loc 1 101 18
	movl	fechaIni.4764(%rip), %eax
	addl	%edx, %eax
	movl	%eax, fechaIni.4764(%rip)
.L8:
	.loc 1 104 29
	movq	-8(%rbp), %rax
	movzbl	121(%rax), %eax
	movsbl	%al, %edx
	.loc 1 104 33
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	.loc 1 104 53
	movq	-8(%rbp), %rax
	movzbl	122(%rax), %eax
	movsbl	%al, %eax
	.loc 1 104 38
	addl	%edx, %eax
	.loc 1 104 14
	subl	$528, %eax
	movl	%eax, -20(%rbp)
	.loc 1 105 30
	movq	-8(%rbp), %rax
	movzbl	116(%rax), %eax
	movsbl	%al, %eax
	.loc 1 105 34
	imull	$100000, %eax, %edx
	.loc 1 105 58
	movq	-8(%rbp), %rax
	movzbl	117(%rax), %eax
	movsbl	%al, %eax
	.loc 1 105 62
	imull	$10000, %eax, %eax
	.loc 1 105 43
	addl	%eax, %edx
	.loc 1 105 85
	movq	-8(%rbp), %rax
	movzbl	118(%rax), %eax
	movsbl	%al, %eax
	.loc 1 105 89
	imull	$1000, %eax, %eax
	.loc 1 105 70
	addl	%eax, %edx
	.loc 1 105 111
	movq	-8(%rbp), %rax
	movzbl	119(%rax), %eax
	movsbl	%al, %eax
	.loc 1 105 115
	imull	$100, %eax, %eax
	.loc 1 105 96
	addl	%edx, %eax
	.loc 1 105 121
	subl	$5332800, %eax
	.loc 1 105 14
	addl	%eax, -20(%rbp)
	.loc 1 107 23
	movq	-8(%rbp), %rax
	.loc 1 107 9
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 107 7
	testl	%eax, %eax
	jne	.L9
	.loc 1 107 72 discriminator 1
	movq	-8(%rbp), %rax
	leaq	200(%rax), %rdx
	.loc 1 107 58 discriminator 1
	movq	-16(%rbp), %rax
	addq	$48, %rax
	.loc 1 107 44 discriminator 1
	movq	%rax, %rcx
	call	stringCmp
	.loc 1 107 40 discriminator 1
	testl	%eax, %eax
	jne	.L9
	.loc 1 107 95 discriminator 2
	movl	fechaIni.4764(%rip), %eax
	.loc 1 107 82 discriminator 2
	cmpl	%eax, -20(%rbp)
	jl	.L9
	.loc 1 108 16
	movl	$1, %eax
	jmp	.L10
.L9:
	.loc 1 111 12
	movl	$0, %eax
.L10:
	.loc 1 112 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "%0.2lf\0"
	.text
	.globl	mapearAlquileres
	.def	mapearAlquileres;	.scl	2;	.type	32;	.endef
	.seh_proc	mapearAlquileres
mapearAlquileres:
.LFB21:
	.loc 1 115 1
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
	movaps	%xmm6, -32(%rbp)
	.seh_savexmm	%xmm6, 64
	movaps	%xmm7, -16(%rbp)
	.seh_savexmm	%xmm7, 80
	.cfi_offset 23, -48
	.cfi_offset 24, -32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	.loc 1 116 19
	movq	16(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 117 20
	movq	24(%rbp), %rax
	movq	%rax, -48(%rbp)
	.loc 1 118 26
	movq	32(%rbp), %rax
	movq	%rax, -56(%rbp)
	.loc 1 120 36
	movq	-40(%rbp), %rax
	leaq	116(%rax), %rdx
	.loc 1 120 21
	movq	-48(%rbp), %rax
	.loc 1 120 5
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 121 38
	movq	-40(%rbp), %rax
	leaq	146(%rax), %rdx
	.loc 1 121 21
	movq	-48(%rbp), %rax
	addq	$30, %rax
	.loc 1 121 5
	movl	$18, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 123 53
	movq	-40(%rbp), %rax
	addq	$146, %rax
	.loc 1 123 44
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm6
	.loc 1 123 77
	movq	-56(%rbp), %rax
	addq	$63, %rax
	.loc 1 123 68
	movq	%rax, %rcx
	call	atof
	.loc 1 123 66
	divsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	.loc 1 123 90
	movsd	.LC26(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	.loc 1 123 5
	movsd	.LC27(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 123 17
	movq	-48(%rbp), %rax
	addq	$48, %rax
	.loc 1 123 5
	movq	%xmm0, %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	movq	%r8, %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm2
	movq	%xmm0, %r8
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 124 53
	movq	-56(%rbp), %rax
	addq	$30, %rax
	.loc 1 124 44
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm7
	.loc 1 124 74
	movq	-40(%rbp), %rax
	addq	$146, %rax
	.loc 1 124 65
	movq	%rax, %rcx
	call	atof
	movapd	%xmm0, %xmm6
	.loc 1 124 98
	movq	-56(%rbp), %rax
	addq	$63, %rax
	.loc 1 124 89
	movq	%rax, %rcx
	call	atof
	.loc 1 124 87
	divsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
	.loc 1 124 5
	mulsd	%xmm7, %xmm0
	.loc 1 124 17
	movq	-48(%rbp), %rax
	addq	$66, %rax
	.loc 1 124 5
	movq	%xmm0, %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	movq	%r8, %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm2
	movq	%xmm0, %r8
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 126 12
	movq	-48(%rbp), %rax
	.loc 1 127 1
	movaps	-32(%rbp), %xmm6
	movaps	-16(%rbp), %xmm7
	addq	$96, %rsp
	.cfi_restore 24
	.cfi_restore 23
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC29:
	.ascii "\33[1m\33[1;36m%-*s\11\33[0;37m | \33[1;36m%-*s\11\33[0;37m | \33[1;36m%-*s\11\33[0;37m | \33[1;36m%-*s\12\33[0m\0"
	.text
	.globl	mostrarAlquileres
	.def	mostrarAlquileres;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarAlquileres
mostrarAlquileres:
.LFB22:
	.loc 1 130 1
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
	.loc 1 131 20
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 133 246
	movq	-8(%rbp), %rax
	leaq	66(%rax), %rcx
	.loc 1 133 223
	movq	-8(%rbp), %rax
	leaq	48(%rax), %rdx
	.loc 1 133 203
	movq	-8(%rbp), %rax
	addq	$30, %rax
	.loc 1 133 185
	movq	-8(%rbp), %r8
	.loc 1 133 5
	movq	%rcx, 64(%rsp)
	movl	$18, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movl	$18, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	$18, %r9d
	movl	$30, %edx
	leaq	.LC29(%rip), %rcx
	call	printf
	.loc 1 134 1
	nop
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.seh_endproc
.lcomm fechaIni.4764,4,4
	.section .rdata,"dr"
	.align 8
.LC20:
	.long	0
	.long	1097011920
	.align 8
.LC26:
	.long	0
	.long	1072693248
	.align 8
.LC27:
	.long	0
	.long	1079574528
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
	.long	0xe62
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C89 8.1.0 -mtune=core2 -march=nocona -g -std=c90\0"
	.byte	0x1
	.ascii "C:\\Users\\LENOVO\\OneDrive\\Escritorio\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\\herramientasAperturas.c\0"
	.ascii "C:\\\\Users\\\\LENOVO\\\\OneDrive\\\\Escritorio\\\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x23
	.byte	0x2a
	.long	0x142
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
	.long	0x17d
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x4
	.long	0x17d
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
	.long	0x1c3
	.uleb128 0x6
	.byte	0x8
	.long	0x1c9
	.uleb128 0x7
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x2
	.word	0x1bc
	.byte	0x10
	.long	0x373
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1bd
	.byte	0x7
	.long	0x198
	.byte	0
	.uleb128 0x9
	.ascii "lc_codepage\0"
	.byte	0x2
	.word	0x1be
	.byte	0x10
	.long	0x4c0
	.byte	0x4
	.uleb128 0x9
	.ascii "lc_collate_cp\0"
	.byte	0x2
	.word	0x1bf
	.byte	0x10
	.long	0x4c0
	.byte	0x8
	.uleb128 0x9
	.ascii "lc_handle\0"
	.byte	0x2
	.word	0x1c0
	.byte	0x11
	.long	0x4d0
	.byte	0xc
	.uleb128 0x9
	.ascii "lc_id\0"
	.byte	0x2
	.word	0x1c1
	.byte	0x9
	.long	0x4f5
	.byte	0x24
	.uleb128 0x9
	.ascii "lc_category\0"
	.byte	0x2
	.word	0x1c7
	.byte	0x5
	.long	0x505
	.byte	0x48
	.uleb128 0xa
	.ascii "lc_clike\0"
	.byte	0x2
	.word	0x1c8
	.byte	0x7
	.long	0x198
	.word	0x108
	.uleb128 0xa
	.ascii "mb_cur_max\0"
	.byte	0x2
	.word	0x1c9
	.byte	0x7
	.long	0x198
	.word	0x10c
	.uleb128 0xa
	.ascii "lconv_intl_refcount\0"
	.byte	0x2
	.word	0x1ca
	.byte	0x8
	.long	0x4ba
	.word	0x110
	.uleb128 0xa
	.ascii "lconv_num_refcount\0"
	.byte	0x2
	.word	0x1cb
	.byte	0x8
	.long	0x4ba
	.word	0x118
	.uleb128 0xa
	.ascii "lconv_mon_refcount\0"
	.byte	0x2
	.word	0x1cc
	.byte	0x8
	.long	0x4ba
	.word	0x120
	.uleb128 0xa
	.ascii "lconv\0"
	.byte	0x2
	.word	0x1cd
	.byte	0x11
	.long	0x51c
	.word	0x128
	.uleb128 0xa
	.ascii "ctype1_refcount\0"
	.byte	0x2
	.word	0x1ce
	.byte	0x8
	.long	0x4ba
	.word	0x130
	.uleb128 0xa
	.ascii "ctype1\0"
	.byte	0x2
	.word	0x1cf
	.byte	0x13
	.long	0x522
	.word	0x138
	.uleb128 0xa
	.ascii "pctype\0"
	.byte	0x2
	.word	0x1d0
	.byte	0x19
	.long	0x528
	.word	0x140
	.uleb128 0xa
	.ascii "pclmap\0"
	.byte	0x2
	.word	0x1d1
	.byte	0x18
	.long	0x52e
	.word	0x148
	.uleb128 0xa
	.ascii "pcumap\0"
	.byte	0x2
	.word	0x1d2
	.byte	0x18
	.long	0x52e
	.word	0x150
	.uleb128 0xa
	.ascii "lc_time_curr\0"
	.byte	0x2
	.word	0x1d3
	.byte	0x1a
	.long	0x55a
	.word	0x158
	.byte	0
	.uleb128 0x5
	.ascii "pthreadmbcinfo\0"
	.byte	0x2
	.word	0x1a9
	.byte	0x25
	.long	0x38b
	.uleb128 0x6
	.byte	0x8
	.long	0x391
	.uleb128 0xb
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xc
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x2
	.word	0x1ac
	.byte	0x10
	.long	0x3e7
	.uleb128 0x9
	.ascii "locinfo\0"
	.byte	0x2
	.word	0x1ad
	.byte	0x12
	.long	0x1ab
	.byte	0
	.uleb128 0x9
	.ascii "mbcinfo\0"
	.byte	0x2
	.word	0x1ae
	.byte	0x12
	.long	0x373
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.ascii "_locale_tstruct\0"
	.byte	0x2
	.word	0x1af
	.byte	0x3
	.long	0x3a6
	.uleb128 0xc
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x2
	.word	0x1b3
	.byte	0x10
	.long	0x44f
	.uleb128 0x9
	.ascii "wLanguage\0"
	.byte	0x2
	.word	0x1b4
	.byte	0x12
	.long	0x17d
	.byte	0
	.uleb128 0x9
	.ascii "wCountry\0"
	.byte	0x2
	.word	0x1b5
	.byte	0x12
	.long	0x17d
	.byte	0x2
	.uleb128 0x9
	.ascii "wCodePage\0"
	.byte	0x2
	.word	0x1b6
	.byte	0x12
	.long	0x17d
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "LC_ID\0"
	.byte	0x2
	.word	0x1b7
	.byte	0x3
	.long	0x400
	.uleb128 0xd
	.byte	0x20
	.byte	0x2
	.word	0x1c2
	.byte	0x3
	.long	0x4ae
	.uleb128 0x9
	.ascii "locale\0"
	.byte	0x2
	.word	0x1c3
	.byte	0xb
	.long	0x4ae
	.byte	0
	.uleb128 0x9
	.ascii "wlocale\0"
	.byte	0x2
	.word	0x1c4
	.byte	0xe
	.long	0x4b4
	.byte	0x8
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1c5
	.byte	0xa
	.long	0x4ba
	.byte	0x10
	.uleb128 0x9
	.ascii "wrefcount\0"
	.byte	0x2
	.word	0x1c6
	.byte	0xa
	.long	0x4ba
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12b
	.uleb128 0x6
	.byte	0x8
	.long	0x16d
	.uleb128 0x6
	.byte	0x8
	.long	0x198
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xe
	.long	0x4e0
	.long	0x4e0
	.uleb128 0xf
	.long	0x142
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xe
	.long	0x44f
	.long	0x505
	.uleb128 0xf
	.long	0x142
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.long	0x45e
	.long	0x515
	.uleb128 0xf
	.long	0x142
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.ascii "lconv\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x515
	.uleb128 0x6
	.byte	0x8
	.long	0x17d
	.uleb128 0x6
	.byte	0x8
	.long	0x193
	.uleb128 0x6
	.byte	0x8
	.long	0x545
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.long	0x534
	.uleb128 0xb
	.ascii "__lc_time_data\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x54a
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
	.long	0x4ba
	.uleb128 0xe
	.long	0x4ae
	.long	0x5ad
	.uleb128 0xf
	.long	0x142
	.byte	0
	.byte	0
	.uleb128 0x10
	.ascii "_sys_errlist\0"
	.byte	0x3
	.byte	0xac
	.byte	0x2b
	.long	0x59d
	.uleb128 0x10
	.ascii "_sys_nerr\0"
	.byte	0x3
	.byte	0xad
	.byte	0x29
	.long	0x198
	.uleb128 0x11
	.ascii "__imp___argc\0"
	.byte	0x3
	.word	0x119
	.byte	0x10
	.long	0x4ba
	.uleb128 0x11
	.ascii "__imp___argv\0"
	.byte	0x3
	.word	0x11d
	.byte	0x13
	.long	0x600
	.uleb128 0x6
	.byte	0x8
	.long	0x606
	.uleb128 0x6
	.byte	0x8
	.long	0x4ae
	.uleb128 0x11
	.ascii "__imp___wargv\0"
	.byte	0x3
	.word	0x121
	.byte	0x16
	.long	0x623
	.uleb128 0x6
	.byte	0x8
	.long	0x629
	.uleb128 0x6
	.byte	0x8
	.long	0x4b4
	.uleb128 0x11
	.ascii "__imp__environ\0"
	.byte	0x3
	.word	0x127
	.byte	0x13
	.long	0x600
	.uleb128 0x11
	.ascii "__imp__wenviron\0"
	.byte	0x3
	.word	0x12c
	.byte	0x16
	.long	0x623
	.uleb128 0x11
	.ascii "__imp__pgmptr\0"
	.byte	0x3
	.word	0x132
	.byte	0x12
	.long	0x606
	.uleb128 0x11
	.ascii "__imp__wpgmptr\0"
	.byte	0x3
	.word	0x137
	.byte	0x15
	.long	0x629
	.uleb128 0x11
	.ascii "__imp__osplatform\0"
	.byte	0x3
	.word	0x13c
	.byte	0x19
	.long	0x6aa
	.uleb128 0x6
	.byte	0x8
	.long	0x4c0
	.uleb128 0x11
	.ascii "__imp__osver\0"
	.byte	0x3
	.word	0x141
	.byte	0x19
	.long	0x6aa
	.uleb128 0x11
	.ascii "__imp__winver\0"
	.byte	0x3
	.word	0x146
	.byte	0x19
	.long	0x6aa
	.uleb128 0x11
	.ascii "__imp__winmajor\0"
	.byte	0x3
	.word	0x14b
	.byte	0x19
	.long	0x6aa
	.uleb128 0x11
	.ascii "__imp__winminor\0"
	.byte	0x3
	.word	0x150
	.byte	0x19
	.long	0x6aa
	.uleb128 0x10
	.ascii "_amblksiz\0"
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.long	0x4c0
	.uleb128 0x10
	.ascii "__imp__pctype\0"
	.byte	0x5
	.byte	0x2b
	.byte	0x1c
	.long	0x737
	.uleb128 0x6
	.byte	0x8
	.long	0x522
	.uleb128 0x10
	.ascii "__imp__wctype\0"
	.byte	0x5
	.byte	0x3b
	.byte	0x1c
	.long	0x737
	.uleb128 0x10
	.ascii "__imp__pwctype\0"
	.byte	0x5
	.byte	0x47
	.byte	0x1c
	.long	0x737
	.uleb128 0xe
	.long	0x545
	.long	0x775
	.uleb128 0x12
	.byte	0
	.uleb128 0x4
	.long	0x76a
	.uleb128 0x10
	.ascii "__newclmap\0"
	.byte	0x5
	.byte	0x50
	.byte	0x1e
	.long	0x775
	.uleb128 0x10
	.ascii "__newcumap\0"
	.byte	0x5
	.byte	0x51
	.byte	0x1e
	.long	0x775
	.uleb128 0x10
	.ascii "__ptlocinfo\0"
	.byte	0x5
	.byte	0x52
	.byte	0x19
	.long	0x1ab
	.uleb128 0x10
	.ascii "__ptmbcinfo\0"
	.byte	0x5
	.byte	0x53
	.byte	0x19
	.long	0x373
	.uleb128 0x10
	.ascii "__globallocalestatus\0"
	.byte	0x5
	.byte	0x54
	.byte	0xe
	.long	0x198
	.uleb128 0x10
	.ascii "__locale_changed\0"
	.byte	0x5
	.byte	0x55
	.byte	0xe
	.long	0x198
	.uleb128 0x10
	.ascii "__initiallocinfo\0"
	.byte	0x5
	.byte	0x56
	.byte	0x28
	.long	0x1c9
	.uleb128 0x10
	.ascii "__initiallocalestructinfo\0"
	.byte	0x5
	.byte	0x57
	.byte	0x1a
	.long	0x3e7
	.uleb128 0x13
	.byte	0x20
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.long	0x887
	.uleb128 0x14
	.ascii "data\0"
	.byte	0x6
	.byte	0x17
	.byte	0xb
	.long	0x887
	.byte	0
	.uleb128 0x14
	.ascii "cantElem\0"
	.byte	0x6
	.byte	0x18
	.byte	0xc
	.long	0x133
	.byte	0x8
	.uleb128 0x14
	.ascii "tamElem\0"
	.byte	0x6
	.byte	0x19
	.byte	0xc
	.long	0x133
	.byte	0x10
	.uleb128 0x14
	.ascii "capacidad\0"
	.byte	0x6
	.byte	0x1a
	.byte	0xc
	.long	0x133
	.byte	0x18
	.byte	0
	.uleb128 0x15
	.byte	0x8
	.uleb128 0x3
	.ascii "Vector_t\0"
	.byte	0x6
	.byte	0x1b
	.byte	0x2
	.long	0x839
	.uleb128 0x6
	.byte	0x8
	.long	0x889
	.uleb128 0xe
	.long	0x12b
	.long	0x8b0
	.uleb128 0xf
	.long	0x142
	.byte	0xe
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0x8c0
	.uleb128 0xf
	.long	0x142
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0x8d0
	.uleb128 0xf
	.long	0x142
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0x8e0
	.uleb128 0xf
	.long	0x142
	.byte	0x11
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0x8f0
	.uleb128 0xf
	.long	0x142
	.byte	0x1d
	.byte	0
	.uleb128 0x13
	.byte	0xd7
	.byte	0x7
	.byte	0x5f
	.byte	0x9
	.long	0x975
	.uleb128 0x14
	.ascii "cod\0"
	.byte	0x7
	.byte	0x60
	.byte	0xa
	.long	0x8a0
	.byte	0
	.uleb128 0x14
	.ascii "desc\0"
	.byte	0x7
	.byte	0x61
	.byte	0xa
	.long	0x8b0
	.byte	0xf
	.uleb128 0x14
	.ascii "clasif\0"
	.byte	0x7
	.byte	0x62
	.byte	0xa
	.long	0x8c0
	.byte	0x4c
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x63
	.byte	0xa
	.long	0x8e0
	.byte	0x74
	.uleb128 0x16
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x64
	.byte	0xa
	.long	0x8d0
	.byte	0x92
	.uleb128 0x14
	.ascii "varMensIPC\0"
	.byte	0x7
	.byte	0x65
	.byte	0xa
	.long	0x8d0
	.byte	0xa4
	.uleb128 0x14
	.ascii "varAnualIPC\0"
	.byte	0x7
	.byte	0x66
	.byte	0xa
	.long	0x8d0
	.byte	0xb6
	.uleb128 0x16
	.secrel32	.LASF3
	.byte	0x7
	.byte	0x67
	.byte	0xa
	.long	0x8a0
	.byte	0xc8
	.byte	0
	.uleb128 0x3
	.ascii "IPCAperturas\0"
	.byte	0x7
	.byte	0x68
	.byte	0x2
	.long	0x8f0
	.uleb128 0x13
	.byte	0x51
	.byte	0x7
	.byte	0x6a
	.byte	0x9
	.long	0x9d0
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x6b
	.byte	0xa
	.long	0x8e0
	.byte	0
	.uleb128 0x14
	.ascii "monto\0"
	.byte	0x7
	.byte	0x6c
	.byte	0xa
	.long	0x8d0
	.byte	0x1e
	.uleb128 0x16
	.secrel32	.LASF3
	.byte	0x7
	.byte	0x6d
	.byte	0xa
	.long	0x8a0
	.byte	0x30
	.uleb128 0x14
	.ascii "acumulado\0"
	.byte	0x7
	.byte	0x6e
	.byte	0xa
	.long	0x8d0
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.ascii "RespuestaAlquileres\0"
	.byte	0x7
	.byte	0x6f
	.byte	0x2
	.long	0x98a
	.uleb128 0x13
	.byte	0x54
	.byte	0x7
	.byte	0x71
	.byte	0x9
	.long	0xa3d
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x72
	.byte	0xa
	.long	0x8e0
	.byte	0
	.uleb128 0x16
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x73
	.byte	0xa
	.long	0x8d0
	.byte	0x1e
	.uleb128 0x14
	.ascii "acumuladoIPC\0"
	.byte	0x7
	.byte	0x74
	.byte	0xa
	.long	0x8d0
	.byte	0x30
	.uleb128 0x14
	.ascii "montoAjustado\0"
	.byte	0x7
	.byte	0x75
	.byte	0xa
	.long	0x8d0
	.byte	0x42
	.byte	0
	.uleb128 0x3
	.ascii "IPCAlquileres\0"
	.byte	0x7
	.byte	0x76
	.byte	0x2
	.long	0x9ec
	.uleb128 0x13
	.byte	0xd0
	.byte	0x8
	.byte	0x1c
	.byte	0x9
	.long	0xab0
	.uleb128 0x14
	.ascii "etiqueta\0"
	.byte	0x8
	.byte	0x1d
	.byte	0xa
	.long	0xab0
	.byte	0
	.uleb128 0x14
	.ascii "respuesta\0"
	.byte	0x8
	.byte	0x1e
	.byte	0xa
	.long	0xac0
	.byte	0x40
	.uleb128 0x14
	.ascii "validado\0"
	.byte	0x8
	.byte	0x1f
	.byte	0x9
	.long	0x198
	.byte	0xc0
	.uleb128 0x14
	.ascii "tipo\0"
	.byte	0x8
	.byte	0x20
	.byte	0x9
	.long	0x198
	.byte	0xc4
	.uleb128 0x14
	.ascii "info\0"
	.byte	0x8
	.byte	0x21
	.byte	0xb
	.long	0x887
	.byte	0xc8
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0xac0
	.uleb128 0xf
	.long	0x142
	.byte	0x3f
	.byte	0
	.uleb128 0xe
	.long	0x12b
	.long	0xad0
	.uleb128 0xf
	.long	0x142
	.byte	0x7f
	.byte	0
	.uleb128 0x3
	.ascii "Campo\0"
	.byte	0x8
	.byte	0x22
	.byte	0x2
	.long	0xa53
	.uleb128 0x17
	.word	0xdd0
	.byte	0x8
	.byte	0x25
	.byte	0x9
	.long	0xb3a
	.uleb128 0x14
	.ascii "titulo\0"
	.byte	0x8
	.byte	0x26
	.byte	0xa
	.long	0xab0
	.byte	0
	.uleb128 0x14
	.ascii "campos\0"
	.byte	0x8
	.byte	0x27
	.byte	0xb
	.long	0xb3a
	.byte	0x40
	.uleb128 0x18
	.ascii "ce\0"
	.byte	0x8
	.byte	0x28
	.byte	0x9
	.long	0x198
	.word	0xd40
	.uleb128 0x18
	.ascii "Validaciones\0"
	.byte	0x8
	.byte	0x2a
	.byte	0xb
	.long	0xb4a
	.word	0xd48
	.uleb128 0x18
	.ascii "cv\0"
	.byte	0x8
	.byte	0x2b
	.byte	0x9
	.long	0x198
	.word	0xdc8
	.byte	0
	.uleb128 0xe
	.long	0xad0
	.long	0xb4a
	.uleb128 0xf
	.long	0x142
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.long	0xb5a
	.long	0xb5a
	.uleb128 0xf
	.long	0x142
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb60
	.uleb128 0x19
	.long	0x198
	.long	0xb6f
	.uleb128 0x1a
	.long	0x887
	.byte	0
	.uleb128 0x3
	.ascii "Formulario_t\0"
	.byte	0x8
	.byte	0x2c
	.byte	0x2
	.long	0xade
	.uleb128 0x1b
	.ascii "mostrarAlquileres\0"
	.byte	0x1
	.byte	0x81
	.byte	0x6
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xbd0
	.uleb128 0x1c
	.ascii "elem\0"
	.byte	0x1
	.byte	0x81
	.byte	0x1e
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x83
	.byte	0x14
	.long	0xbd0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa3d
	.uleb128 0x1e
	.ascii "mapearAlquileres\0"
	.byte	0x1
	.byte	0x72
	.byte	0x7
	.long	0x887
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xc65
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0x72
	.byte	0x1e
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "tmp\0"
	.byte	0x1
	.byte	0x72
	.byte	0x2a
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.secrel32	.LASF4
	.byte	0x1
	.byte	0x72
	.byte	0x35
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.ascii "tmpD\0"
	.byte	0x1
	.byte	0x74
	.byte	0x13
	.long	0xc65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.ascii "tmpT\0"
	.byte	0x1
	.byte	0x75
	.byte	0x14
	.long	0xbd0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.ascii "tmpC\0"
	.byte	0x1
	.byte	0x76
	.byte	0x1a
	.long	0xc6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x975
	.uleb128 0x6
	.byte	0x8
	.long	0x9d0
	.uleb128 0x1e
	.ascii "filtrarAlquileres\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.long	0x198
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xd10
	.uleb128 0x1c
	.ascii "dato\0"
	.byte	0x1
	.byte	0x5b
	.byte	0x1d
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.secrel32	.LASF4
	.byte	0x1
	.byte	0x5b
	.byte	0x29
	.long	0x887
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.ascii "tmpD\0"
	.byte	0x1
	.byte	0x5d
	.byte	0x13
	.long	0xc65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "tmpC\0"
	.byte	0x1
	.byte	0x5e
	.byte	0x1a
	.long	0xc6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "fechaAct\0"
	.byte	0x1
	.byte	0x60
	.byte	0x9
	.long	0x198
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.ascii "fechaIni\0"
	.byte	0x1
	.byte	0x61
	.byte	0x10
	.long	0x198
	.uleb128 0x9
	.byte	0x3
	.quad	fechaIni.4764
	.byte	0
	.uleb128 0x1e
	.ascii "convertirFechaResAper\0"
	.byte	0x1
	.byte	0x55
	.byte	0x7
	.long	0x4ae
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xd54
	.uleb128 0x1c
	.ascii "ans\0"
	.byte	0x1
	.byte	0x55
	.byte	0x23
	.long	0x4ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.ascii "preguntarAlquileres\0"
	.byte	0x1
	.byte	0x3d
	.byte	0x15
	.long	0x9d0
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xdba
	.uleb128 0x1d
	.ascii "ans\0"
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.long	0x9d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.byte	0x41
	.byte	0x12
	.long	0xb6f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3664
	.uleb128 0x1d
	.ascii "regiones\0"
	.byte	0x1
	.byte	0x42
	.byte	0xb
	.long	0xdba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3792
	.byte	0
	.uleb128 0xe
	.long	0x4ae
	.long	0xdca
	.uleb128 0xf
	.long	0x142
	.byte	0xe
	.byte	0
	.uleb128 0x20
	.ascii "herramientaCalcularAlquilerIPCAperturas\0"
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.long	0x198
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.ascii "aper\0"
	.byte	0x1
	.byte	0xb
	.byte	0x37
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "alquileres\0"
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xe
	.byte	0x19
	.long	0x9d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x21
	.secrel32	.LASF3
	.byte	0x1
	.byte	0xf
	.byte	0xa
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -143
	.uleb128 0x1d
	.ascii "tmpAlq\0"
	.byte	0x1
	.byte	0x1c
	.byte	0x14
	.long	0xbd0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x34
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
.LASF4:
	.ascii "contexto\0"
.LASF2:
	.ascii "indiceIPC\0"
.LASF0:
	.ascii "refcount\0"
.LASF3:
	.ascii "region\0"
.LASF1:
	.ascii "periodo\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	filtrarVector;	.scl	2;	.type	32;	.endef
	.def	stringNCopy;	.scl	2;	.type	32;	.endef
	.def	vectorObtener;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	mapearVector;	.scl	2;	.type	32;	.endef
	.def	vectorCantElem;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	esperarInput;	.scl	2;	.type	32;	.endef
	.def	mostrarVector;	.scl	2;	.type	32;	.endef
	.def	vectorEscribirABinario;	.scl	2;	.type	32;	.endef
	.def	vectorLeerDeBinario;	.scl	2;	.type	32;	.endef
	.def	vectorDestruir;	.scl	2;	.type	32;	.endef
	.def	formularioInit;	.scl	2;	.type	32;	.endef
	.def	formularioAgregarCampoVA;	.scl	2;	.type	32;	.endef
	.def	formularioPublicar;	.scl	2;	.type	32;	.endef
	.def	formularioRespuesta;	.scl	2;	.type	32;	.endef
	.def	formularioDestruir;	.scl	2;	.type	32;	.endef
	.def	stringCat;	.scl	2;	.type	32;	.endef
	.def	stringCmp;	.scl	2;	.type	32;	.endef
	.def	atof;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.validarFechaForm, "dr"
	.globl	.refptr.validarFechaForm
	.linkonce	discard
.refptr.validarFechaForm:
	.quad	validarFechaForm
