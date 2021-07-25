				global		_ft_strcpy

				section		.text
_ft_strcpy:		
                push        rdx
				push		rcx
				xor			rcx, rcx
                xor         rdx, rdx

loop:			
				cmp			byte [rsi+rcx], 0
				je			done
				mov			dl, byte [rsi+rcx]
				mov			byte [rdi+rcx], dl
				inc			rcx
				jmp			loop

done:			
				mov			rax, rdi
				mov			byte [rdi+rcx],	0
				pop			rcx
                pop         rdx
				ret
