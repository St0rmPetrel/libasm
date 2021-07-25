				global		_skip_spaces_bonus
				extern		_is_white_space_bonus
				section		.text

_skip_spaces_bonus:
				push		rcx
				xor			rcx, rcx
loop:
				push        rdi
				push        rdx
                mov         rdx, rdi
                xor         rdi, rdi
                mov         dil, byte [rdx+rcx]
                call        _is_white_space_bonus
                pop         rdx
                pop         rdi
				cmp			rax, 1
				jne			give_ret
				inc			rcx
				jmp			loop

give_ret:
				mov			rax, rdi	
				add			rax, rcx
				pop			rcx
				ret
