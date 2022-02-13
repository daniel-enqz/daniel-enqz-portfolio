//PROGRAM MUST ACCEPT A SINGLE LINE ARGUMENT (CASE-INSENSITIVE)
//IF MORE THAN ONE ARGUMENT = ERROR MESSAGE && RETURN 1 TO MAIN
//IF LESS OR MORE THAN 26 CHARACTERS = ERROR
//NON ALPHABETICAL CHARACTERS = ERROR
//NOT CONTAINING EACH LETTER EXACTLY ONCE = ERROR
//INPUT = GET_STRING FOR PLAINTEXT
//OUTPUT = CIPHERTEXT (PRESERVE-CASE = CAPS REMAIN CAPS) (UNCHANGED SYMBOLS)
//IF EVEREYTHING OK = RETURN 0 TO MAIN
#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int main(int argc, string argv[])
{
    int index = 0;
    if (argc == 2 && strlen(argv[1]) == 26)
    {
        for (int i = 0, n = strlen(argv[1]); i < n; i++)
        {
            argv[1][i] = toupper(argv[1][i]);
            if ((argv[1][i] < 65 || argv[1][i] > 90))
            {
                printf("Only alphabetical characters admitted");
                return 1;
            }

            for (int j = i + 1; j < n; j++)
            {
                if (argv[1][i] == argv[1][j])
                {
                    printf("Please enter each alphabetical letter at only once");
                    return 1;
                }
            }
        }

        string plaintext = get_string("Plaintext: ");
        for (int i = 0, n = strlen(plaintext); i < n; i++)
        {
            if (plaintext[i] >= 97 && plaintext[i] <= 122)
            {
                index = plaintext[i] - 97;
                plaintext[i] = tolower(argv[1][index]);
            }
            else if (plaintext[i] >= 65 && plaintext[i] <= 90)
            {
                index = plaintext[i] - 65;
                plaintext[i] = argv[1][index];
            }
        }
        printf("ciphertext: %s\n", plaintext);
        return 0;
    }
    printf("Please insert only one 26 alphabetical characters argument");
    return 1;

}
