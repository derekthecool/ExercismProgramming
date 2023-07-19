#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(int *a, int *b);
void swap(int *a, int *b)
{
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

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
        printf("malloc for *numbers failed\n");
        exit(1);
    }

    printf("Input number: %d\n", candidate);

    int digit_count = 0;

    int copy = candidate;

    // Extract and print each digit
    do
    {
        int digit = copy % 10;
        numbers[digit_count++] = digit;
        printf("%d - \n", digit);
        copy /= 10;
    } while (copy > 0);

    printf("Initial numbers: ");
    for (int i = 0; i < digit_count; i++)
    {
        printf("[%d]", numbers[i]);
    }
    puts("");

    int array_length = digit_count - 1;
    for (int i = 0; i < digit_count; i++)
    {
        if (i == array_length)
        {
            break;
        }
        int temp = numbers[i];
        numbers[i] = numbers[array_length];
        numbers[array_length] = temp;
        array_length--;
    }

    numbers = realloc(numbers, digit_count);
    printf("Calculated numbers: ");
    for (int i = 0; i < digit_count; i++)
    {
        numbers[i] = pow(numbers[i], digit_count);
        printf("[%d:%d]",i, numbers[i]);
    }
    puts("");


    unsigned int total = 0;
    for(int i = 0; i < digit_count; i++)
    {
        total += numbers[i];
    }

    printf("calculated: %d, candidate: %d\n\n", total, candidate);

    bool output = total == (unsigned int)candidate ? true : false;

    return output;
}
