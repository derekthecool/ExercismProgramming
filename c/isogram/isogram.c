#include "isogram.h"
#include <ctype.h>
#include <stdio.h>
#include <string.h>

bool is_isogram(const char phrase[])
{
    if (phrase == NULL)
    {
        return false;
    }
    if (strlen(phrase) == 0)
    {
        return true;
    }

    // Create and init alphabet array
    int alphabet[26];
    for (int i = 0; i < 26; i++)
    {
        alphabet[i] = 0;
    }

    for (size_t i = 0; i < strlen(phrase); i++)
    {
        char letter = tolower(phrase[i]);
        if (letter == ' ' || letter == '-')
        {
            continue;
        }
        char index = letter - 'a';
        alphabet[(int)index]++;
    }
    int repeats = 0;
    for (int i = 0; i < 26; i++)
    {
        fprintf(stderr, "[%d:%c,%d],", i, 'a' + i, alphabet[i]);
        if (alphabet[i] > 1)
        {
            printf("Found a repeat");
            repeats++;
        }
        puts("");
    }
    fprintf(stderr, "Found %d repeats\n", repeats);
    return repeats == 0;
}
