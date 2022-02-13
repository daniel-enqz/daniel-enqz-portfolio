// Ask user to type credit card ✅
//ALL INPUTS MUST BE ONLY NUMBERS (REJECT "-")✅
//ALL CARDS HAVE CHECKSUM ✅
//AMERICAN EXPRESS (15 DIGITS, START WITH 34 AND 37) ✅
//MASTER CARD (16 DIGITS, START WITH 51, 52, 53, 54, 55) ✅
//VISA (13 - 16 DIGITS, START WITH 4) ✅

#include <cs50.h>
#include <stdio.h>

//Set of varaibles data_types
int x, i, j, index, stored, digits[100], card_type[100];
long card_number, y;

//Here we specify some functions we will further use in the program
int checksum(void);
int card(void);
int invalid(void);

//The main function promts the user for a card number and inmedeately checks if it has between 13 and 16 digits, otherwise, the card is invalid.
//Also it will prompt for another value if the inserted one, has hiphens or other symbol rather than only digits
int main(void)
{
    //Promts for card number
    printf("Please enter your card number");
    card_number = get_long("\n------>");

    //Adds single digits to array
    y = card_number;
    i = 0;
    while (y > 0)
    {
        x = y % 10;
        y = y / 10;
        digits[i] = x;
        i++;
    }

    //Checks lenght, if this condition equals TRUE, it advances to the checksum condition. If FALSE, card number is invalid.
    if (i >= 13 && i <= 16)
    {
        checksum();
    }
    else
    {
        invalid();
    }

    return 0;

}

//Checksum function is one of the most important ones, it does the Hans Peter Luhn formula.
int checksum(void)
{
    //Multiplies every second digit by two, from right to left.
    index = 1;
    for (j = 0; j < i; j++)
    {
        //If the digit multiplied by two equals a number greater than 9, that means it will have two digits.
        //In those cases, we need to add those digits together, before adding them to de array, that's what the next algorith does.
        if (digits[index] < 5)
        {
            digits[index] *= 2;
        }
        else if (digits[index] >= 5)
        {
            digits[index] *= 2;
            y = digits[index];
            stored = 0;
            while (y > 0)
            {
                x = y % 10;
                y = y / 10;
                stored += x;
            }
            digits[index] = stored;
        }
        index += 2;
    }

    //Sums up every digit in the array.
    index = 0;
    stored = 0;
    for (j = 0; j < i; j++)
    {
        stored += digits[index];
        index++;
    }

    //Checks if the residue from the sum of all digits of the array = 0
    stored %= 10;
    if (stored == 0)
    {
        card();
    }
    else
    {
        invalid();
    }
    return 0;

}

//Checks the type of card (VISA, AMEX or MASTER) once the lenght and the Hans Peter Luhn formula = TRUE
int card(void)
{
    y = card_number;
    i = 0;

    //Here is important to note that digits[] array was used for Hans Peter Luhn formula and here, card_type[] array is used to know the type of cards.
    while (y > 0)
    {
        x = y % 10;
        y = y / 10;
        card_type[i] = x;
        i++;
    }

    //Checks both things (starting numbers and lenght)
    if ((card_type[i - 1] == 4) && (i > 12 && i < 17))
    {
        printf("VISA\n");
    }

    else if ((card_type[i - 1] == 3) && (i == 15))
    {
        if (card_type[i - 2] == 4 || card_type[i - 2] == 7)
        {
            printf("AMEX\n");
        }
        else
        {
            invalid();
        }
    }

    else if ((card_type[i - 1] == 5) && (i == 16))
    {
        if (card_type[i - 2] > 0 && card_type[i - 2] < 6)
        {
            printf("MASTERCARD\n");
        }
        else
        {
            invalid();
        }
    }
    else
    {
        invalid();
    }

    return 0;
}

//Function used during the whole program each time an argument equals FALSE.
int invalid(void)
{
    printf("INVALID\n");
    return 0;
}
