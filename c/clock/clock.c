#include "clock.h"
#include <stdio.h>

// #define MAX_STR_LEN (5 + 1)   // "##:##\0"

// typedef struct {
//    char text[MAX_STR_LEN];
// } clock_t;

clock_t clock_create(int hour, int minute)
{
    fprintf(stderr, "hour = %d, minute = %d\n", hour, minute);
    clock_t output = {.text = {'\0'}};

    return output;
}
clock_t clock_add(clock_t clock, int minute_add)
{
    fprintf(stderr, "clock = %s, minute_add = %d\n", clock.text, minute_add);
    clock_t output = {.text = {'\0'}};

    return output;
}
clock_t clock_subtract(clock_t clock, int minute_subtract)
{
    fprintf(stderr, "clock = %s, minute_add = %d\n", clock.text, minute_subtract);
    clock_t output = {.text = {'\0'}};

    return output;
}
bool clock_is_equal(clock_t a, clock_t b)
{
    fprintf(stderr, "clock a = %s, clock b = %s\n", a.text, b.text);
    bool output = false;

    return output;
}
