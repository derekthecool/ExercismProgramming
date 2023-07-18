#include "armstrong_numbers.h"
#include <stdio.h>

// I could not get the build to work on windows
// So a used podman run -it --rm -v ${pwd}:/test ubuntu
// # apt update && apt install -y build-essential
// # make

bool is_armstrong_number(int candidate)
{
     return candidate == 0;
}
