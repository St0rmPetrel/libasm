.globl ft_strcpy

ft_strcpy:

	push %rdi

.loop:

	lodsb  /* Load (rsi) -> al */
	stosb  /* Wrirt al -> (rdi) */
	testb %al, %al
	jne   .loop

.end:
	pop %rax
	ret


