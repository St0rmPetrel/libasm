				global			_ft_strdup
				extern			_malloc
				extern			_ft_strlen
				extern			_ft_strcpy
				extern			___error
				section			.text

_ft_strdup:		
				push			rdi
				push			rsi

				push			rdi
				call			_ft_strlen
				mov				rdi, rax
				inc				rdi
				call			_malloc
				jc				return_error
				mov				rdi, rax
				pop				rsi
				call			_ft_strcpy
				jmp				done

return_error:	
				pop				rdi
				push			rdx
				mov				rdx, rax
                call			___error
                mov				[rax], rdx
				pop				rdx
				xor				rax, rax
				ret

done:			
				pop				rsi
				pop				rdi
				ret
