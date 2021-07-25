					global		_valid_base_bonus
					extern		_ft_strlen
					extern		_is_white_space_bonus
					section		.text

_valid_base_bonus:
					push		rdi
					push		rcx
					call		_ft_strlen
					cmp			rax, 2
					jl			base_error
					xor			rcx, rcx
loop:				
					cmp			byte [rdi+rcx], 0
					je			base_okay
					cmp			byte [rdi+rcx], '+'
					je			base_error
					cmp			byte [rdi+rcx], '-'
					je			base_error
					push		rdi
					push		rdx

					mov			rdx, rdi
					xor			rdi, rdi
					mov			dil, byte [rdx+rcx]
					call		_is_white_space_bonus

					pop			rdx
					pop			rdi

					cmp			rax, 1
					je			base_error
					inc			rcx
					jmp			loop

base_okay:
					pop			rcx
					pop			rdi
					mov			rax, 0
					ret

base_error:			
					pop			rcx
					pop			rdi
					mov			rax, 1
					ret
