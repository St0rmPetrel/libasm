				global	_ft_read
				extern	___error
SYS_READ_MAC	equ		0x2000003

				segment .text
_ft_read:		
                mov		rax, SYS_READ_MAC
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
