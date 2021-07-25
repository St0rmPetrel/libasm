					global		_ft_list_sort
					extern		_ft_list_size
					section		.text
_swap:
					push		rdi
					push		rsi
					push		rdx
					push		r8
					mov			rdx, qword [rdi]
					mov			r8, qword [rsi]
					mov			qword [rdi], r8
					mov			qword [rsi], rdx
_swap_done:
					pop			r8
					pop			rdx
					pop			rsi
					pop			rdi
					ret
_ft_list_sort:
					cmp			rdi, 0
					je			error_input
					cmp			rsi, 0
					je			error_input
					push		rdi
					push		rsi
					push		rcx
					push		r8

					mov			r8, rsi
					push		rdi
					mov			rdi, qword [rdi]
					call		_ft_list_size
					mov			rcx, rax
					pop			rdi
					mov			rdi, qword [rdi]
					mov			rsi, qword [rdi+8]
					cmp			rsi, 0
					je			done
loop:
					cmp			rcx, 0
					je			done
					dec			rcx
					push		rsi
					push		rdi
;
inner_loop:
					push		rdi
					push		rsi
					mov			rdi, qword [rdi]
					mov			rsi, qword [rsi]
					call		r8
					pop			rsi
					pop			rdi
					cmp			rax, 0
					jl			go_next
					call		_swap
go_next:
					; rdi -> rsi; rsi -> rsi + 1
					mov			rdi, qword [rdi+8]
					mov			rsi, qword [rsi+8]
					cmp			rsi, 0
					jne			inner_loop
;
					pop			rdi	
					pop			rsi	
					jmp			loop
done:
					pop			r8
					pop			rcx
					pop			rsi
					pop			rdi
					xor			rax, rax
error_input:
					ret
