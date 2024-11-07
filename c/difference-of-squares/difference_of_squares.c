#include "difference_of_squares.h"
#include "test-framework/unity_internals.h"

unsigned int sum_of_squares(unsigned int number)
{
    unsigned int result = 0;
    for (unsigned int i = 1; i <= number; i++)
    {
        printf("%s result: %u\n", "sum_of_squares", result);
        result += i * i;
    }
    return result;
}

unsigned int square_of_sum(unsigned int number)
{
    unsigned int result = 0;
    for (unsigned int i = 1; i <= number; i++)
    {
        printf("%s result: %u\n", "square_of_sum", result);
        result += i;
    }
    return result * result;
}

unsigned int difference_of_squares(unsigned int number)
{
    return square_of_sum(number) - sum_of_squares(number);
}
