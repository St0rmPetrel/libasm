.PHONY: all fclean clean re rebn test

NAME := libasm.a
SRCS := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SRCS_BONUS := valid_base_bonus.s is_white_space_bonus.s ft_atoi_base.s ft_pow_bonus.s ft_strchr_bonus.s skip_spaces_bonus.s proces_sign_bonus.s ft_list_push_front.s ft_list_size.s
OBJS := $(SRCS:.s=.o)
OBJS_BONUS := $(SRCS_BONUS:.s=.o)

SYSTEM := $(shell uname -s)

FLAGS := -fmacho64
ifeq ($(SYSTEM), Linux)
FLAGS := -felf64
endif

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

%.o: %.s
	nasm $(FLAGS) $^

bonus: all $(OBJS_BONUS)
	@ar rcs $(NAME) $(OBJS_BONUS)

clean:
	rm -f $(OBJS) $(OBJS_BONUS)

fclean: clean
	rm -f $(NAME)

re: fclean all

rebn: re bonus

test: bonus
	@gcc main.c $(NAME) -o test && ./test
	@rm test
