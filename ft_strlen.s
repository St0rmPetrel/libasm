				global		_ft_strlen

				section		.text
_ft_strlen:		
				push		rdi
                xor         rax, rax
loop:			cmp			byte [rdi], 0
				je			done
				inc			rdi
				inc			rax
				jmp			loop

done:			
				pop			rdi
				ret
