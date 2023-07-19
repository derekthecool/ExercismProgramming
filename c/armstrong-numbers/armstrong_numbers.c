#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// I could not get the build to work on windows
// So a used podman run -it --rm -v ${pwd}:/test ubuntu
// # apt update && apt install -y build-essential
// # make

bool is_armstrong_number(int candidate)
{
    int array_size = 10;
    unsigned int *numbers = malloc(sizeof(unsigned int) * array_size);
    if (numbers == NULL)
    {
        fprintf(stderr, "malloc for *numbers failed\n");
        exit(1);
    }

    fprintf(stderr, "Input number: %d\n", candidate);

    int digits = 0;

    int copy = candidate;

    // Extract and print each digit
    do
    {
        int digit = copy % 10;
        numbers[digits++] = digit;
        copy /= 10;
    } while (copy > 0);

    // Resize the array
    numbers = realloc(numbers, digits);

    // Reverse the array
    for (int i = 0, array_length = digits - 1; i < digits && i != array_length; i++, array_length--)
    {
        int temp = numbers[i];
        numbers[i] = numbers[array_length];
        numbers[array_length] = temp;
    }

    // Calculate the squares of each number inplace
    unsigned int total = 0;
    for (int i = 0; i < digits; i++)
    {
        total += pow(numbers[i], digits);
    }

    fprintf(stderr, "calculated: %d, candidate: %d\n\n", total, candidate);

    return total == (unsigned int)candidate;
}
