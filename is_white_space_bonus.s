					global		_is_white_space_bonus
					section		.text

_is_white_space_bonus:
					cmp			rdi, 32 ; ' '
					je			is_space
					cmp			rdi, 13 ; 9 - 13 whitesp
					jnle		is_not_space
					cmp			rdi, 9
					jnl			is_space
					jmp			is_not_space
is_space:			
					mov			rax, 1
					ret
is_not_space:			
					mov			rax, 0
					ret
