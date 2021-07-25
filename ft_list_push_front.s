					global		_ft_list_push_front
					extern		_malloc
					extern		___error
					section		.text
_ft_list_push_front:
					push		rsi
					push		rdi

					push		rdi
					mov			rdi, 16
					call		_malloc
					pop			rdi
					jc			malloc_error
					pop			rdi
					pop			rsi
					push		rsi
					push		rdi
					mov			qword [rax], rsi
					mov			qword [rax+8], 0
					mov			rsi, rax
ft_lstadd_front:
					push		rdx	;rdi **lst; rsi *new
					cmp			qword [rdi], 0
					je			empty_lst
not_empty_list:
					mov			rdx, qword [rdi] ; what
					mov			qword [rsi+8], rdx
					;
					mov			rax, 10
					;
					jmp			done
empty_lst:
					mov			qword [rsi+8], 0
done:
					xor			rax, rax
					pop			rdx
					pop			rdi
					mov			qword [rdi], rsi
					pop			rsi
					ret
malloc_error:
					mov			rdi, rax
					call		___error
					mov			[rax], rdi
					xor			rax, rax
					pop			rdi
					pop			rsi
					ret
