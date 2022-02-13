#include <cs50.h>
#include <stdio.h>

int initial_size, end_size, births, deaths, n;

int main(void)
{
    // TODO: Prompt for start size
    do
    {
        initial_size = get_int("Initial population Size: ");
    }
    while (initial_size < 9);

    // TODO: Prompt for end size
    do
    {
        end_size = get_int("End population Size: ");
    }
    while (end_size < initial_size);

    // TODO: Calculate number of years until we reach threshold
    n = 0;

    while (initial_size < end_size)
    {
        births = initial_size / 3;
        deaths = initial_size / 4;
        initial_size = initial_size + births - deaths;
        n ++;
    }

    // TODO: Print number of years
    printf("Years: %i\n", n);
}

/* RUN CODE = clang population.c -o population -lcs50 */
