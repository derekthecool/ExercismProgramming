#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_armstrong_number(int candidate)
{
    char number_string[15];
    snprintf(number_string, 15, "%d", candidate);

    int sum = 0;
    size_t digit_count = strlen(number_string);
    for (size_t i = 0; i < digit_count; i++)
    {
        int digit = number_string[i] - '0';
        sum += pow(digit, digit_count);
    }
    return sum == candidate;
}
