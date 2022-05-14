#include <stdio.h>
#include <cs50.h>
#include <math.h>
//Main variables with data type, note that they are all consider floats
float change_owed;
int quarters = 25, dimes = 10, nickels = 5, pennies = 1;

int main(void)
{
    do
    {
        change_owed = get_float("Enter change owed: ");
    }
    while (change_owed < 0);

    //1 dollar = 100 cents
    int cents = round(change_owed * 100);
    int coins = 0;
    int acc = 0;
    int needed = cents - acc;

    //Process to accumulate pennies.
    while (needed >= quarters)
    {
        acc += quarters;
        needed = cents - acc;
        coins++;
    }

    while (needed >= dimes)
    {
        acc += dimes;
        needed = cents - acc;
        coins++;
    }

    while (needed >= nickels)
    {
        acc += nickels;
        needed = cents - acc;
        coins++;
    }

    while (needed >= pennies)
    {
        acc += pennies;
        needed = cents - acc;
        coins++;
    }

    printf("%i\n", coins);

}
