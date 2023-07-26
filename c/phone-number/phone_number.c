#include "phone_number.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *phone_number_clean(const char *input)
{
    fprintf(stderr, "input = %s\n", input);

    static const int size = 10;
    char *output = malloc(size * sizeof(char));
    if (output == NULL)
    {
        fprintf(stderr, "malloc for *output failed\n");
        exit(1);
    }

    for (int i = 0; i < size; i++)
    {
        output[i] = '0';
    }

    int inputDigitCount = 0;
    char cleanedInput[12] = {'\0'};
    puts("Digits found: ");
    for (size_t i = 0; i < strlen(input); i++)
    {
        char letter = input[i];
        if (isdigit(letter))
        {
            fprintf(stderr, "%c,", letter);
            cleanedInput[inputDigitCount++] = letter;
        }
    }
    puts("");

    size_t cleanLength = strlen(cleanedInput);

    if (cleanLength < 10)
    {
        fprintf(stderr, "Error: input phone number digits are too few, need 10 minimum\n");
        return output;
    }
    else if (cleanLength == 11)
    {
        if (cleanedInput[0] != '1')
        {
            fprintf(stderr, "Error: 11 length must start with 1\n");
            return output;
        }
        if (cleanedInput[1] == '1' || cleanedInput[1] == '0')
        {
            fprintf(stderr, "Error: 11 length phone can't have a area code != 1\n");
            return output;
        }
        if (cleanedInput[4] == '0')
        {
            fprintf(stderr, "Error: 11 length phone can't an exchange code of 0\n");
            return output;
        }
        // Shift array left to overwrite first number
        for (size_t i = 1; i < 12; i++)
        {
            cleanedInput[i - 1] = cleanedInput[i];
        }
    }
    else if (cleanLength > 11)
    {
        fprintf(stderr, "Error: length is bad\n");
        return output;
    }

    if (cleanedInput[0] == '1' || cleanedInput[0] == '0')
    {
        fprintf(stderr, "Error: 10 length must not have area code of 1 or 0\n");
        return output;
    }
    if (cleanedInput[1] == '1' || cleanedInput[1] == '0')
    {
        fprintf(stderr, "Error: 10 length phone can't have a area code != 1\n");
        return output;
    }
    if (cleanedInput[3] == '0' || cleanedInput[3] == '1')
    {
        fprintf(stderr, "Error: 10 length can't have exchange code of 0 or 1\n");
        return output;
    }

    // strcpy(cleanedInput, "");
    for (size_t i = 0; i < strlen(cleanedInput); i++)
    {
        output[i] = cleanedInput[i];
    }

    fprintf(stderr, "inputDigitCount = %d\n", inputDigitCount);
    fprintf(stderr, "cleanInput = %s\n", cleanedInput);
    fprintf(stderr, "input:  %s\noutput: %s\n", input, output);

    return output;
}
