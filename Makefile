NAME		=	libasm.a

SRCS		=	ft_strlen.s \
#				ft_strcpy.s \
#				ft_strcmp.s \
#				ft_write.s \
#				ft_read.s \
#				ft_strdup.s

HDR			=	libasm.h

BUILDDIR	=	objs

CC			=	as

OBJS		=	$(addprefix $(BUILDDIR)/, $(SRCS:.s=.o))

.PHONY: all
all: $(NAME)

$(NAME): $(OBJS) $(HDR)
	@ar	rcs	$(NAME)	$(OBJS)

$(OBJS): |$(BUILDDIR) $(SRCS)

$(BUILDDIR):
	@mkdir	$(BUILDDIR)

$(BUILDDIR)/%.o: %.s
	@$(CC)	$^	-o $@

.PHONY: clean
clean:
	@rm -rf $(BUILDDIR)

.PHONY: fclean
fclean: clean
	@rm -f $(NAME)

.PHONY: re
re: fclean all
