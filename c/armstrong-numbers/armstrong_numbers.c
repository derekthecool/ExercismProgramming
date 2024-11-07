#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_armstrong_number(int candidate)
{
    char number_string[15];
    snprintf(number_string, 15, "%d", candidate);

    int sum = 0, index = 0;
    size_t digit_count = strlen(number_string);
    while (number_string[index])
    {
        sum += pow(number_string[index++] - '0', digit_count);
    }
    return sum == candidate;
}
