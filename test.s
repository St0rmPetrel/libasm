                global      ft_test
                section     .text
ft_test:
                xor rax, rax
                mov rax, ft_test
                add rax, 5
                lea rip, [rax]
                ret
                mov rax, 16
                ret
