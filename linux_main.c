#include <stdio.h>
#include "libasm_linux.h"
#include <string.h>
#include <stdlib.h>
#include <errno.h>

char    *ft_test(int (*fun)());

int     cmp(int a, int b)
{
    if (a >= b)
        return (1);
    return (0);
}

int main()
{
    char *str;

//    printf("str = %s\n", _ft_strdup("hello world"));
    printf("ptr = %p\n", ft_test(&cmp));
}
