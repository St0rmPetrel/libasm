				global		_ft_pow_bonus

				section		.text

_ft_pow_bonus:	
				cmp			rsi, 0
				jne			L1
				mov			rax, 1
				ret

L1:				
				dec			rsi
				call		_ft_pow_bonus
				imul		rax, rdi			
				ret
