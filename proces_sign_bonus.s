				global		_proces_sign_bonus
				extern		_is_white_space_bonus
				section		.text

_proces_sign_bonus:
				push		rcx
				xor			rcx, rcx
				mov			r11, 1
loop:
				cmp			byte [rdi+rcx], '+'
				je			next
				cmp			byte [rdi+rcx], '-'
				je			negativ
				jmp			done
next:			
				inc			rcx
				jmp			loop
negativ:		
				imul		r11, -1
				jmp			next	
				
done:
				mov			rax, rdi
				add			rax, rcx
				pop			rcx
				ret
