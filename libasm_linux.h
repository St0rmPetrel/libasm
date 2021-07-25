#ifndef LIBASM_H
#define LIBASM_H

#include <errno.h>

int			_ft_strlen(char *str);
char		*_ft_strcpy(char *dst, const char *src);
int			_ft_strcmp(const char *s1, const char *s2);
ssize_t		_ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t		_ft_read(int fildes, void *buf, size_t nbyte);
char		*_ft_strdup(const char *s1);
char		*ft_strdup_linux(const char *s1);

#endif
