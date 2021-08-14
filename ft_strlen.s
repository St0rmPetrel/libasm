.globl ft_strlen

ft_strlen:

	xor  %rax, %rax
	movq $0xffffffffffffffff, %rcx

	repne scasb /* rcx-- until *char(rdi++) != *char(rax) */
	notq  %rcx
	dec   %rcx /* two's complement rcx */
	mov   %rcx, %rax

	ret
