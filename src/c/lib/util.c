#include <stdio.h>

int read(char *name, char *permission)
{
    int buf;
    FILE *file;
    file = fopen(name, permission);
    fread(&buf, sizeof(buf), 1, file);
    fclose(file);
    return buf;
}

void write(char *name, char *permission, char *body)
{
    if (name == NULL || permission == NULL || body == NULL) {
        return;
    }
    FILE *file;
    file = fopen(name, permission);
    fprintf(file, body);
    fclose(file);
}

int average(int *data, int size)
{
    if (data == NULL || size == 0) {
        return 0;
    }
    printf("size=%d\n", sizeof data/sizeof(int));
    int i, average = 0;
    for (i = 0; i < size; i++) {
        average += data[i];
    }
    return average / size;
}

int average2(int data[], int size)
{
    int i, average = 0;
    for (i = 0; i < size; i++) {
        average += data[i];
    }
    return average / size;
}

void func(int *pvalue)
{
    printf("pvalue = %p\n", pvalue);
    *pvalue = 100;
    return;
}

void ln(char str[])
{
    printf("%s\n", str);
}
