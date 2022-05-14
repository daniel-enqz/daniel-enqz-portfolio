#include <stdio.h>
#include <cs50.h>

string name;

int main(void)
{
    name = get_string("Hey, what's your name?");
    printf("Hello, %s\n", name);
}
