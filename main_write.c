#include <unistd.h>
#include <stdio.h>
#include <errno.h>

ssize_t  ft_write(int  fd,  const void *buf,
       size_t count);

int main()
{
    printf("%ld\n", ft_write(-1, "Hi\n", 3));
    write(-1, "Hi\n", 3);
    printf("%d\n", errno);
}

