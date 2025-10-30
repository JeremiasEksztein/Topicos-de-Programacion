	.file	"parseoDivisiones.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	parsearYCorregirIPCDivisiones
	.def	parsearYCorregirIPCDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	parsearYCorregirIPCDivisiones
parsearYCorregirIPCDivisiones:
.LFB17:
	.file 1 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/parseoDivisiones.c"
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
	movq	%rdx, 24(%rbp)
	.loc 1 11 20
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 13 11
	movq	$0, -8(%rbp)
	.loc 1 16 9
	movq	16(%rbp), %r8
	movl	$500, %edx
	leaq	buffer.5174(%rip), %rcx
	call	fgets
	.loc 1 16 7
	testq	%rax, %rax
	jne	.L2
	.loc 1 17 16
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 20 5
	movl	$34, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRemove
	.loc 1 21 5
	movl	$46, %r8d
	movl	$44, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringReplace
	.loc 1 23 14
	movl	$10, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 23 7
	cmpq	$0, -8(%rbp)
	jne	.L4
	.loc 1 24 18
	movl	$-1, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 24 11
	cmpq	$0, -8(%rbp)
	jne	.L4
	.loc 1 25 20
	movl	$4, %eax
	jmp	.L3
.L4:
	.loc 1 29 8
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 31 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 31 7
	cmpq	$0, -8(%rbp)
	jne	.L5
	.loc 1 32 16
	movl	$5, %eax
	jmp	.L3
.L5:
	.loc 1 35 5
	addq	$1, -8(%rbp)
	.loc 1 36 20
	movq	-16(%rbp), %rax
	addq	$185, %rax
	.loc 1 36 5
	movq	-8(%rbp), %rdx
	movl	$30, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 37 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 39 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 39 7
	cmpq	$0, -8(%rbp)
	jne	.L6
	.loc 1 40 16
	movl	$5, %eax
	jmp	.L3
.L6:
	.loc 1 43 5
	addq	$1, -8(%rbp)
	.loc 1 44 20
	movq	-16(%rbp), %rax
	addq	$170, %rax
	.loc 1 44 5
	movq	-8(%rbp), %rdx
	movl	$15, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 45 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 47 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 47 7
	cmpq	$0, -8(%rbp)
	jne	.L7
	.loc 1 48 16
	movl	$5, %eax
	jmp	.L3
.L7:
	.loc 1 51 5
	addq	$1, -8(%rbp)
	.loc 1 52 20
	movq	-16(%rbp), %rax
	addq	$152, %rax
	.loc 1 52 5
	movq	-8(%rbp), %rdx
	movl	$18, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 53 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 55 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 55 7
	cmpq	$0, -8(%rbp)
	jne	.L8
	.loc 1 56 16
	movl	$5, %eax
	jmp	.L3
.L8:
	.loc 1 59 5
	addq	$1, -8(%rbp)
	.loc 1 60 20
	movq	-16(%rbp), %rax
	addq	$134, %rax
	.loc 1 60 5
	movq	-8(%rbp), %rdx
	movl	$18, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 61 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 63 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 63 7
	cmpq	$0, -8(%rbp)
	jne	.L9
	.loc 1 64 16
	movl	$5, %eax
	jmp	.L3
.L9:
	.loc 1 67 5
	addq	$1, -8(%rbp)
	.loc 1 68 20
	movq	-16(%rbp), %rax
	addq	$116, %rax
	.loc 1 68 5
	movq	-8(%rbp), %rdx
	movl	$18, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 69 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 71 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 71 7
	cmpq	$0, -8(%rbp)
	jne	.L10
	.loc 1 72 16
	movl	$5, %eax
	jmp	.L3
.L10:
	.loc 1 75 5
	addq	$1, -8(%rbp)
	.loc 1 76 20
	movq	-16(%rbp), %rax
	addq	$76, %rax
	.loc 1 76 5
	movq	-8(%rbp), %rdx
	movl	$40, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 77 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 79 14
	movl	$59, %edx
	leaq	buffer.5174(%rip), %rcx
	call	stringRChar
	movq	%rax, -8(%rbp)
	.loc 1 79 7
	cmpq	$0, -8(%rbp)
	jne	.L11
	.loc 1 80 16
	movl	$5, %eax
	jmp	.L3
.L11:
	.loc 1 83 5
	addq	$1, -8(%rbp)
	.loc 1 84 20
	movq	-16(%rbp), %rax
	addq	$15, %rax
	.loc 1 84 5
	movq	-8(%rbp), %rdx
	movl	$61, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 85 12
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 87 20
	movq	-16(%rbp), %rax
	.loc 1 87 5
	movl	$15, %r8d
	leaq	buffer.5174(%rip), %rdx
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 89 5
	movq	-16(%rbp), %rax
	leaq	decodificador.5176(%rip), %rdx
	movq	%rax, %rcx
	call	decodificarFechaDivisiones
	.loc 1 90 5
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	convertirFechaDivisiones
	.loc 1 91 5
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	normalizarDescripcionDivisiones
	.loc 1 92 22
	movq	-16(%rbp), %rax
	addq	$15, %rax
	.loc 1 92 5
	movl	$44, %r8d
	movl	$46, %edx
	movq	%rax, %rcx
	call	stringReplace
	.loc 1 94 12
	movl	$0, %eax
.L3:
	.loc 1 95 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
	.globl	decodificarFechaDivisiones
	.def	decodificarFechaDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	decodificarFechaDivisiones
decodificarFechaDivisiones:
.LFB18:
	.loc 1 98 1
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
	movq	%rdx, 24(%rbp)
	.loc 1 99 11
	movq	16(%rbp), %rax
	addq	$185, %rax
	movq	%rax, -8(%rbp)
	.loc 1 101 10
	jmp	.L13
.L16:
	.loc 1 102 12
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 102 11
	cmpb	$47, %al
	jle	.L14
	.loc 1 102 25 discriminator 1
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 102 22 discriminator 1
	cmpb	$57, %al
	jg	.L14
	.loc 1 103 24
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	.loc 1 103 23
	salq	$2, %rax
	leaq	-192(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 1 103 16
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	.loc 1 107 9
	addq	$1, -8(%rbp)
	jmp	.L13
.L14:
	.loc 1 105 20
	movl	$5, %eax
	jmp	.L15
.L13:
	.loc 1 101 11
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 101 10
	testb	%al, %al
	jne	.L16
	.loc 1 110 12
	movl	$0, %eax
.L15:
	.loc 1 111 1
	addq	$16, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%s - %s\0"
	.text
	.globl	convertirFechaDivisiones
	.def	convertirFechaDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	convertirFechaDivisiones
convertirFechaDivisiones:
.LFB19:
	.loc 1 114 1
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
	.loc 1 115 11
	movq	16(%rbp), %rax
	addq	$185, %rax
	movq	%rax, -8(%rbp)
	.loc 1 127 5
	movq	-8(%rbp), %rdx
	leaq	-17(%rbp), %rax
	movl	$4, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 129 22
	movq	-8(%rbp), %rax
	leaq	4(%rax), %rdx
	.loc 1 129 5
	leaq	-20(%rbp), %rax
	movl	$2, %r8d
	movq	%rax, %rcx
	call	stringNCopy
	.loc 1 130 11
	leaq	-20(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -12(%rbp)
	.loc 1 132 7
	cmpl	$0, -12(%rbp)
	jle	.L18
	.loc 1 132 16 discriminator 1
	cmpl	$12, -12(%rbp)
	jle	.L19
.L18:
	.loc 1 133 16
	movl	$5, %eax
	jmp	.L21
.L19:
	.loc 1 136 48
	movl	-12(%rbp), %eax
	subl	$1, %eax
	.loc 1 136 5
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	meses.5189(%rip), %rax
	movq	(%rdx,%rax), %rcx
	.loc 1 136 16
	movq	16(%rbp), %rax
	addq	$185, %rax
	.loc 1 136 5
	leaq	-17(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rcx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	.loc 1 138 12
	movl	$0, %eax
.L21:
	.loc 1 139 1 discriminator 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.seh_endproc
	.globl	normalizarDescripcionDivisiones
	.def	normalizarDescripcionDivisiones;	.scl	2;	.type	32;	.endef
	.seh_proc	normalizarDescripcionDivisiones
normalizarDescripcionDivisiones:
.LFB20:
	.loc 1 142 1
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
	.loc 1 143 11
	movq	16(%rbp), %rax
	addq	$15, %rax
	movq	%rax, -8(%rbp)
	.loc 1 145 15
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 145 7
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toUpper
	.loc 1 145 5
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	.loc 1 147 3
	addq	$1, -8(%rbp)
	.loc 1 148 8
	jmp	.L23
.L25:
	.loc 1 149 15
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 7
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	isAlpha
	.loc 1 149 6
	testl	%eax, %eax
	je	.L24
	.loc 1 150 17
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 150 9
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toLower
	.loc 1 150 7
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
.L24:
	.loc 1 152 3
	addq	$1, -8(%rbp)
.L23:
	.loc 1 148 9
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 148 8
	testb	%al, %al
	jne	.L25
	.loc 1 154 9
	movl	$0, %eax
	.loc 1 156 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.seh_endproc
.lcomm buffer.5174,500,32
	.data
	.align 32
decodificador.5176:
	.long	52
	.long	54
	.long	56
	.long	55
	.long	49
	.long	57
	.long	53
	.long	48
	.long	51
	.long	50
	.section .rdata,"dr"
.LC1:
	.ascii "Enero\0"
.LC2:
	.ascii "Febrero\0"
.LC3:
	.ascii "Marzo\0"
.LC4:
	.ascii "Abril\0"
.LC5:
	.ascii "Mayo\0"
.LC6:
	.ascii "Junio\0"
.LC7:
	.ascii "Julio\0"
.LC8:
	.ascii "Agosto\0"
.LC9:
	.ascii "Septiembre\0"
.LC10:
	.ascii "Octubre\0"
.LC11:
	.ascii "Noviembre\0"
.LC12:
	.ascii "Diciembre\0"
	.data
	.align 32
meses.5189:
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.text
.Letext0:
	.file 2 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/crtdefs.h"
	.file 3 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdlib.h"
	.file 4 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/malloc.h"
	.file 5 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdio.h"
	.file 6 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/ctype.h"
	.file 7 "C:/Users/LENOVO/OneDrive/Escritorio/TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX/comunes.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0xc32
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C89 8.1.0 -mtune=core2 -march=nocona -g -std=c90\0"
	.byte	0x1
	.ascii "C:\\Users\\LENOVO\\OneDrive\\Escritorio\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\\parseoDivisiones.c\0"
	.ascii "C:\\\\Users\\\\LENOVO\\\\OneDrive\\\\Escritorio\\\\TP_T\363picos_2025_2c_jueves_LOS_FUNDAMENTALISTAS_DE_LINUX\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.long	0x126
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
	.long	0x16e
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.long	0x16e
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
	.long	0x1b4
	.uleb128 0x6
	.byte	0x8
	.long	0x1ba
	.uleb128 0x7
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x2
	.word	0x1bc
	.byte	0x10
	.long	0x364
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1bd
	.byte	0x7
	.long	0x189
	.byte	0
	.uleb128 0x9
	.ascii "lc_codepage\0"
	.byte	0x2
	.word	0x1be
	.byte	0x10
	.long	0x4b1
	.byte	0x4
	.uleb128 0x9
	.ascii "lc_collate_cp\0"
	.byte	0x2
	.word	0x1bf
	.byte	0x10
	.long	0x4b1
	.byte	0x8
	.uleb128 0x9
	.ascii "lc_handle\0"
	.byte	0x2
	.word	0x1c0
	.byte	0x11
	.long	0x4c1
	.byte	0xc
	.uleb128 0x9
	.ascii "lc_id\0"
	.byte	0x2
	.word	0x1c1
	.byte	0x9
	.long	0x4e6
	.byte	0x24
	.uleb128 0x9
	.ascii "lc_category\0"
	.byte	0x2
	.word	0x1c7
	.byte	0x5
	.long	0x4f6
	.byte	0x48
	.uleb128 0xa
	.ascii "lc_clike\0"
	.byte	0x2
	.word	0x1c8
	.byte	0x7
	.long	0x189
	.word	0x108
	.uleb128 0xa
	.ascii "mb_cur_max\0"
	.byte	0x2
	.word	0x1c9
	.byte	0x7
	.long	0x189
	.word	0x10c
	.uleb128 0xa
	.ascii "lconv_intl_refcount\0"
	.byte	0x2
	.word	0x1ca
	.byte	0x8
	.long	0x4ab
	.word	0x110
	.uleb128 0xa
	.ascii "lconv_num_refcount\0"
	.byte	0x2
	.word	0x1cb
	.byte	0x8
	.long	0x4ab
	.word	0x118
	.uleb128 0xa
	.ascii "lconv_mon_refcount\0"
	.byte	0x2
	.word	0x1cc
	.byte	0x8
	.long	0x4ab
	.word	0x120
	.uleb128 0xa
	.ascii "lconv\0"
	.byte	0x2
	.word	0x1cd
	.byte	0x11
	.long	0x50d
	.word	0x128
	.uleb128 0xa
	.ascii "ctype1_refcount\0"
	.byte	0x2
	.word	0x1ce
	.byte	0x8
	.long	0x4ab
	.word	0x130
	.uleb128 0xa
	.ascii "ctype1\0"
	.byte	0x2
	.word	0x1cf
	.byte	0x13
	.long	0x513
	.word	0x138
	.uleb128 0xa
	.ascii "pctype\0"
	.byte	0x2
	.word	0x1d0
	.byte	0x19
	.long	0x519
	.word	0x140
	.uleb128 0xa
	.ascii "pclmap\0"
	.byte	0x2
	.word	0x1d1
	.byte	0x18
	.long	0x51f
	.word	0x148
	.uleb128 0xa
	.ascii "pcumap\0"
	.byte	0x2
	.word	0x1d2
	.byte	0x18
	.long	0x51f
	.word	0x150
	.uleb128 0xa
	.ascii "lc_time_curr\0"
	.byte	0x2
	.word	0x1d3
	.byte	0x1a
	.long	0x54b
	.word	0x158
	.byte	0
	.uleb128 0x5
	.ascii "pthreadmbcinfo\0"
	.byte	0x2
	.word	0x1a9
	.byte	0x25
	.long	0x37c
	.uleb128 0x6
	.byte	0x8
	.long	0x382
	.uleb128 0xb
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xc
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x2
	.word	0x1ac
	.byte	0x10
	.long	0x3d8
	.uleb128 0x9
	.ascii "locinfo\0"
	.byte	0x2
	.word	0x1ad
	.byte	0x12
	.long	0x19c
	.byte	0
	.uleb128 0x9
	.ascii "mbcinfo\0"
	.byte	0x2
	.word	0x1ae
	.byte	0x12
	.long	0x364
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.ascii "_locale_tstruct\0"
	.byte	0x2
	.word	0x1af
	.byte	0x3
	.long	0x397
	.uleb128 0xc
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x2
	.word	0x1b3
	.byte	0x10
	.long	0x440
	.uleb128 0x9
	.ascii "wLanguage\0"
	.byte	0x2
	.word	0x1b4
	.byte	0x12
	.long	0x16e
	.byte	0
	.uleb128 0x9
	.ascii "wCountry\0"
	.byte	0x2
	.word	0x1b5
	.byte	0x12
	.long	0x16e
	.byte	0x2
	.uleb128 0x9
	.ascii "wCodePage\0"
	.byte	0x2
	.word	0x1b6
	.byte	0x12
	.long	0x16e
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "LC_ID\0"
	.byte	0x2
	.word	0x1b7
	.byte	0x3
	.long	0x3f1
	.uleb128 0xd
	.byte	0x20
	.byte	0x2
	.word	0x1c2
	.byte	0x3
	.long	0x49f
	.uleb128 0x9
	.ascii "locale\0"
	.byte	0x2
	.word	0x1c3
	.byte	0xb
	.long	0x49f
	.byte	0
	.uleb128 0x9
	.ascii "wlocale\0"
	.byte	0x2
	.word	0x1c4
	.byte	0xe
	.long	0x4a5
	.byte	0x8
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x2
	.word	0x1c5
	.byte	0xa
	.long	0x4ab
	.byte	0x10
	.uleb128 0x9
	.ascii "wrefcount\0"
	.byte	0x2
	.word	0x1c6
	.byte	0xa
	.long	0x4ab
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x126
	.uleb128 0x6
	.byte	0x8
	.long	0x15e
	.uleb128 0x6
	.byte	0x8
	.long	0x189
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xe
	.long	0x4d1
	.long	0x4d1
	.uleb128 0xf
	.long	0x133
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xe
	.long	0x440
	.long	0x4f6
	.uleb128 0xf
	.long	0x133
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.long	0x44f
	.long	0x506
	.uleb128 0xf
	.long	0x133
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.ascii "lconv\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x506
	.uleb128 0x6
	.byte	0x8
	.long	0x16e
	.uleb128 0x6
	.byte	0x8
	.long	0x184
	.uleb128 0x6
	.byte	0x8
	.long	0x536
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.long	0x525
	.uleb128 0xb
	.ascii "__lc_time_data\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x53b
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
	.long	0x4ab
	.uleb128 0xe
	.long	0x49f
	.long	0x59e
	.uleb128 0xf
	.long	0x133
	.byte	0
	.byte	0
	.uleb128 0x10
	.ascii "_sys_errlist\0"
	.byte	0x3
	.byte	0xac
	.byte	0x2b
	.long	0x58e
	.uleb128 0x10
	.ascii "_sys_nerr\0"
	.byte	0x3
	.byte	0xad
	.byte	0x29
	.long	0x189
	.uleb128 0x11
	.ascii "__imp___argc\0"
	.byte	0x3
	.word	0x119
	.byte	0x10
	.long	0x4ab
	.uleb128 0x11
	.ascii "__imp___argv\0"
	.byte	0x3
	.word	0x11d
	.byte	0x13
	.long	0x5f1
	.uleb128 0x6
	.byte	0x8
	.long	0x5f7
	.uleb128 0x6
	.byte	0x8
	.long	0x49f
	.uleb128 0x11
	.ascii "__imp___wargv\0"
	.byte	0x3
	.word	0x121
	.byte	0x16
	.long	0x614
	.uleb128 0x6
	.byte	0x8
	.long	0x61a
	.uleb128 0x6
	.byte	0x8
	.long	0x4a5
	.uleb128 0x11
	.ascii "__imp__environ\0"
	.byte	0x3
	.word	0x127
	.byte	0x13
	.long	0x5f1
	.uleb128 0x11
	.ascii "__imp__wenviron\0"
	.byte	0x3
	.word	0x12c
	.byte	0x16
	.long	0x614
	.uleb128 0x11
	.ascii "__imp__pgmptr\0"
	.byte	0x3
	.word	0x132
	.byte	0x12
	.long	0x5f7
	.uleb128 0x11
	.ascii "__imp__wpgmptr\0"
	.byte	0x3
	.word	0x137
	.byte	0x15
	.long	0x61a
	.uleb128 0x11
	.ascii "__imp__osplatform\0"
	.byte	0x3
	.word	0x13c
	.byte	0x19
	.long	0x69b
	.uleb128 0x6
	.byte	0x8
	.long	0x4b1
	.uleb128 0x11
	.ascii "__imp__osver\0"
	.byte	0x3
	.word	0x141
	.byte	0x19
	.long	0x69b
	.uleb128 0x11
	.ascii "__imp__winver\0"
	.byte	0x3
	.word	0x146
	.byte	0x19
	.long	0x69b
	.uleb128 0x11
	.ascii "__imp__winmajor\0"
	.byte	0x3
	.word	0x14b
	.byte	0x19
	.long	0x69b
	.uleb128 0x11
	.ascii "__imp__winminor\0"
	.byte	0x3
	.word	0x150
	.byte	0x19
	.long	0x69b
	.uleb128 0x10
	.ascii "_amblksiz\0"
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.long	0x4b1
	.uleb128 0x12
	.ascii "_iobuf\0"
	.byte	0x30
	.byte	0x5
	.byte	0x1a
	.byte	0xa
	.long	0x7a2
	.uleb128 0x13
	.ascii "_ptr\0"
	.byte	0x5
	.byte	0x1b
	.byte	0xb
	.long	0x49f
	.byte	0
	.uleb128 0x13
	.ascii "_cnt\0"
	.byte	0x5
	.byte	0x1c
	.byte	0x9
	.long	0x189
	.byte	0x8
	.uleb128 0x13
	.ascii "_base\0"
	.byte	0x5
	.byte	0x1d
	.byte	0xb
	.long	0x49f
	.byte	0x10
	.uleb128 0x13
	.ascii "_flag\0"
	.byte	0x5
	.byte	0x1e
	.byte	0x9
	.long	0x189
	.byte	0x18
	.uleb128 0x13
	.ascii "_file\0"
	.byte	0x5
	.byte	0x1f
	.byte	0x9
	.long	0x189
	.byte	0x1c
	.uleb128 0x13
	.ascii "_charbuf\0"
	.byte	0x5
	.byte	0x20
	.byte	0x9
	.long	0x189
	.byte	0x20
	.uleb128 0x13
	.ascii "_bufsiz\0"
	.byte	0x5
	.byte	0x21
	.byte	0x9
	.long	0x189
	.byte	0x24
	.uleb128 0x13
	.ascii "_tmpfname\0"
	.byte	0x5
	.byte	0x22
	.byte	0xb
	.long	0x49f
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.ascii "FILE\0"
	.byte	0x5
	.byte	0x24
	.byte	0x19
	.long	0x712
	.uleb128 0x10
	.ascii "__imp__pctype\0"
	.byte	0x6
	.byte	0x2b
	.byte	0x1c
	.long	0x7c5
	.uleb128 0x6
	.byte	0x8
	.long	0x513
	.uleb128 0x10
	.ascii "__imp__wctype\0"
	.byte	0x6
	.byte	0x3b
	.byte	0x1c
	.long	0x7c5
	.uleb128 0x10
	.ascii "__imp__pwctype\0"
	.byte	0x6
	.byte	0x47
	.byte	0x1c
	.long	0x7c5
	.uleb128 0xe
	.long	0x536
	.long	0x803
	.uleb128 0x14
	.byte	0
	.uleb128 0x3
	.long	0x7f8
	.uleb128 0x10
	.ascii "__newclmap\0"
	.byte	0x6
	.byte	0x50
	.byte	0x1e
	.long	0x803
	.uleb128 0x10
	.ascii "__newcumap\0"
	.byte	0x6
	.byte	0x51
	.byte	0x1e
	.long	0x803
	.uleb128 0x10
	.ascii "__ptlocinfo\0"
	.byte	0x6
	.byte	0x52
	.byte	0x19
	.long	0x19c
	.uleb128 0x10
	.ascii "__ptmbcinfo\0"
	.byte	0x6
	.byte	0x53
	.byte	0x19
	.long	0x364
	.uleb128 0x10
	.ascii "__globallocalestatus\0"
	.byte	0x6
	.byte	0x54
	.byte	0xe
	.long	0x189
	.uleb128 0x10
	.ascii "__locale_changed\0"
	.byte	0x6
	.byte	0x55
	.byte	0xe
	.long	0x189
	.uleb128 0x10
	.ascii "__initiallocinfo\0"
	.byte	0x6
	.byte	0x56
	.byte	0x28
	.long	0x1ba
	.uleb128 0x10
	.ascii "__initiallocalestructinfo\0"
	.byte	0x6
	.byte	0x57
	.byte	0x1a
	.long	0x3d8
	.uleb128 0x15
	.byte	0x8
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x16
	.byte	0xd7
	.byte	0x7
	.byte	0x35
	.byte	0x9
	.long	0x968
	.uleb128 0x13
	.ascii "cod\0"
	.byte	0x7
	.byte	0x36
	.byte	0xa
	.long	0x968
	.byte	0
	.uleb128 0x13
	.ascii "desc\0"
	.byte	0x7
	.byte	0x37
	.byte	0xa
	.long	0x978
	.byte	0xf
	.uleb128 0x13
	.ascii "clasif\0"
	.byte	0x7
	.byte	0x38
	.byte	0xa
	.long	0x988
	.byte	0x4c
	.uleb128 0x13
	.ascii "indiceIPC\0"
	.byte	0x7
	.byte	0x39
	.byte	0xa
	.long	0x998
	.byte	0x74
	.uleb128 0x13
	.ascii "varMensIPC\0"
	.byte	0x7
	.byte	0x3a
	.byte	0xa
	.long	0x998
	.byte	0x86
	.uleb128 0x13
	.ascii "varAnualIPC\0"
	.byte	0x7
	.byte	0x3b
	.byte	0xa
	.long	0x998
	.byte	0x98
	.uleb128 0x13
	.ascii "region\0"
	.byte	0x7
	.byte	0x3c
	.byte	0xa
	.long	0x968
	.byte	0xaa
	.uleb128 0x13
	.ascii "periodo\0"
	.byte	0x7
	.byte	0x3d
	.byte	0xa
	.long	0x9a8
	.byte	0xb9
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0x978
	.uleb128 0xf
	.long	0x133
	.byte	0xe
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0x988
	.uleb128 0xf
	.long	0x133
	.byte	0x3c
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0x998
	.uleb128 0xf
	.long	0x133
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0x9a8
	.uleb128 0xf
	.long	0x133
	.byte	0x11
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0x9b8
	.uleb128 0xf
	.long	0x133
	.byte	0x1d
	.byte	0
	.uleb128 0x4
	.ascii "IPCDivisiones\0"
	.byte	0x7
	.byte	0x3e
	.byte	0x2
	.long	0x8d6
	.uleb128 0x17
	.ascii "normalizarDescripcionDivisiones\0"
	.byte	0x1
	.byte	0x8d
	.byte	0x5
	.long	0x189
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xa29
	.uleb128 0x18
	.ascii "reg\0"
	.byte	0x1
	.byte	0x8d
	.byte	0x34
	.long	0xa29
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0x8f
	.byte	0xb
	.long	0x49f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9b8
	.uleb128 0x17
	.ascii "convertirFechaDivisiones\0"
	.byte	0x1
	.byte	0x71
	.byte	0x5
	.long	0x189
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xac4
	.uleb128 0x18
	.ascii "reg\0"
	.byte	0x1
	.byte	0x71
	.byte	0x2d
	.long	0xa29
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0x73
	.byte	0xb
	.long	0x49f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii "meses\0"
	.byte	0x1
	.byte	0x75
	.byte	0x18
	.long	0xac4
	.uleb128 0x9
	.byte	0x3
	.quad	meses.5189
	.uleb128 0x19
	.ascii "a\0"
	.byte	0x1
	.byte	0x7b
	.byte	0xa
	.long	0xada
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x19
	.ascii "m\0"
	.byte	0x1
	.byte	0x7c
	.byte	0xa
	.long	0xaea
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.ascii "mes\0"
	.byte	0x1
	.byte	0x7d
	.byte	0x9
	.long	0x189
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xe
	.long	0xad4
	.long	0xad4
	.uleb128 0xf
	.long	0x133
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12e
	.uleb128 0xe
	.long	0x126
	.long	0xaea
	.uleb128 0xf
	.long	0x133
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.long	0x126
	.long	0xafa
	.uleb128 0xf
	.long	0x133
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.ascii "decodificarFechaDivisiones\0"
	.byte	0x1
	.byte	0x61
	.byte	0x5
	.long	0x189
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xb61
	.uleb128 0x18
	.ascii "reg\0"
	.byte	0x1
	.byte	0x61
	.byte	0x2f
	.long	0xa29
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.ascii "decod\0"
	.byte	0x1
	.byte	0x61
	.byte	0x39
	.long	0x4ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0x63
	.byte	0xb
	.long	0x49f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.ascii "parsearYCorregirIPCDivisiones\0"
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.long	0x189
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xc12
	.uleb128 0x18
	.ascii "arch\0"
	.byte	0x1
	.byte	0x9
	.byte	0x29
	.long	0xc12
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.ascii "reg\0"
	.byte	0x1
	.byte	0x9
	.byte	0x35
	.long	0x8c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.ascii "tmp\0"
	.byte	0x1
	.byte	0xb
	.byte	0x14
	.long	0xa29
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii "buffer\0"
	.byte	0x1
	.byte	0xc
	.byte	0x11
	.long	0xc18
	.uleb128 0x9
	.byte	0x3
	.quad	buffer.5174
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0xd
	.byte	0xb
	.long	0x49f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii "decodificador\0"
	.byte	0x1
	.byte	0xe
	.byte	0x10
	.long	0xc29
	.uleb128 0x9
	.byte	0x3
	.quad	decodificador.5176
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7a2
	.uleb128 0xe
	.long	0x126
	.long	0xc29
	.uleb128 0x1b
	.long	0x133
	.word	0x1f3
	.byte	0
	.uleb128 0x1c
	.long	0x189
	.uleb128 0xf
	.long	0x133
	.byte	0x9
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
	.uleb128 0x13
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
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
.LASF0:
	.ascii "refcount\0"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	stringRemove;	.scl	2;	.type	32;	.endef
	.def	stringReplace;	.scl	2;	.type	32;	.endef
	.def	stringRChar;	.scl	2;	.type	32;	.endef
	.def	stringNCopy;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	toUpper;	.scl	2;	.type	32;	.endef
	.def	isAlpha;	.scl	2;	.type	32;	.endef
	.def	toLower;	.scl	2;	.type	32;	.endef
