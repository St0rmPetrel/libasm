.globl ft_strcpy

ft_strcpy:

	push %rdi

.loop:

	lodsb
	stosb
	testb %al, %al
	jne   .loop

.end:
	pop %rax
	ret


