					global			_ft_strchr_bonus

					section			.text
_ft_strchr_bonus:
					push			rcx
					xor				rcx, rcx
loop:				
					cmp				byte [rdi+rcx], sil
					je				find
					cmp				byte [rdi+rcx], 0
					je				dont_find
					inc				rcx
					jmp				loop
find:				
					mov				rax, rcx
					add				rax, rdi
					pop				rcx
					ret
dont_find:			
					mov				rax, 0
					pop				rcx
					ret
