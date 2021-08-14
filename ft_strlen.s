.globl ft_strlen

ft_strlen:

	xor %rax, %rax

.loop:

	cmpb $0, (%rdi,%rax)
	je .end
	inc %rax
	jmp	.loop

.end:
	ret
