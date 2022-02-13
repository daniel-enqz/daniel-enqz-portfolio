//IF NOT SINGLE LINE ARGUMENT, A NON NEGATIVE INTERGER (K) = ERROR
//IF CHARACTERS NON DECIMAL, PRINT "Usage: ./ceasar key" = ERROR
//OUTPUT (plaintext:)
//OUTPUT (ciphertext:) Return 0
//CAPS REMAIN CAPS && NON ALPHABETICAL CHARACTERS ARE UNCHANGED
#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, string k[])
{
    if (argc == 2)
    {
        for (int j = 0, n = strlen(k[1]); j < n; j++)
        {
            if (k[1][j] < 48 || k[1][j] > 57)
            {
                printf("Usage: ./caesar key");
                return 1;
            }
        }

        string ptxt = get_string("plaintext: ");
        for (int i = 0, n = strlen(ptxt); i < n; i++)
        {
            if (islower(ptxt[i]))
            {
                ptxt[i] = toupper(ptxt[i]);
                int pi = ptxt[i] - 65;
                int ci = (pi + atoi(k[1])) % 26;
                ptxt[i] = 65 + ci;
                ptxt[i] = tolower(ptxt[i]);
            }
            else if (isupper(ptxt[i]))
            {
                int pi = ptxt[i] - 65;
                int ci = (pi + atoi(k[1])) % 26;
                ptxt[i] = 65 + ci;
            }
        }
        printf("ciphertext: %s\n", ptxt);
        return 0;
    }
    printf("Please insert only one positive interger");
    return 1;
}
