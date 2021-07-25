				global	_ft_write
				extern	___error
SYS_WRITE_MAC	equ		0x2000004

				segment .text

_ft_write:		mov		rax, SYS_WRITE_MAC
				syscall
				jc		return_error
				jmp		done
return_error:
                push    rdx
				mov		rdx, rax
				call	___error
				mov		[rax], rdx
				mov		rax, -1
                pop     rdx
done:
				ret
