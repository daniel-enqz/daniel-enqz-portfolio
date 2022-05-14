#include <stdio.h>
#include <cs50.h>

//n equals number prompt by user
//k equals the number of blank spaces before printing "#"
//l equals the number of "#" printed

int n, k, l;
int main(void)
{
    do
    {
        n = get_int("How tall the pyramid should be?");
    }
    while (n < 1 || n > 8);

    k = n - 1;
    l = 1;

    //First Column of hashes
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < k; j++)
        {
            printf(" ");
        }

        for (int j = 0; j < l; j++)
        {
            printf("#");
        }

        //GAP
        printf("  ");

        //Second column of hashes
        for (int j = 0; j < l; j++)
        {
            printf("#");
        }

        //New line set
        printf("\n");
        l++;
        k--;
    }
}
