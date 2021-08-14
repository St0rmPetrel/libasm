.globl ft_strcmp

ft_strcmp:

	xor		%rax, %rax

.loop:

	cmpsb  /* cmp *char(rdi), *char(rsi) */
	jne		.end
	cmpb	$0, (%rdi)
	je		.endz
	inc		%rdi
	inc		%rsi
	jmp		.loop

.end:
	jg		.endg
	movl	$1, %eax
	ret
.endg:
	movl	$-1, %eax
	ret
.endz:
	movl	$0, %eax
	ret
