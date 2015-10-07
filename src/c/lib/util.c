#include <stdio.h>

int average(int *data, int size);
void write(char *name, char *permission, char *body);

int main(void)
{
  int arr[] = {3,5,324,5,12,5,32,21};
  const size = sizeof arr/sizeof(int);
  printf("%d\n", average(arr, size);
}

int average(int *data, int size)
{
  if (data == NULL || size == 0) {
    return 0;
  }
  int i, average = 0;
  for (i = 0; i < size; i++) {
    average += data[i];
  }
  return average / size;
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
