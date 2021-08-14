.globl ft_strdup

/* char *ft_strdup(const char *s1) */
ft_strdup:

	push	%rdi
	call	ft_strlen

	inc		%rax
	push	%rax
	movq	%rax, %rdi
	call	malloc   /* rax = malloc(len(s1) + 1) */

	testq	%rax, %rax
	je		.malloc_error  /* if rax == NULL goto malloc_error */

	movq	%rax, %rdi
	pop		%rcx
	pop		%rsi
	rep movsb  /* repid strlen(s1) times: *char(rdi++) = *char(rsi++) */

.end:
	ret
.malloc_error:
	addq	$16, %rsp
	ret
