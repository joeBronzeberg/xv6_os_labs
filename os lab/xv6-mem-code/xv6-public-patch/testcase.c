#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void)
{
  // printf(1, "Hello, world!\n");
  printf(1, "vp: %d\n pp: %d\n", numvp(), numpp());

  exit();
}
