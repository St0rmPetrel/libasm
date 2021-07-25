				global		_ft_atoi_base

				extern		_ft_strlen
				extern		_ft_pow_bonus
				extern		_ft_strchr_bonus
				extern		_valid_base_bonus
				extern		_skip_spaces_bonus
				extern		_proces_sign_bonus

				section		.text
_ft_atoi_base:
				push		r11
				push		r8
				push		r9
				push		rdx
				push		rcx

				push		rdi
				push		rsi
				mov			r11, 1 ; Sign

				;valid base
				push		rdi
				mov			rdi, rsi
				call		_valid_base_bonus
				cmp			rax, 1
				pop			rdi
				je			error_base

				pop			rsi
				pop			rdi

				;skip white space
				call		_skip_spaces_bonus
				mov			rdi, rax

				;proces sign
				call		_proces_sign_bonus
				mov			rdi, rax
main_part:		
				push		rdi
				push		rsi
				call		_ft_strlen
				mov			r8, rax ; len_nmb
				mov			rdi, rsi
				call		_ft_strlen
				mov			r9, rax ; len_base
				xor			rcx, rcx
				pop			rsi
				pop			rdi
				xor			rax, rax
				push		rax
loop:			
				cmp			byte [rdi+rcx], 0
				je			done
				push		rdi
				push		rsi
				push		r10
				xor			r10, r10
				mov			r10b, byte [rdi+rcx] ; *str
				mov			rdi, rsi
				mov			rsi, r10 
				call		_ft_strchr_bonus ; strchr(base, *str)
				cmp			rax, 0 ; if no such nmb in base (error)
				je			error_no_nmb
				xor			rdx, rdx
				mov			rdx, rax
				pop			r10
				pop			rsi
				pop			rdi
				sub			rdx, rsi ; base_index
				push		rdi
				push		rsi
				mov			rdi, r9
				mov			rsi, r8
				dec			rsi
				sub			rsi, rcx
				call		_ft_pow_bonus
				imul		rdx, rax ; base_index * pow(len_base, (len_nmb - 1 - counter))
				pop			rsi
				pop			rdi
				pop			rax
				add			rax, rdx
				push		rax
				inc			rcx
				jmp			loop

error_base:
				pop			rsi
				pop			rdi
				pop			rcx
				pop			rdx
				pop			r9
				pop			r8
				pop			r11
				mov			rax, 0
				ret


error_no_nmb:
				pop			rsi
				pop			rdi
				pop			rax
				pop			r11
				pop			r9
				pop			r8
				pop			rcx
				pop			rdx
				mov			rax, 0
				ret

done:			
				pop			rax
				imul		rax, r11
				pop			r11
				pop			r9
				pop			r8
				pop			rcx
				pop			rdx
				ret
