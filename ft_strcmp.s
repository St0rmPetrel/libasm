				global      _ft_strcmp

				section		.text

_ft_strcmp:
                push        rcx
                push        rdx
                xor			rax, rax
                xor			rcx, rcx
				xor			rdx, rdx
loop:
                cmp			byte [rdi+rcx], 0
				je			done
				cmp			byte [rdi+rcx], 0
				je			done
				mov			dl, byte [rsi+rcx]
				cmp			byte [rdi+rcx], dl
				jne			done
				inc			rcx
				jmp			loop
done:
				mov			al, byte [rdi+rcx]
				mov			dl, byte [rsi+rcx]
                sub			eax, edx
                pop         rdx
                pop         rcx
				ret
