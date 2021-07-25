					global		_ft_list_size
					section		.text
_ft_list_size:		
					push		rdi
					xor			rax, rax
					cmp			rdi, 0
					je			done
loop:
					add			rax, 1
					cmp			qword [rdi+8], 0
					je			done
					mov			rdi, qword [rdi+8]
					jmp			loop
done:
					pop			rdi
					ret
