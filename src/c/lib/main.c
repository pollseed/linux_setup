#include <stdio.h>
#include "util.h"

int main(void)
{
    ln("hello, world");
    int *p,i,value=10, ave, array[] = {1,4,2,4,4}, buf;
    const array_size = sizeof array/sizeof(int);
    p = &i;
    *p = 10;
    printf("p = %p\n", p);
    printf("*p = %p\n", *p);
    printf("i = %p\n", i);
    printf("&i = %p\n", &i);
    printf("&value = %p\n", &value);
    func(&value);
    printf("value = %d\n", value);
    ave = average(array, array_size);
    ave = average(NULL, array_size);
    printf("%d\n", ave);
    write("text.txt", "w", "hewwo, world");
    buf = read("text.txt", "rb");
    printf("%d\n", buf);
    return 0;
}
