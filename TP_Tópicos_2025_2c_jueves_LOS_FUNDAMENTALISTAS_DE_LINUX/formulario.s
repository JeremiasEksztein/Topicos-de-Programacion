	.file	"formulario.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\33[1m\33[1;31mRespuesta fuera del rango valido [%lf : %lf]\33[0m\12\0"
	.align 8
.LC1:
	.ascii "\33[1m\33[1;31mRespuesta demasiado larga, maxlen: %d\33[0m\12\0"
	.align 8
.LC2:
	.ascii "\33[1m\33[1;31mOpcion incorrecta, elija de nuevo\33[0m\0"
	.text
	.globl	campoValidar
	.def	campoValidar;	.scl	2;	.type	32;	.endef
	.seh_proc	campoValidar
campoValidar:
.LFB17:
	.file 1 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/formulario.c"
	.loc 1 45 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 46 13
	movq	16(%rbp), %rax
	movl	196(%rax), %eax
	cmpl	$1, %eax
	je	.L2
	cmpl	$2, %eax
	je	.L3
	testl	%eax, %eax
	jne	.L4
.LBB2:
	.loc 1 48 23
	movq	16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 51 30
	movq	16(%rbp), %rax
	addq	$64, %rax
	.loc 1 51 24
	movq	%rax, %rcx
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	.loc 1 51 49
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	.loc 1 51 15
	comisd	-16(%rbp), %xmm0
	ja	.L5
	.loc 1 51 68 discriminator 1
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm1
	.loc 1 51 55 discriminator 1
	movsd	-16(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L5
	.loc 1 57 13 discriminator 1
	jmp	.L4
.L5:
	.loc 1 52 17
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	%xmm1, %rax
	movq	%rax, %rdx
	movq	%rdx, %rcx
	movq	%rax, %xmm1
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rcx, %xmm2
	movq	%xmm1, %r8
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	.loc 1 53 17
	call	esperarInput
	.loc 1 54 24
	movl	$0, %eax
	jmp	.L8
.L2:
	.loc 1 59 23
	movq	16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 61 30
	movq	16(%rbp), %rax
	addq	$64, %rax
	.loc 1 61 16
	movq	%rax, %rcx
	call	stringLenght
	movl	%eax, %edx
	.loc 1 61 48
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 61 15
	cmpl	%eax, %edx
	jle	.L9
	.loc 1 62 17
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	.loc 1 63 17
	call	esperarInput
	.loc 1 64 24
	movl	$0, %eax
	jmp	.L8
.L9:
	.loc 1 67 19
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 67 15
	testq	%rax, %rax
	je	.L12
	.loc 1 67 36 discriminator 1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 67 47 discriminator 1
	movq	16(%rbp), %rdx
	addq	$64, %rdx
	.loc 1 67 33 discriminator 1
	movq	%rdx, %rcx
	call	*%rax
.LVL0:
	.loc 1 67 29 discriminator 1
	testl	%eax, %eax
	jne	.L12
	.loc 1 68 17
	call	esperarInput
	.loc 1 69 24
	movl	$0, %eax
	jmp	.L8
.L3:
	.loc 1 74 28
	movq	16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 77 30
	movq	16(%rbp), %rax
	addq	$64, %rax
	.loc 1 77 24
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -36(%rbp)
	.loc 1 77 15
	cmpl	$0, -36(%rbp)
	jle	.L11
	.loc 1 77 62 discriminator 1
	movq	-32(%rbp), %rax
	movl	1024(%rax), %eax
	.loc 1 77 49 discriminator 1
	cmpl	%eax, -36(%rbp)
	jle	.L4
.L11:
	.loc 1 78 17
	leaq	.LC2(%rip), %rcx
	call	puts
	.loc 1 79 17
	call	esperarInput
	.loc 1 80 24
	movl	$0, %eax
	jmp	.L8
.L12:
	.loc 1 72 13
	nop
.L4:
.LBE2:
	.loc 1 84 12
	movl	$1, %eax
.L8:
	.loc 1 85 1
	addq	$80, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
	.globl	formularioValidar
	.def	formularioValidar;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioValidar
formularioValidar:
.LFB18:
	.loc 1 88 1
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
	.loc 1 91 11
	movl	$0, -4(%rbp)
	.loc 1 91 5
	jmp	.L14
.L17:
	.loc 1 92 30
	movq	16(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$424, %rdx
	movq	8(%rax,%rdx,8), %rax
	movq	16(%rbp), %rcx
	call	*%rax
.LVL1:
	.loc 1 92 11
	testl	%eax, %eax
	jne	.L15
	.loc 1 93 20
	movl	$0, %eax
	jmp	.L16
.L15:
	.loc 1 91 28 discriminator 2
	addl	$1, -4(%rbp)
.L14:
	.loc 1 91 21 discriminator 1
	movq	16(%rbp), %rax
	movl	3528(%rax), %eax
	.loc 1 91 5 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L17
	.loc 1 97 12
	movl	$1, %eax
.L16:
	.loc 1 98 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.seh_endproc
	.globl	formularioInit
	.def	formularioInit;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioInit
formularioInit:
.LFB19:
	.loc 1 101 1
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
	movq	%rdx, 24(%rbp)
	.loc 1 102 7
	cmpq	$0, 16(%rbp)
	je	.L19
	.loc 1 102 11 discriminator 1
	cmpq	$0, 24(%rbp)
	jne	.L20
.L19:
	.loc 1 103 16
	movl	$6, %eax
	jmp	.L21
.L20:
	.loc 1 106 18
	movq	16(%rbp), %rax
	.loc 1 106 5
	movq	24(%rbp), %rdx
	movl	$64, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 107 11
	movq	16(%rbp), %rax
	movl	$0, 3392(%rax)
	.loc 1 108 11
	movq	16(%rbp), %rax
	movl	$0, 3528(%rax)
	.loc 1 110 12
	movl	$0, %eax
.L21:
	.loc 1 111 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.seh_endproc
	.globl	formularioAgregarCampoVA
	.def	formularioAgregarCampoVA;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioAgregarCampoVA
formularioAgregarCampoVA:
.LFB20:
	.loc 1 114 1
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
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	.loc 1 115 7
	cmpq	$0, 16(%rbp)
	je	.L23
	.loc 1 115 11 discriminator 1
	cmpq	$0, 24(%rbp)
	je	.L23
	.loc 1 115 24 discriminator 2
	cmpl	$0, 40(%rbp)
	js	.L23
	.loc 1 115 36 discriminator 3
	cmpl	$2, 40(%rbp)
	jle	.L24
.L23:
	.loc 1 116 16
	movl	$6, %eax
	jmp	.L40
.L24:
	.loc 1 119 9
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 119 7
	cmpl	$16, %eax
	jne	.L26
	.loc 1 120 16
	movl	$2, %eax
	jmp	.L40
.L26:
	.loc 1 123 16
	movq	16(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 123 29
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	cltq
	.loc 1 123 26
	imulq	$208, %rax, %rax
	.loc 1 123 12
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 1 125 4
	leaq	48(%rbp), %rax
	movq	%rax, -56(%rbp)
	.loc 1 127 18
	movq	-16(%rbp), %rax
	.loc 1 127 5
	movq	24(%rbp), %rdx
	movl	$64, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 128 17
	movq	-16(%rbp), %rax
	movl	32(%rbp), %edx
	movl	%edx, 192(%rax)
	.loc 1 129 13
	movq	-16(%rbp), %rax
	movl	40(%rbp), %edx
	movl	%edx, 196(%rax)
	cmpl	$1, 40(%rbp)
	je	.L27
	cmpl	$2, 40(%rbp)
	je	.L28
	cmpl	$0, 40(%rbp)
	jne	.L29
.LBB3:
	.loc 1 133 23
	movl	$16, %ecx
	call	malloc
	movq	%rax, %rdx
	.loc 1 133 21
	movq	-16(%rbp), %rax
	movq	%rdx, 200(%rax)
	.loc 1 135 19
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	.loc 1 135 15
	testq	%rax, %rax
	jne	.L30
	.loc 1 136 24
	movl	$2, %eax
	jmp	.L40
.L30:
	.loc 1 139 23
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 141 23
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movsd	(%rax), %xmm0
	.loc 1 141 22
	movq	-24(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 142 23
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movsd	(%rax), %xmm0
	.loc 1 142 22
	movq	-24(%rbp), %rax
	movsd	%xmm0, 8(%rax)
	.loc 1 144 19
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	.loc 1 144 31
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm1
	.loc 1 144 15
	comisd	%xmm1, %xmm0
	jnb	.L41
	.loc 1 149 13
	jmp	.L33
.L41:
	.loc 1 145 17
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 1 146 24
	movl	$6, %eax
	jmp	.L40
.L27:
	.loc 1 151 23
	movl	$24, %ecx
	call	malloc
	movq	%rax, %rdx
	.loc 1 151 21
	movq	-16(%rbp), %rax
	movq	%rdx, 200(%rax)
	.loc 1 153 19
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	.loc 1 153 15
	testq	%rax, %rax
	jne	.L34
	.loc 1 154 24
	movl	$2, %eax
	jmp	.L40
.L34:
	.loc 1 157 23
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 159 23
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movl	(%rax), %edx
	.loc 1 159 22
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 160 27
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movq	(%rax), %rdx
	.loc 1 160 26
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 161 27
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movq	(%rax), %rdx
	.loc 1 161 26
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 163 19
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 163 15
	testl	%eax, %eax
	jns	.L42
	.loc 1 164 17
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 1 165 24
	movl	$6, %eax
	jmp	.L40
.L28:
	.loc 1 170 23
	movl	$1028, %ecx
	call	malloc
	movq	%rax, %rdx
	.loc 1 170 21
	movq	-16(%rbp), %rax
	movq	%rdx, 200(%rax)
	.loc 1 172 19
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	.loc 1 172 15
	testq	%rax, %rax
	jne	.L36
	.loc 1 173 24
	movl	$2, %eax
	jmp	.L40
.L36:
	.loc 1 176 28
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 1 179 32
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movl	(%rax), %edx
	.loc 1 179 31
	movq	-40(%rbp), %rax
	movl	%edx, 1024(%rax)
	.loc 1 180 20
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 1 182 19
	movl	$0, -4(%rbp)
	.loc 1 182 13
	jmp	.L37
.L38:
	.loc 1 183 50 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 183 17 discriminator 3
	movq	(%rax), %rdx
	.loc 1 183 42 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	.loc 1 183 17 discriminator 3
	movl	$64, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 182 48 discriminator 3
	addl	$1, -4(%rbp)
.L37:
	.loc 1 182 31 discriminator 1
	movq	-40(%rbp), %rax
	movl	1024(%rax), %eax
	.loc 1 182 13 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L38
	.loc 1 186 19
	movq	-40(%rbp), %rax
	movl	1024(%rax), %eax
	.loc 1 186 15
	testl	%eax, %eax
	jns	.L43
	.loc 1 187 17
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 1 188 24
	movl	$6, %eax
	jmp	.L40
.L29:
	.loc 1 193 20
	movl	$6, %eax
	jmp	.L40
.L42:
	.loc 1 168 13
	nop
	jmp	.L33
.L43:
	.loc 1 191 13
	nop
.L33:
.LBE3:
	.loc 1 197 6
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 197 10
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 3392(%rax)
	.loc 1 199 12
	movl	$0, %eax
.L40:
	.loc 1 200 1 discriminator 1
	addq	$96, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.seh_endproc
	.globl	formularioAgregarValidado
	.def	formularioAgregarValidado;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioAgregarValidado
formularioAgregarValidado:
.LFB21:
	.loc 1 203 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 204 7
	cmpq	$0, 16(%rbp)
	je	.L45
	.loc 1 204 11 discriminator 1
	cmpq	$0, 24(%rbp)
	jne	.L46
.L45:
	.loc 1 205 16
	movl	$6, %eax
	jmp	.L47
.L46:
	.loc 1 208 9
	movq	16(%rbp), %rax
	movl	3528(%rax), %eax
	.loc 1 208 7
	cmpl	$16, %eax
	jne	.L48
	.loc 1 209 16
	movl	$2, %eax
	jmp	.L47
.L48:
	.loc 1 212 24
	movq	16(%rbp), %rax
	movl	3528(%rax), %edx
	.loc 1 212 30
	movq	16(%rbp), %rax
	movslq	%edx, %rdx
	addq	$424, %rdx
	movq	24(%rbp), %rcx
	movq	%rcx, 8(%rax,%rdx,8)
	.loc 1 213 6
	movq	16(%rbp), %rax
	movl	3528(%rax), %eax
	.loc 1 213 10
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 3528(%rax)
	.loc 1 215 12
	movl	$0, %eax
.L47:
	.loc 1 216 1
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "\33[2J\33[H\0"
	.align 8
.LC4:
	.ascii "\33[1m---------\33[1;33m%s\33[0m\33[1m---------\12\33[0m\0"
.LC5:
	.ascii "\33[1m\33[1;36m%s: \33[0m\0"
.LC6:
	.ascii "\0"
.LC7:
	.ascii "\33[2m\33[0;37m%d - [%s]\33[0m\12\0"
.LC8:
	.ascii "Su seleccion: \0"
.LC9:
	.ascii "%0d - \33[1m\33[1;36m%s\33[0m\12\0"
	.align 8
.LC10:
	.ascii "\33[1m\33[0;37mEsta conforme?\11\33[1;32mY\33[0m/\33[1;31mN\33[0m\12\0"
	.text
	.globl	formularioPublicar
	.def	formularioPublicar;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioPublicar
formularioPublicar:
.LFB22:
	.loc 1 219 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 221 12
	movl	$0, -12(%rbp)
.L58:
	.loc 1 229 13
	call	esperarInput
	.loc 1 230 13
	call	flushStdin
	.loc 1 232 19
	movl	$0, -4(%rbp)
	.loc 1 232 13
	jmp	.L50
.L55:
	.loc 1 234 21
	leaq	.LC3(%rip), %rcx
	call	puts
	.loc 1 235 114
	movq	16(%rbp), %rax
	.loc 1 235 21
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 236 26
	movq	16(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 236 36
	movl	-4(%rbp), %eax
	cltq
	imulq	$208, %rax, %rax
	.loc 1 236 23
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 237 70
	movq	-24(%rbp), %rax
	.loc 1 237 21
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	.loc 1 239 25
	movq	-24(%rbp), %rax
	movl	196(%rax), %eax
	.loc 1 239 23
	cmpl	$2, %eax
	jne	.L51
.LBB4:
	.loc 1 240 44
	movq	-24(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 240 63
	leaq	.LC6(%rip), %rcx
	call	puts
	.loc 1 240 90
	movl	$0, -8(%rbp)
	.loc 1 240 82
	jmp	.L52
.L53:
	.loc 1 240 212 discriminator 3
	movl	-8(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 240 130 discriminator 3
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC7(%rip), %rcx
	call	printf
	.loc 1 240 125 discriminator 3
	addl	$1, -8(%rbp)
.L52:
	.loc 1 240 106 discriminator 1
	movq	-32(%rbp), %rax
	movl	1024(%rax), %eax
	.loc 1 240 82 discriminator 1
	cmpl	%eax, -8(%rbp)
	jl	.L53
.L51:
.LBE4:
	.loc 1 243 33
	movq	-24(%rbp), %rax
	addq	$64, %rax
	.loc 1 243 21
	movl	$128, %edx
	movq	%rax, %rcx
	call	scanString
	.loc 1 244 25
	movq	-24(%rbp), %rax
	movl	192(%rax), %eax
	.loc 1 244 17
	testl	%eax, %eax
	je	.L54
	.loc 1 244 40 discriminator 1
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	campoValidar
	.loc 1 244 36 discriminator 1
	testl	%eax, %eax
	je	.L55
.L54:
	.loc 1 246 21
	movq	-24(%rbp), %rax
	movl	196(%rax), %eax
	.loc 1 246 19
	cmpl	$2, %eax
	jne	.L56
.LBB5:
	.loc 1 247 40
	movq	-24(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 1 247 110
	movq	-24(%rbp), %rax
	addq	$64, %rax
	.loc 1 247 104
	movq	%rax, %rcx
	call	atoi
	.loc 1 247 124
	subl	$1, %eax
	.loc 1 247 102
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 247 74
	movq	-24(%rbp), %rax
	addq	$64, %rax
	.loc 1 247 59
	movl	$128, %r8d
	movq	%rax, %rcx
	call	stringNCopy
.L56:
.LBE5:
	.loc 1 232 36 discriminator 2
	addl	$1, -4(%rbp)
.L50:
	.loc 1 232 29 discriminator 1
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 232 13 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L55
	.loc 1 250 17
	movq	16(%rbp), %rax
	movl	3528(%rax), %eax
	.loc 1 250 9
	testl	%eax, %eax
	je	.L57
	.loc 1 250 26 discriminator 1
	movq	16(%rbp), %rcx
	call	formularioValidar
	.loc 1 250 22 discriminator 1
	testl	%eax, %eax
	je	.L58
.L57:
	.loc 1 252 9
	leaq	.LC3(%rip), %rcx
	call	puts
	.loc 1 253 102
	movq	16(%rbp), %rax
	.loc 1 253 9
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	.loc 1 255 9
	leaq	.LC8(%rip), %rcx
	call	puts
	.loc 1 256 15
	movl	$0, -4(%rbp)
	.loc 1 256 9
	jmp	.L59
.L60:
	.loc 1 257 18 discriminator 3
	movq	16(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 257 28 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	imulq	$208, %rax, %rax
	.loc 1 257 15 discriminator 3
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 258 82 discriminator 3
	movq	-24(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 258 13 discriminator 3
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	.loc 1 256 32 discriminator 3
	addl	$1, -4(%rbp)
.L59:
	.loc 1 256 25 discriminator 1
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 256 9 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L60
.L62:
	.loc 1 262 13 discriminator 2
	leaq	.LC10(%rip), %rcx
	call	puts
	.loc 1 263 24 discriminator 2
	call	getchar
	movl	%eax, %ecx
	call	toUpper
	movl	%eax, -12(%rbp)
	.loc 1 264 9 discriminator 2
	cmpl	$89, -12(%rbp)
	je	.L61
	.loc 1 264 32 discriminator 1
	cmpl	$78, -12(%rbp)
	jne	.L62
.L61:
	.loc 1 266 42
	cmpl	$89, -12(%rbp)
	sete	%al
	.loc 1 266 18
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	.loc 1 267 5
	cmpl	$0, -12(%rbp)
	je	.L58
	.loc 1 269 12
	movl	$0, %eax
	.loc 1 270 1
	addq	$80, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.seh_endproc
	.globl	formularioRespuesta
	.def	formularioRespuesta;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioRespuesta
formularioRespuesta:
.LFB23:
	.loc 1 273 1
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
	movl	%edx, 24(%rbp)
	.loc 1 274 7
	cmpq	$0, 16(%rbp)
	je	.L65
	.loc 1 274 11 discriminator 1
	cmpl	$0, 24(%rbp)
	js	.L65
	.loc 1 274 28 discriminator 2
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 274 20 discriminator 2
	cmpl	%eax, 24(%rbp)
	jle	.L66
.L65:
	.loc 1 275 15
	movl	$0, %eax
	jmp	.L67
.L66:
	.loc 1 278 16
	movq	16(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 278 26
	movl	24(%rbp), %eax
	cltq
	imulq	$208, %rax, %rax
	.loc 1 278 12
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 1 279 23
	movq	-16(%rbp), %rax
	movl	196(%rax), %eax
	.loc 1 279 46
	cmpl	$1, %eax
	jne	.L68
	.loc 1 279 46 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	jmp	.L69
.L68:
	.loc 1 279 46 discriminator 2
	movl	$0, %eax
.L69:
	.loc 1 279 15 is_stmt 1 discriminator 4
	movq	%rax, -24(%rbp)
	.loc 1 282 9 discriminator 4
	movq	-16(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -8(%rbp)
	.loc 1 284 7 discriminator 4
	cmpq	$0, -24(%rbp)
	je	.L70
	.loc 1 285 18
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 285 29
	movq	-16(%rbp), %rdx
	addq	$64, %rdx
	.loc 1 285 15
	movq	%rdx, %rcx
	call	*%rax
.LVL2:
	movq	%rax, -8(%rbp)
.L70:
	.loc 1 288 12
	movq	-8(%rbp), %rax
.L67:
	.loc 1 289 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.seh_endproc
	.globl	formularioRawRespuesta
	.def	formularioRawRespuesta;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioRawRespuesta
formularioRawRespuesta:
.LFB24:
	.loc 1 292 1
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
	movl	%edx, 24(%rbp)
	.loc 1 293 7
	cmpq	$0, 16(%rbp)
	je	.L72
	.loc 1 293 11 discriminator 1
	cmpl	$0, 24(%rbp)
	js	.L72
	.loc 1 293 28 discriminator 2
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 293 20 discriminator 2
	cmpl	%eax, 24(%rbp)
	jle	.L73
.L72:
	.loc 1 294 15
	movl	$0, %eax
	jmp	.L74
.L73:
	.loc 1 297 16
	movq	16(%rbp), %rax
	leaq	64(%rax), %rdx
	.loc 1 297 26
	movl	24(%rbp), %eax
	cltq
	imulq	$208, %rax, %rax
	.loc 1 297 12
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.loc 1 299 12
	movq	-8(%rbp), %rax
	addq	$64, %rax
.L74:
	.loc 1 300 1
	addq	$16, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.seh_endproc
	.globl	formularioDestruir
	.def	formularioDestruir;	.scl	2;	.type	32;	.endef
	.seh_proc	formularioDestruir
formularioDestruir:
.LFB25:
	.loc 1 303 1
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
	.loc 1 304 12
	movq	16(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -8(%rbp)
	.loc 1 307 11
	movl	$0, -12(%rbp)
	.loc 1 307 5
	jmp	.L76
.L77:
	.loc 1 308 9 discriminator 3
	movq	-8(%rbp), %rax
	movq	200(%rax), %rax
	movq	%rax, %rcx
	call	free
	.loc 1 307 28 discriminator 3
	addl	$1, -12(%rbp)
	.loc 1 307 33 discriminator 3
	addq	$208, -8(%rbp)
.L76:
	.loc 1 307 21 discriminator 1
	movq	16(%rbp), %rax
	movl	3392(%rax), %eax
	.loc 1 307 5 discriminator 1
	cmpl	%eax, -12(%rbp)
	jl	.L77
	.loc 1 311 12
	movl	$0, %eax
	.loc 1 312 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.seh_endproc
.Letext0:
	.file 2 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdarg.h"
	.file 3 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/malloc.h"
	.file 6 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/ctype.h"
	.file 7 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/formulario.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0xf27
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C89 8.1.0 -mtune=core2 -march=nocona -g -std=c90\0"
	.byte	0x1
	.ascii "C:\\Users\\LENOVO\\OneDrive\\Escritorio\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\\formulario.c\0"
	.ascii "C:\\\\Users\\\\LENOVO\\\\OneDrive\\\\Escritorio\\\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.ascii "__gnuc_va_list\0"
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x137
	.uleb128 0x3
	.byte	0x8
	.ascii "__builtin_va_list\0"
	.long	0x14f
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.ascii "va_list\0"
	.byte	0x2
	.byte	0x6b
	.byte	0x18
	.long	0x120
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x2
	.ascii "wchar_t\0"
	.byte	0x3
	.byte	0x62
	.byte	0x18
	.long	0x1a2
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x5
	.long	0x1a2
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x6
	.ascii "pthreadlocinfo\0"
	.byte	0x3
	.word	0x1a8
	.byte	0x28
	.long	0x1e8
	.uleb128 0x7
	.byte	0x8
	.long	0x1ee
	.uleb128 0x8
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x3
	.word	0x1bc
	.byte	0x10
	.long	0x398
	.uleb128 0x9
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1bd
	.byte	0x7
	.long	0x1bd
	.byte	0
	.uleb128 0xa
	.ascii "lc_codepage\0"
	.byte	0x3
	.word	0x1be
	.byte	0x10
	.long	0x4e5
	.byte	0x4
	.uleb128 0xa
	.ascii "lc_collate_cp\0"
	.byte	0x3
	.word	0x1bf
	.byte	0x10
	.long	0x4e5
	.byte	0x8
	.uleb128 0xa
	.ascii "lc_handle\0"
	.byte	0x3
	.word	0x1c0
	.byte	0x11
	.long	0x4f5
	.byte	0xc
	.uleb128 0xa
	.ascii "lc_id\0"
	.byte	0x3
	.word	0x1c1
	.byte	0x9
	.long	0x51a
	.byte	0x24
	.uleb128 0xa
	.ascii "lc_category\0"
	.byte	0x3
	.word	0x1c7
	.byte	0x5
	.long	0x52a
	.byte	0x48
	.uleb128 0xb
	.ascii "lc_clike\0"
	.byte	0x3
	.word	0x1c8
	.byte	0x7
	.long	0x1bd
	.word	0x108
	.uleb128 0xb
	.ascii "mb_cur_max\0"
	.byte	0x3
	.word	0x1c9
	.byte	0x7
	.long	0x1bd
	.word	0x10c
	.uleb128 0xb
	.ascii "lconv_intl_refcount\0"
	.byte	0x3
	.word	0x1ca
	.byte	0x8
	.long	0x4df
	.word	0x110
	.uleb128 0xb
	.ascii "lconv_num_refcount\0"
	.byte	0x3
	.word	0x1cb
	.byte	0x8
	.long	0x4df
	.word	0x118
	.uleb128 0xb
	.ascii "lconv_mon_refcount\0"
	.byte	0x3
	.word	0x1cc
	.byte	0x8
	.long	0x4df
	.word	0x120
	.uleb128 0xb
	.ascii "lconv\0"
	.byte	0x3
	.word	0x1cd
	.byte	0x11
	.long	0x541
	.word	0x128
	.uleb128 0xb
	.ascii "ctype1_refcount\0"
	.byte	0x3
	.word	0x1ce
	.byte	0x8
	.long	0x4df
	.word	0x130
	.uleb128 0xb
	.ascii "ctype1\0"
	.byte	0x3
	.word	0x1cf
	.byte	0x13
	.long	0x547
	.word	0x138
	.uleb128 0xb
	.ascii "pctype\0"
	.byte	0x3
	.word	0x1d0
	.byte	0x19
	.long	0x54d
	.word	0x140
	.uleb128 0xb
	.ascii "pclmap\0"
	.byte	0x3
	.word	0x1d1
	.byte	0x18
	.long	0x553
	.word	0x148
	.uleb128 0xb
	.ascii "pcumap\0"
	.byte	0x3
	.word	0x1d2
	.byte	0x18
	.long	0x553
	.word	0x150
	.uleb128 0xb
	.ascii "lc_time_curr\0"
	.byte	0x3
	.word	0x1d3
	.byte	0x1a
	.long	0x57f
	.word	0x158
	.byte	0
	.uleb128 0x6
	.ascii "pthreadmbcinfo\0"
	.byte	0x3
	.word	0x1a9
	.byte	0x25
	.long	0x3b0
	.uleb128 0x7
	.byte	0x8
	.long	0x3b6
	.uleb128 0xc
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xd
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x3
	.word	0x1ac
	.byte	0x10
	.long	0x40c
	.uleb128 0xa
	.ascii "locinfo\0"
	.byte	0x3
	.word	0x1ad
	.byte	0x12
	.long	0x1d0
	.byte	0
	.uleb128 0xa
	.ascii "mbcinfo\0"
	.byte	0x3
	.word	0x1ae
	.byte	0x12
	.long	0x398
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "_locale_tstruct\0"
	.byte	0x3
	.word	0x1af
	.byte	0x3
	.long	0x3cb
	.uleb128 0xd
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x3
	.word	0x1b3
	.byte	0x10
	.long	0x474
	.uleb128 0xa
	.ascii "wLanguage\0"
	.byte	0x3
	.word	0x1b4
	.byte	0x12
	.long	0x1a2
	.byte	0
	.uleb128 0xa
	.ascii "wCountry\0"
	.byte	0x3
	.word	0x1b5
	.byte	0x12
	.long	0x1a2
	.byte	0x2
	.uleb128 0xa
	.ascii "wCodePage\0"
	.byte	0x3
	.word	0x1b6
	.byte	0x12
	.long	0x1a2
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "LC_ID\0"
	.byte	0x3
	.word	0x1b7
	.byte	0x3
	.long	0x425
	.uleb128 0xe
	.byte	0x20
	.byte	0x3
	.word	0x1c2
	.byte	0x3
	.long	0x4d3
	.uleb128 0xa
	.ascii "locale\0"
	.byte	0x3
	.word	0x1c3
	.byte	0xb
	.long	0x4d3
	.byte	0
	.uleb128 0xa
	.ascii "wlocale\0"
	.byte	0x3
	.word	0x1c4
	.byte	0xe
	.long	0x4d9
	.byte	0x8
	.uleb128 0x9
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1c5
	.byte	0xa
	.long	0x4df
	.byte	0x10
	.uleb128 0xa
	.ascii "wrefcount\0"
	.byte	0x3
	.word	0x1c6
	.byte	0xa
	.long	0x4df
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x14f
	.uleb128 0x7
	.byte	0x8
	.long	0x192
	.uleb128 0x7
	.byte	0x8
	.long	0x1bd
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xf
	.long	0x505
	.long	0x505
	.uleb128 0x10
	.long	0x167
	.byte	0x5
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xf
	.long	0x474
	.long	0x52a
	.uleb128 0x10
	.long	0x167
	.byte	0x5
	.byte	0
	.uleb128 0xf
	.long	0x483
	.long	0x53a
	.uleb128 0x10
	.long	0x167
	.byte	0x5
	.byte	0
	.uleb128 0xc
	.ascii "lconv\0"
	.uleb128 0x7
	.byte	0x8
	.long	0x53a
	.uleb128 0x7
	.byte	0x8
	.long	0x1a2
	.uleb128 0x7
	.byte	0x8
	.long	0x1b8
	.uleb128 0x7
	.byte	0x8
	.long	0x56a
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x5
	.long	0x559
	.uleb128 0xc
	.ascii "__lc_time_data\0"
	.uleb128 0x7
	.byte	0x8
	.long	0x56f
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x4
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x11
	.ascii "__imp___mb_cur_max\0"
	.byte	0x4
	.byte	0x73
	.byte	0x10
	.long	0x4df
	.uleb128 0xf
	.long	0x4d3
	.long	0x5d2
	.uleb128 0x10
	.long	0x167
	.byte	0
	.byte	0
	.uleb128 0x11
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x5c2
	.uleb128 0x11
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x1bd
	.uleb128 0x12
	.ascii "__imp___argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x4df
	.uleb128 0x12
	.ascii "__imp___argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x625
	.uleb128 0x7
	.byte	0x8
	.long	0x62b
	.uleb128 0x7
	.byte	0x8
	.long	0x4d3
	.uleb128 0x12
	.ascii "__imp___wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x648
	.uleb128 0x7
	.byte	0x8
	.long	0x64e
	.uleb128 0x7
	.byte	0x8
	.long	0x4d9
	.uleb128 0x12
	.ascii "__imp__environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x625
	.uleb128 0x12
	.ascii "__imp__wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x648
	.uleb128 0x12
	.ascii "__imp__pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x62b
	.uleb128 0x12
	.ascii "__imp__wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x64e
	.uleb128 0x12
	.ascii "__imp__osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x6cf
	.uleb128 0x7
	.byte	0x8
	.long	0x4e5
	.uleb128 0x12
	.ascii "__imp__osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x6cf
	.uleb128 0x12
	.ascii "__imp__winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x6cf
	.uleb128 0x12
	.ascii "__imp__winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x6cf
	.uleb128 0x12
	.ascii "__imp__winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x6cf
	.uleb128 0x11
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x4e5
	.uleb128 0x11
	.ascii "__imp__pctype\0"
	.byte	0x6
	.byte	0x2b
	.byte	0x1c
	.long	0x75c
	.uleb128 0x7
	.byte	0x8
	.long	0x547
	.uleb128 0x11
	.ascii "__imp__wctype\0"
	.byte	0x6
	.byte	0x3b
	.byte	0x1c
	.long	0x75c
	.uleb128 0x11
	.ascii "__imp__pwctype\0"
	.byte	0x6
	.byte	0x47
	.byte	0x1c
	.long	0x75c
	.uleb128 0xf
	.long	0x56a
	.long	0x79a
	.uleb128 0x13
	.byte	0
	.uleb128 0x5
	.long	0x78f
	.uleb128 0x11
	.ascii "__newclmap\0"
	.byte	0x6
	.byte	0x50
	.byte	0x1e
	.long	0x79a
	.uleb128 0x11
	.ascii "__newcumap\0"
	.byte	0x6
	.byte	0x51
	.byte	0x1e
	.long	0x79a
	.uleb128 0x11
	.ascii "__ptlocinfo\0"
	.byte	0x6
	.byte	0x52
	.byte	0x19
	.long	0x1d0
	.uleb128 0x11
	.ascii "__ptmbcinfo\0"
	.byte	0x6
	.byte	0x53
	.byte	0x19
	.long	0x398
	.uleb128 0x11
	.ascii "__globallocalestatus\0"
	.byte	0x6
	.byte	0x54
	.byte	0xe
	.long	0x1bd
	.uleb128 0x11
	.ascii "__locale_changed\0"
	.byte	0x6
	.byte	0x55
	.byte	0xe
	.long	0x1bd
	.uleb128 0x11
	.ascii "__initiallocinfo\0"
	.byte	0x6
	.byte	0x56
	.byte	0x28
	.long	0x1ee
	.uleb128 0x11
	.ascii "__initiallocalestructinfo\0"
	.byte	0x6
	.byte	0x57
	.byte	0x1a
	.long	0x40c
	.uleb128 0x14
	.byte	0x8
	.uleb128 0x15
	.byte	0xd0
	.byte	0x7
	.byte	0x1c
	.byte	0x9
	.long	0x8b3
	.uleb128 0x16
	.secrel32	.LASF1
	.byte	0x7
	.byte	0x1d
	.byte	0xa
	.long	0x8b3
	.byte	0
	.uleb128 0x17
	.ascii "respuesta\0"
	.byte	0x7
	.byte	0x1e
	.byte	0xa
	.long	0x8c3
	.byte	0x40
	.uleb128 0x16
	.secrel32	.LASF2
	.byte	0x7
	.byte	0x1f
	.byte	0x9
	.long	0x1bd
	.byte	0xc0
	.uleb128 0x17
	.ascii "tipo\0"
	.byte	0x7
	.byte	0x20
	.byte	0x9
	.long	0x1bd
	.byte	0xc4
	.uleb128 0x17
	.ascii "info\0"
	.byte	0x7
	.byte	0x21
	.byte	0xb
	.long	0x85e
	.byte	0xc8
	.byte	0
	.uleb128 0xf
	.long	0x14f
	.long	0x8c3
	.uleb128 0x10
	.long	0x167
	.byte	0x3f
	.byte	0
	.uleb128 0xf
	.long	0x14f
	.long	0x8d3
	.uleb128 0x10
	.long	0x167
	.byte	0x7f
	.byte	0
	.uleb128 0x2
	.ascii "Campo\0"
	.byte	0x7
	.byte	0x22
	.byte	0x2
	.long	0x860
	.uleb128 0x18
	.word	0xdd0
	.byte	0x7
	.byte	0x25
	.byte	0x9
	.long	0x93d
	.uleb128 0x17
	.ascii "titulo\0"
	.byte	0x7
	.byte	0x26
	.byte	0xa
	.long	0x8b3
	.byte	0
	.uleb128 0x17
	.ascii "campos\0"
	.byte	0x7
	.byte	0x27
	.byte	0xb
	.long	0x93d
	.byte	0x40
	.uleb128 0x19
	.ascii "ce\0"
	.byte	0x7
	.byte	0x28
	.byte	0x9
	.long	0x1bd
	.word	0xd40
	.uleb128 0x19
	.ascii "Validaciones\0"
	.byte	0x7
	.byte	0x2a
	.byte	0xb
	.long	0x94d
	.word	0xd48
	.uleb128 0x19
	.ascii "cv\0"
	.byte	0x7
	.byte	0x2b
	.byte	0x9
	.long	0x1bd
	.word	0xdc8
	.byte	0
	.uleb128 0xf
	.long	0x8d3
	.long	0x94d
	.uleb128 0x10
	.long	0x167
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.long	0x95d
	.long	0x95d
	.uleb128 0x10
	.long	0x167
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x963
	.uleb128 0x1a
	.long	0x1bd
	.long	0x972
	.uleb128 0x1b
	.long	0x85e
	.byte	0
	.uleb128 0x2
	.ascii "Formulario_t\0"
	.byte	0x7
	.byte	0x2c
	.byte	0x2
	.long	0x8e1
	.uleb128 0x15
	.byte	0x10
	.byte	0x1
	.byte	0x19
	.byte	0x9
	.long	0x9ab
	.uleb128 0x17
	.ascii "min\0"
	.byte	0x1
	.byte	0x1a
	.byte	0xc
	.long	0x585
	.byte	0
	.uleb128 0x17
	.ascii "max\0"
	.byte	0x1
	.byte	0x1b
	.byte	0xc
	.long	0x585
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.ascii "AtribNum\0"
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.long	0x987
	.uleb128 0x15
	.byte	0x18
	.byte	0x1
	.byte	0x1e
	.byte	0x9
	.long	0x9f5
	.uleb128 0x17
	.ascii "len\0"
	.byte	0x1
	.byte	0x1f
	.byte	0x9
	.long	0x1bd
	.byte	0
	.uleb128 0x17
	.ascii "Validar\0"
	.byte	0x1
	.byte	0x20
	.byte	0xb
	.long	0xa04
	.byte	0x8
	.uleb128 0x17
	.ascii "Parsear\0"
	.byte	0x1
	.byte	0x21
	.byte	0xd
	.long	0xa19
	.byte	0x10
	.byte	0
	.uleb128 0x1a
	.long	0x1bd
	.long	0xa04
	.uleb128 0x1b
	.long	0x4d3
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x9f5
	.uleb128 0x1a
	.long	0x4d3
	.long	0xa19
	.uleb128 0x1b
	.long	0x4d3
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0xa0a
	.uleb128 0x2
	.ascii "AtribTxt\0"
	.byte	0x1
	.byte	0x22
	.byte	0x2
	.long	0x9bc
	.uleb128 0x18
	.word	0x404
	.byte	0x1
	.byte	0x24
	.byte	0x9
	.long	0xa64
	.uleb128 0x17
	.ascii "opciones\0"
	.byte	0x1
	.byte	0x25
	.byte	0xa
	.long	0xa64
	.byte	0
	.uleb128 0x19
	.ascii "cantOpciones\0"
	.byte	0x1
	.byte	0x26
	.byte	0x9
	.long	0x1bd
	.word	0x400
	.byte	0
	.uleb128 0xf
	.long	0x14f
	.long	0xa7a
	.uleb128 0x10
	.long	0x167
	.byte	0xf
	.uleb128 0x10
	.long	0x167
	.byte	0x3f
	.byte	0
	.uleb128 0x2
	.ascii "AtribOpciones\0"
	.byte	0x1
	.byte	0x27
	.byte	0x2
	.long	0xa30
	.uleb128 0x1c
	.ascii "formularioDestruir\0"
	.byte	0x1
	.word	0x12e
	.byte	0x5
	.long	0x1bd
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xaed
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.word	0x12e
	.byte	0x26
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x130
	.byte	0xc
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x131
	.byte	0x9
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x972
	.uleb128 0x7
	.byte	0x8
	.long	0x8d3
	.uleb128 0x1f
	.ascii "formularioRawRespuesta\0"
	.byte	0x1
	.word	0x123
	.byte	0x7
	.long	0x4d3
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xb5a
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.word	0x123
	.byte	0x2c
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.word	0x123
	.byte	0x33
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x129
	.byte	0xc
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.ascii "formularioRespuesta\0"
	.byte	0x1
	.word	0x110
	.byte	0x7
	.long	0x4d3
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xbd8
	.uleb128 0x1d
	.ascii "f\0"
	.byte	0x1
	.word	0x110
	.byte	0x29
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.word	0x110
	.byte	0x30
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x116
	.byte	0xc
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.ascii "att\0"
	.byte	0x1
	.word	0x117
	.byte	0xf
	.long	0xbd8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.ascii "res\0"
	.byte	0x1
	.word	0x118
	.byte	0xb
	.long	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0xa1f
	.uleb128 0x20
	.ascii "formularioPublicar\0"
	.byte	0x1
	.byte	0xda
	.byte	0x5
	.long	0x1bd
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xca4
	.uleb128 0x21
	.ascii "f\0"
	.byte	0x1
	.byte	0xda
	.byte	0x26
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x22
	.ascii "c\0"
	.byte	0x1
	.byte	0xdc
	.byte	0xc
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0xdd
	.byte	0x9
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.ascii "conforme\0"
	.byte	0x1
	.byte	0xdd
	.byte	0xc
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x23
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0xc80
	.uleb128 0x22
	.ascii "atr__\0"
	.byte	0x1
	.byte	0xf0
	.byte	0x2c
	.long	0xca4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.ascii "i__\0"
	.byte	0x1
	.byte	0xf0
	.byte	0x4d
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x22
	.ascii "atr__\0"
	.byte	0x1
	.byte	0xf7
	.byte	0x28
	.long	0xca4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0xa7a
	.uleb128 0x25
	.ascii "formularioAgregarValidado\0"
	.byte	0x1
	.byte	0xca
	.byte	0x5
	.long	0x1bd
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xd0d
	.uleb128 0x21
	.ascii "f\0"
	.byte	0x1
	.byte	0xca
	.byte	0x2d
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x21
	.ascii "ValidarFormulario\0"
	.byte	0x1
	.byte	0xca
	.byte	0x36
	.long	0x95d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x20
	.ascii "formularioAgregarCampoVA\0"
	.byte	0x1
	.byte	0x71
	.byte	0x5
	.long	0x1bd
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf8
	.uleb128 0x21
	.ascii "f\0"
	.byte	0x1
	.byte	0x71
	.byte	0x2c
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.secrel32	.LASF1
	.byte	0x1
	.byte	0x71
	.byte	0x35
	.long	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x26
	.secrel32	.LASF2
	.byte	0x1
	.byte	0x71
	.byte	0x43
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x21
	.ascii "tipo\0"
	.byte	0x1
	.byte	0x71
	.byte	0x51
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x27
	.uleb128 0x22
	.ascii "c\0"
	.byte	0x1
	.byte	0x7b
	.byte	0xc
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.ascii "ap\0"
	.byte	0x1
	.byte	0x7c
	.byte	0xd
	.long	0x157
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x24
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x22
	.ascii "atn\0"
	.byte	0x1
	.byte	0x8b
	.byte	0x17
	.long	0xdf8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.ascii "att\0"
	.byte	0x1
	.byte	0x9d
	.byte	0x17
	.long	0xbd8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.ascii "ato\0"
	.byte	0x1
	.byte	0xb0
	.byte	0x1c
	.long	0xca4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0xb1
	.byte	0x11
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xb4
	.byte	0x14
	.long	0x62b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x9ab
	.uleb128 0x20
	.ascii "formularioInit\0"
	.byte	0x1
	.byte	0x64
	.byte	0x5
	.long	0x1bd
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xe4b
	.uleb128 0x21
	.ascii "f\0"
	.byte	0x1
	.byte	0x64
	.byte	0x22
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x21
	.ascii "titulo\0"
	.byte	0x1
	.byte	0x64
	.byte	0x2b
	.long	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x20
	.ascii "formularioValidar\0"
	.byte	0x1
	.byte	0x57
	.byte	0x5
	.long	0x1bd
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xe96
	.uleb128 0x21
	.ascii "f\0"
	.byte	0x1
	.byte	0x57
	.byte	0x25
	.long	0xaed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x59
	.byte	0x9
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x28
	.ascii "campoValidar\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x5
	.long	0x1bd
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.ascii "c\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x19
	.long	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x24
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x22
	.ascii "atn\0"
	.byte	0x1
	.byte	0x30
	.byte	0x17
	.long	0xdf8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.ascii "tmpF\0"
	.byte	0x1
	.byte	0x31
	.byte	0x14
	.long	0x585
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.ascii "att\0"
	.byte	0x1
	.byte	0x3b
	.byte	0x17
	.long	0xbd8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.ascii "ato\0"
	.byte	0x1
	.byte	0x4a
	.byte	0x1c
	.long	0xca4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.ascii "tmpI\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x11
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
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
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1d
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
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
.LASF1:
	.ascii "etiqueta\0"
.LASF0:
	.ascii "refcount\0"
.LASF2:
	.ascii "validado\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	atof;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	esperarInput;	.scl	2;	.type	32;	.endef
	.def	stringLenght;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	stringNCopy;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	flushStdin;	.scl	2;	.type	32;	.endef
	.def	scanString;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	toUpper;	.scl	2;	.type	32;	.endef
