#include "x86_arch.h"
.text	
.p2align	4

.globl	_rc4_md5_enc

_rc4_md5_enc:
	cmpq	$0,%r9
	je	L$abort
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	subq	$40,%rsp
L$body:
	movq	%rcx,%r11
	movq	%r9,%r12
	movq	%rsi,%r13
	movq	%rdx,%r14
	movq	%r8,%r15
	xorq	%rbp,%rbp
	xorq	%rcx,%rcx

	leaq	8(%rdi),%rdi
	movb	-8(%rdi),%bpl
	movb	-4(%rdi),%cl

	incb	%bpl
	subq	%r13,%r14
	movl	(%rdi,%rbp,4),%eax
	addb	%al,%cl
	leaq	(%rdi,%rbp,4),%rsi
	shlq	$6,%r12
	addq	%r15,%r12
	movq	%r12,16(%rsp)

	movq	%r11,24(%rsp)
	movl	0(%r11),%r8d
	movl	4(%r11),%r9d
	movl	8(%r11),%r10d
	movl	12(%r11),%r11d
	jmp	L$oop

.p2align	4
L$oop:
	movl	%r8d,0(%rsp)
	movl	%r9d,4(%rsp)
	movl	%r10d,8(%rsp)
	movl	%r11d,%r12d
	movl	%r11d,12(%rsp)
	pxor	%xmm0,%xmm0
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	0(%r15),%r8d
	addb	%dl,%al
	movl	4(%rsi),%ebx
	addl	$3614090360,%r8d
	xorl	%r11d,%r12d
	movzbl	%al,%eax
	movl	%edx,0(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$7,%r8d
	movl	%r10d,%r12d
	movd	(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	pxor	%xmm1,%xmm1
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	4(%r15),%r11d
	addb	%dl,%bl
	movl	8(%rsi),%eax
	addl	$3905402710,%r11d
	xorl	%r10d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,4(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$12,%r11d
	movl	%r9d,%r12d
	movd	(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	8(%r15),%r10d
	addb	%dl,%al
	movl	12(%rsi),%ebx
	addl	$606105819,%r10d
	xorl	%r9d,%r12d
	movzbl	%al,%eax
	movl	%edx,8(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$17,%r10d
	movl	%r8d,%r12d
	pinsrw	$1,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	12(%r15),%r9d
	addb	%dl,%bl
	movl	16(%rsi),%eax
	addl	$3250441966,%r9d
	xorl	%r8d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,12(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$22,%r9d
	movl	%r11d,%r12d
	pinsrw	$1,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	16(%r15),%r8d
	addb	%dl,%al
	movl	20(%rsi),%ebx
	addl	$4118548399,%r8d
	xorl	%r11d,%r12d
	movzbl	%al,%eax
	movl	%edx,16(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$7,%r8d
	movl	%r10d,%r12d
	pinsrw	$2,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	20(%r15),%r11d
	addb	%dl,%bl
	movl	24(%rsi),%eax
	addl	$1200080426,%r11d
	xorl	%r10d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,20(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$12,%r11d
	movl	%r9d,%r12d
	pinsrw	$2,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	24(%r15),%r10d
	addb	%dl,%al
	movl	28(%rsi),%ebx
	addl	$2821735955,%r10d
	xorl	%r9d,%r12d
	movzbl	%al,%eax
	movl	%edx,24(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$17,%r10d
	movl	%r8d,%r12d
	pinsrw	$3,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	28(%r15),%r9d
	addb	%dl,%bl
	movl	32(%rsi),%eax
	addl	$4249261313,%r9d
	xorl	%r8d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,28(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$22,%r9d
	movl	%r11d,%r12d
	pinsrw	$3,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	32(%r15),%r8d
	addb	%dl,%al
	movl	36(%rsi),%ebx
	addl	$1770035416,%r8d
	xorl	%r11d,%r12d
	movzbl	%al,%eax
	movl	%edx,32(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$7,%r8d
	movl	%r10d,%r12d
	pinsrw	$4,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	36(%r15),%r11d
	addb	%dl,%bl
	movl	40(%rsi),%eax
	addl	$2336552879,%r11d
	xorl	%r10d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,36(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$12,%r11d
	movl	%r9d,%r12d
	pinsrw	$4,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	40(%r15),%r10d
	addb	%dl,%al
	movl	44(%rsi),%ebx
	addl	$4294925233,%r10d
	xorl	%r9d,%r12d
	movzbl	%al,%eax
	movl	%edx,40(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$17,%r10d
	movl	%r8d,%r12d
	pinsrw	$5,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	44(%r15),%r9d
	addb	%dl,%bl
	movl	48(%rsi),%eax
	addl	$2304563134,%r9d
	xorl	%r8d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,44(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$22,%r9d
	movl	%r11d,%r12d
	pinsrw	$5,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	48(%r15),%r8d
	addb	%dl,%al
	movl	52(%rsi),%ebx
	addl	$1804603682,%r8d
	xorl	%r11d,%r12d
	movzbl	%al,%eax
	movl	%edx,48(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$7,%r8d
	movl	%r10d,%r12d
	pinsrw	$6,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	52(%r15),%r11d
	addb	%dl,%bl
	movl	56(%rsi),%eax
	addl	$4254626195,%r11d
	xorl	%r10d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,52(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$12,%r11d
	movl	%r9d,%r12d
	pinsrw	$6,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	56(%r15),%r10d
	addb	%dl,%al
	movl	60(%rsi),%ebx
	addl	$2792965006,%r10d
	xorl	%r9d,%r12d
	movzbl	%al,%eax
	movl	%edx,56(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$17,%r10d
	movl	%r8d,%r12d
	pinsrw	$7,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movdqu	(%r13),%xmm2
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	60(%r15),%r9d
	addb	%dl,%bl
	movl	64(%rsi),%eax
	addl	$1236535329,%r9d
	xorl	%r8d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,60(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$22,%r9d
	movl	%r10d,%r12d
	pinsrw	$7,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	psllq	$8,%xmm1
	pxor	%xmm0,%xmm2
	pxor	%xmm1,%xmm2
	pxor	%xmm0,%xmm0
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	4(%r15),%r8d
	addb	%dl,%al
	movl	68(%rsi),%ebx
	addl	$4129170786,%r8d
	xorl	%r10d,%r12d
	movzbl	%al,%eax
	movl	%edx,64(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$5,%r8d
	movl	%r9d,%r12d
	movd	(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	pxor	%xmm1,%xmm1
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	24(%r15),%r11d
	addb	%dl,%bl
	movl	72(%rsi),%eax
	addl	$3225465664,%r11d
	xorl	%r9d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,68(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$9,%r11d
	movl	%r8d,%r12d
	movd	(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	44(%r15),%r10d
	addb	%dl,%al
	movl	76(%rsi),%ebx
	addl	$643717713,%r10d
	xorl	%r8d,%r12d
	movzbl	%al,%eax
	movl	%edx,72(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$14,%r10d
	movl	%r11d,%r12d
	pinsrw	$1,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	0(%r15),%r9d
	addb	%dl,%bl
	movl	80(%rsi),%eax
	addl	$3921069994,%r9d
	xorl	%r11d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,76(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$20,%r9d
	movl	%r10d,%r12d
	pinsrw	$1,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	20(%r15),%r8d
	addb	%dl,%al
	movl	84(%rsi),%ebx
	addl	$3593408605,%r8d
	xorl	%r10d,%r12d
	movzbl	%al,%eax
	movl	%edx,80(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$5,%r8d
	movl	%r9d,%r12d
	pinsrw	$2,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	40(%r15),%r11d
	addb	%dl,%bl
	movl	88(%rsi),%eax
	addl	$38016083,%r11d
	xorl	%r9d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,84(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$9,%r11d
	movl	%r8d,%r12d
	pinsrw	$2,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	60(%r15),%r10d
	addb	%dl,%al
	movl	92(%rsi),%ebx
	addl	$3634488961,%r10d
	xorl	%r8d,%r12d
	movzbl	%al,%eax
	movl	%edx,88(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$14,%r10d
	movl	%r11d,%r12d
	pinsrw	$3,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	16(%r15),%r9d
	addb	%dl,%bl
	movl	96(%rsi),%eax
	addl	$3889429448,%r9d
	xorl	%r11d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,92(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$20,%r9d
	movl	%r10d,%r12d
	pinsrw	$3,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	36(%r15),%r8d
	addb	%dl,%al
	movl	100(%rsi),%ebx
	addl	$568446438,%r8d
	xorl	%r10d,%r12d
	movzbl	%al,%eax
	movl	%edx,96(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$5,%r8d
	movl	%r9d,%r12d
	pinsrw	$4,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	56(%r15),%r11d
	addb	%dl,%bl
	movl	104(%rsi),%eax
	addl	$3275163606,%r11d
	xorl	%r9d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,100(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$9,%r11d
	movl	%r8d,%r12d
	pinsrw	$4,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	12(%r15),%r10d
	addb	%dl,%al
	movl	108(%rsi),%ebx
	addl	$4107603335,%r10d
	xorl	%r8d,%r12d
	movzbl	%al,%eax
	movl	%edx,104(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$14,%r10d
	movl	%r11d,%r12d
	pinsrw	$5,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	32(%r15),%r9d
	addb	%dl,%bl
	movl	112(%rsi),%eax
	addl	$1163531501,%r9d
	xorl	%r11d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,108(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$20,%r9d
	movl	%r10d,%r12d
	pinsrw	$5,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r11d,%r12d
	addl	52(%r15),%r8d
	addb	%dl,%al
	movl	116(%rsi),%ebx
	addl	$2850285829,%r8d
	xorl	%r10d,%r12d
	movzbl	%al,%eax
	movl	%edx,112(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$5,%r8d
	movl	%r9d,%r12d
	pinsrw	$6,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r10d,%r12d
	addl	8(%r15),%r11d
	addb	%dl,%bl
	movl	120(%rsi),%eax
	addl	$4243563512,%r11d
	xorl	%r9d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,116(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$9,%r11d
	movl	%r8d,%r12d
	pinsrw	$6,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	andl	%r9d,%r12d
	addl	28(%r15),%r10d
	addb	%dl,%al
	movl	124(%rsi),%ebx
	addl	$1735328473,%r10d
	xorl	%r8d,%r12d
	movzbl	%al,%eax
	movl	%edx,120(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$14,%r10d
	movl	%r11d,%r12d
	pinsrw	$7,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movdqu	16(%r13),%xmm3
	addb	$32,%bpl
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	andl	%r8d,%r12d
	addl	48(%r15),%r9d
	addb	%dl,%bl
	movl	0(%rdi,%rbp,4),%eax
	addl	$2368359562,%r9d
	xorl	%r11d,%r12d
	movzbl	%bl,%ebx
	movl	%edx,124(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$20,%r9d
	movl	%r11d,%r12d
	pinsrw	$7,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movq	%rcx,%rsi
	xorq	%rcx,%rcx
	movb	%sil,%cl
	leaq	(%rdi,%rbp,4),%rsi
	psllq	$8,%xmm1
	pxor	%xmm0,%xmm3
	pxor	%xmm1,%xmm3
	pxor	%xmm0,%xmm0
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r9d,%r12d
	addl	20(%r15),%r8d
	addb	%dl,%al
	movl	4(%rsi),%ebx
	addl	$4294588738,%r8d
	movzbl	%al,%eax
	addl	%r12d,%r8d
	movl	%edx,0(%rsi)
	addb	%bl,%cl
	roll	$4,%r8d
	movl	%r10d,%r12d
	movd	(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	pxor	%xmm1,%xmm1
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r8d,%r12d
	addl	32(%r15),%r11d
	addb	%dl,%bl
	movl	8(%rsi),%eax
	addl	$2272392833,%r11d
	movzbl	%bl,%ebx
	addl	%r12d,%r11d
	movl	%edx,4(%rsi)
	addb	%al,%cl
	roll	$11,%r11d
	movl	%r9d,%r12d
	movd	(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r11d,%r12d
	addl	44(%r15),%r10d
	addb	%dl,%al
	movl	12(%rsi),%ebx
	addl	$1839030562,%r10d
	movzbl	%al,%eax
	addl	%r12d,%r10d
	movl	%edx,8(%rsi)
	addb	%bl,%cl
	roll	$16,%r10d
	movl	%r8d,%r12d
	pinsrw	$1,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r10d,%r12d
	addl	56(%r15),%r9d
	addb	%dl,%bl
	movl	16(%rsi),%eax
	addl	$4259657740,%r9d
	movzbl	%bl,%ebx
	addl	%r12d,%r9d
	movl	%edx,12(%rsi)
	addb	%al,%cl
	roll	$23,%r9d
	movl	%r11d,%r12d
	pinsrw	$1,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r9d,%r12d
	addl	4(%r15),%r8d
	addb	%dl,%al
	movl	20(%rsi),%ebx
	addl	$2763975236,%r8d
	movzbl	%al,%eax
	addl	%r12d,%r8d
	movl	%edx,16(%rsi)
	addb	%bl,%cl
	roll	$4,%r8d
	movl	%r10d,%r12d
	pinsrw	$2,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r8d,%r12d
	addl	16(%r15),%r11d
	addb	%dl,%bl
	movl	24(%rsi),%eax
	addl	$1272893353,%r11d
	movzbl	%bl,%ebx
	addl	%r12d,%r11d
	movl	%edx,20(%rsi)
	addb	%al,%cl
	roll	$11,%r11d
	movl	%r9d,%r12d
	pinsrw	$2,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r11d,%r12d
	addl	28(%r15),%r10d
	addb	%dl,%al
	movl	28(%rsi),%ebx
	addl	$4139469664,%r10d
	movzbl	%al,%eax
	addl	%r12d,%r10d
	movl	%edx,24(%rsi)
	addb	%bl,%cl
	roll	$16,%r10d
	movl	%r8d,%r12d
	pinsrw	$3,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r10d,%r12d
	addl	40(%r15),%r9d
	addb	%dl,%bl
	movl	32(%rsi),%eax
	addl	$3200236656,%r9d
	movzbl	%bl,%ebx
	addl	%r12d,%r9d
	movl	%edx,28(%rsi)
	addb	%al,%cl
	roll	$23,%r9d
	movl	%r11d,%r12d
	pinsrw	$3,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r9d,%r12d
	addl	52(%r15),%r8d
	addb	%dl,%al
	movl	36(%rsi),%ebx
	addl	$681279174,%r8d
	movzbl	%al,%eax
	addl	%r12d,%r8d
	movl	%edx,32(%rsi)
	addb	%bl,%cl
	roll	$4,%r8d
	movl	%r10d,%r12d
	pinsrw	$4,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r8d,%r12d
	addl	0(%r15),%r11d
	addb	%dl,%bl
	movl	40(%rsi),%eax
	addl	$3936430074,%r11d
	movzbl	%bl,%ebx
	addl	%r12d,%r11d
	movl	%edx,36(%rsi)
	addb	%al,%cl
	roll	$11,%r11d
	movl	%r9d,%r12d
	pinsrw	$4,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r11d,%r12d
	addl	12(%r15),%r10d
	addb	%dl,%al
	movl	44(%rsi),%ebx
	addl	$3572445317,%r10d
	movzbl	%al,%eax
	addl	%r12d,%r10d
	movl	%edx,40(%rsi)
	addb	%bl,%cl
	roll	$16,%r10d
	movl	%r8d,%r12d
	pinsrw	$5,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r10d,%r12d
	addl	24(%r15),%r9d
	addb	%dl,%bl
	movl	48(%rsi),%eax
	addl	$76029189,%r9d
	movzbl	%bl,%ebx
	addl	%r12d,%r9d
	movl	%edx,44(%rsi)
	addb	%al,%cl
	roll	$23,%r9d
	movl	%r11d,%r12d
	pinsrw	$5,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r9d,%r12d
	addl	36(%r15),%r8d
	addb	%dl,%al
	movl	52(%rsi),%ebx
	addl	$3654602809,%r8d
	movzbl	%al,%eax
	addl	%r12d,%r8d
	movl	%edx,48(%rsi)
	addb	%bl,%cl
	roll	$4,%r8d
	movl	%r10d,%r12d
	pinsrw	$6,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r8d,%r12d
	addl	48(%r15),%r11d
	addb	%dl,%bl
	movl	56(%rsi),%eax
	addl	$3873151461,%r11d
	movzbl	%bl,%ebx
	addl	%r12d,%r11d
	movl	%edx,52(%rsi)
	addb	%al,%cl
	roll	$11,%r11d
	movl	%r9d,%r12d
	pinsrw	$6,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	xorl	%r11d,%r12d
	addl	60(%r15),%r10d
	addb	%dl,%al
	movl	60(%rsi),%ebx
	addl	$530742520,%r10d
	movzbl	%al,%eax
	addl	%r12d,%r10d
	movl	%edx,56(%rsi)
	addb	%bl,%cl
	roll	$16,%r10d
	movl	%r8d,%r12d
	pinsrw	$7,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movdqu	32(%r13),%xmm4
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	xorl	%r10d,%r12d
	addl	8(%r15),%r9d
	addb	%dl,%bl
	movl	64(%rsi),%eax
	addl	$3299628645,%r9d
	movzbl	%bl,%ebx
	addl	%r12d,%r9d
	movl	%edx,60(%rsi)
	addb	%al,%cl
	roll	$23,%r9d
	movl	$-1,%r12d
	pinsrw	$7,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	psllq	$8,%xmm1
	pxor	%xmm0,%xmm4
	pxor	%xmm1,%xmm4
	pxor	%xmm0,%xmm0
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r9d,%r12d
	addl	0(%r15),%r8d
	addb	%dl,%al
	movl	68(%rsi),%ebx
	addl	$4096336452,%r8d
	movzbl	%al,%eax
	xorl	%r10d,%r12d
	movl	%edx,64(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$6,%r8d
	movl	$-1,%r12d
	movd	(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	pxor	%xmm1,%xmm1
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r8d,%r12d
	addl	28(%r15),%r11d
	addb	%dl,%bl
	movl	72(%rsi),%eax
	addl	$1126891415,%r11d
	movzbl	%bl,%ebx
	xorl	%r9d,%r12d
	movl	%edx,68(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$10,%r11d
	movl	$-1,%r12d
	movd	(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r11d,%r12d
	addl	56(%r15),%r10d
	addb	%dl,%al
	movl	76(%rsi),%ebx
	addl	$2878612391,%r10d
	movzbl	%al,%eax
	xorl	%r8d,%r12d
	movl	%edx,72(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$15,%r10d
	movl	$-1,%r12d
	pinsrw	$1,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r10d,%r12d
	addl	20(%r15),%r9d
	addb	%dl,%bl
	movl	80(%rsi),%eax
	addl	$4237533241,%r9d
	movzbl	%bl,%ebx
	xorl	%r11d,%r12d
	movl	%edx,76(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$21,%r9d
	movl	$-1,%r12d
	pinsrw	$1,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r9d,%r12d
	addl	48(%r15),%r8d
	addb	%dl,%al
	movl	84(%rsi),%ebx
	addl	$1700485571,%r8d
	movzbl	%al,%eax
	xorl	%r10d,%r12d
	movl	%edx,80(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$6,%r8d
	movl	$-1,%r12d
	pinsrw	$2,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r8d,%r12d
	addl	12(%r15),%r11d
	addb	%dl,%bl
	movl	88(%rsi),%eax
	addl	$2399980690,%r11d
	movzbl	%bl,%ebx
	xorl	%r9d,%r12d
	movl	%edx,84(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$10,%r11d
	movl	$-1,%r12d
	pinsrw	$2,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r11d,%r12d
	addl	40(%r15),%r10d
	addb	%dl,%al
	movl	92(%rsi),%ebx
	addl	$4293915773,%r10d
	movzbl	%al,%eax
	xorl	%r8d,%r12d
	movl	%edx,88(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$15,%r10d
	movl	$-1,%r12d
	pinsrw	$3,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r10d,%r12d
	addl	4(%r15),%r9d
	addb	%dl,%bl
	movl	96(%rsi),%eax
	addl	$2240044497,%r9d
	movzbl	%bl,%ebx
	xorl	%r11d,%r12d
	movl	%edx,92(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$21,%r9d
	movl	$-1,%r12d
	pinsrw	$3,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r9d,%r12d
	addl	32(%r15),%r8d
	addb	%dl,%al
	movl	100(%rsi),%ebx
	addl	$1873313359,%r8d
	movzbl	%al,%eax
	xorl	%r10d,%r12d
	movl	%edx,96(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$6,%r8d
	movl	$-1,%r12d
	pinsrw	$4,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r8d,%r12d
	addl	60(%r15),%r11d
	addb	%dl,%bl
	movl	104(%rsi),%eax
	addl	$4264355552,%r11d
	movzbl	%bl,%ebx
	xorl	%r9d,%r12d
	movl	%edx,100(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$10,%r11d
	movl	$-1,%r12d
	pinsrw	$4,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r11d,%r12d
	addl	24(%r15),%r10d
	addb	%dl,%al
	movl	108(%rsi),%ebx
	addl	$2734768916,%r10d
	movzbl	%al,%eax
	xorl	%r8d,%r12d
	movl	%edx,104(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$15,%r10d
	movl	$-1,%r12d
	pinsrw	$5,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r10d,%r12d
	addl	52(%r15),%r9d
	addb	%dl,%bl
	movl	112(%rsi),%eax
	addl	$1309151649,%r9d
	movzbl	%bl,%ebx
	xorl	%r11d,%r12d
	movl	%edx,108(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$21,%r9d
	movl	$-1,%r12d
	pinsrw	$5,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r11d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r9d,%r12d
	addl	16(%r15),%r8d
	addb	%dl,%al
	movl	116(%rsi),%ebx
	addl	$4149444226,%r8d
	movzbl	%al,%eax
	xorl	%r10d,%r12d
	movl	%edx,112(%rsi)
	addl	%r12d,%r8d
	addb	%bl,%cl
	roll	$6,%r8d
	movl	$-1,%r12d
	pinsrw	$6,(%rdi,%rax,4),%xmm0

	addl	%r9d,%r8d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r10d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r8d,%r12d
	addl	44(%r15),%r11d
	addb	%dl,%bl
	movl	120(%rsi),%eax
	addl	$3174756917,%r11d
	movzbl	%bl,%ebx
	xorl	%r9d,%r12d
	movl	%edx,116(%rsi)
	addl	%r12d,%r11d
	addb	%al,%cl
	roll	$10,%r11d
	movl	$-1,%r12d
	pinsrw	$6,(%rdi,%rbx,4),%xmm1

	addl	%r8d,%r11d
	movl	(%rdi,%rcx,4),%edx
	xorl	%r9d,%r12d
	movl	%eax,(%rdi,%rcx,4)
	orl	%r11d,%r12d
	addl	8(%r15),%r10d
	addb	%dl,%al
	movl	124(%rsi),%ebx
	addl	$718787259,%r10d
	movzbl	%al,%eax
	xorl	%r8d,%r12d
	movl	%edx,120(%rsi)
	addl	%r12d,%r10d
	addb	%bl,%cl
	roll	$15,%r10d
	movl	$-1,%r12d
	pinsrw	$7,(%rdi,%rax,4),%xmm0

	addl	%r11d,%r10d
	movdqu	48(%r13),%xmm5
	addb	$32,%bpl
	movl	(%rdi,%rcx,4),%edx
	xorl	%r8d,%r12d
	movl	%ebx,(%rdi,%rcx,4)
	orl	%r10d,%r12d
	addl	36(%r15),%r9d
	addb	%dl,%bl
	movl	0(%rdi,%rbp,4),%eax
	addl	$3951481745,%r9d
	movzbl	%bl,%ebx
	xorl	%r11d,%r12d
	movl	%edx,124(%rsi)
	addl	%r12d,%r9d
	addb	%al,%cl
	roll	$21,%r9d
	movl	$-1,%r12d
	pinsrw	$7,(%rdi,%rbx,4),%xmm1

	addl	%r10d,%r9d
	movq	%rbp,%rsi
	xorq	%rbp,%rbp
	movb	%sil,%bpl
	movq	%rcx,%rsi
	xorq	%rcx,%rcx
	movb	%sil,%cl
	leaq	(%rdi,%rbp,4),%rsi
	psllq	$8,%xmm1
	pxor	%xmm0,%xmm5
	pxor	%xmm1,%xmm5
	addl	0(%rsp),%r8d
	addl	4(%rsp),%r9d
	addl	8(%rsp),%r10d
	addl	12(%rsp),%r11d

	movdqu	%xmm2,(%r14,%r13,1)
	movdqu	%xmm3,16(%r14,%r13,1)
	movdqu	%xmm4,32(%r14,%r13,1)
	movdqu	%xmm5,48(%r14,%r13,1)
	leaq	64(%r15),%r15
	leaq	64(%r13),%r13
	cmpq	16(%rsp),%r15
	jb	L$oop

	movq	24(%rsp),%r12
	subb	%al,%cl
	movl	%r8d,0(%r12)
	movl	%r9d,4(%r12)
	movl	%r10d,8(%r12)
	movl	%r11d,12(%r12)
	subb	$1,%bpl
	movl	%ebp,-8(%rdi)
	movl	%ecx,-4(%rdi)

	movq	40(%rsp),%r15
	movq	48(%rsp),%r14
	movq	56(%rsp),%r13
	movq	64(%rsp),%r12
	movq	72(%rsp),%rbp
	movq	80(%rsp),%rbx
	leaq	88(%rsp),%rsp
L$epilogue:
L$abort:
	retq

