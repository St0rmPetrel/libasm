				global			ft_strdup_linux
				extern			malloc
				extern			_ft_strlen
				extern			_ft_strcpy
				extern			__errno_location
				section			.text

ft_strdup_linux:		
				call			_ft_strlen
                push            rdi
				mov				rdi, rax
				inc				rdi
				call			malloc
                pop             rdi
				cmp				rax, 0
                je              return_error
                push            rsi
                mov             rsi, rdi
                push            rdi
				mov				rdi, rax
				call			_ft_strcpy
                pop             rdi
                pop             rsi
				jmp				done
return_error:	
                call			__errno_location
                mov				DWORD [rax], 12
				xor				rax, rax
				ret
done:			
				ret
