//Promt for sentence
//Count letters(a to z or any uppercase character from A to Z)
//Count words (any sequence of characters separated by spaces should count as a word)
//Count sentences (exclamation point, or question mark indicates the end of a sentence.)
//Output "Grade X" where X is the grade level computed by the Coleman-Liau formula, rounded to the nearest integer.
//If the resulting index number is 16 or higher ("Grade 16+")
//If the index number is less than 1 ( "Before Grade 1")
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

int count_letters(string p);
int count_words(string p);
int count_sentences(string p);
int grade();

float l, w, s;

int main(void)
{
    string p = get_string("Text: ");
    count_letters(p);
    count_words(p);
    count_sentences(p);
    if (grade() >= 16)
    {
        printf("Grade 16+\n");
    }
    else if (grade() < 1)
    {
        printf("Before Grade 1\n");
    }
    else
    {
        printf("Grade %d\n", grade());
    }
}

int count_letters(string p)
{
    int letters = 0;
    for (int i = 0, n = strlen(p); i < n; i++)
    {
        if (isalpha(p[i]))
        {
            letters++;
        }
    }
    l = letters;
    return letters;
}

int count_words(string p)
{
    int words = 1;
    for (int i = 0, n = strlen(p); i < n; i++)
    {
        if (p[i] == 32)
        {
            words++;
        }
    }
    w = words;
    return words;
}

int count_sentences(string p)
{
    int sentences = 0;
    for (int i = 0, n = strlen(p); i < n; i++)
    {
        if (p[i] == 33 || p[i] == 46 || p[i] == 63)
        {
            sentences++;
        }
    }
    s = sentences;
    return sentences;
}

int grade()
{
    float average_l = (100 * l) / w;
    float average_s = (100 * s) / w;
    float final_grade = round((0.0588 * average_l) - (0.296 * average_s) - 15.8);
    return final_grade;
}
