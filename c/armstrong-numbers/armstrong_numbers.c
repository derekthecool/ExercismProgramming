#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_armstrong_number(int candidate)
{
    char *number_string = malloc(15);
    sprintf(number_string, "%d", candidate);

    int sum = 0;
    size_t digit_count = strlen(number_string);
    while (*number_string)
    {
        sum += pow(*(number_string++) - '0', digit_count);
    }
    return sum == candidate;
}
