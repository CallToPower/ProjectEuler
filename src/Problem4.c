/*
 //  Problem4.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
 Find the largest palindrome made from the product of two 3-digit numbers.
 => 906609 = 913 * 993
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TRUE 1
#define FALSE 0
#define MAX_LEN 20
#define FROM 100
#define TO 999

int n1, n2;

int is_palindrom(int nr)
{
    int b, pos, str_size;
    char buffer[MAX_LEN];
    
    str_size = sprintf(buffer, "%i", nr); /* int to string */
    
    b = TRUE;
    if(str_size < 2)
    {
        b = FALSE;
    } else if(str_size == 2)
    {
        if(buffer[0] != buffer[1])
        {
            b = FALSE;
        }
    } else
    {
        pos = 0;
        while(b && (pos < ((str_size / 2) + 1)))
        {
            if(buffer[pos] != buffer[str_size - 1 - pos])
            {
                b = FALSE;
            }
            ++pos;
        }
    }
    
    return b;
}

int highest_palindrom()
{
    int i, j, highest = -1;
    
    for(i = FROM; i < TO; ++i)
    {
        for(j = FROM; j < TO; ++j)
        {
            int pal = i * j;
            if(is_palindrom(pal))
            {
                if(pal > highest)
                {
                    n1 = i;
                    n2 = j;
                    highest = pal;
                }
                // printf("%i\n", pal);
            }
        }
    }
    return highest;
}

void print_solution()
{
    int result;
    
    result = highest_palindrom();
    if(result != -1)
    {
        printf("highest found palindrom in [%i, %i]: %i = %i * %i\n", FROM, TO, result, n1, n2);
    } else
    {
        printf("no palindrom(es) found in [%i, %i]\n", FROM, TO);
    }
}

int main (int argc, const char * argv[])
{    
    double start, end;
    start = clock();
    print_solution();
    end = clock();
    printf("\nprogram execution time: %fs\n\n", (((double) (end - start)) / CLOCKS_PER_SEC));
    return 0;
}
