/*
 //  Problem5.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 => 232792560
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TRUE 1
#define FALSE 0
#define MAX_NR 1000000000l
#define FROM 1
#define TO 20

int dividable_by(long nr)
{
    int i;
    for(i = FROM; i < TO; ++i)
    {
        if(!(nr%i==0))
        {
            return FALSE;
        }
    }
    return TRUE;
}

// Bruteforce => slow!
void print_solution()
{
    long i;
    for(i = 1l; i < MAX_NR; ++i)
    {
        if(dividable_by(i))
        {
            printf("%ld is the smallest positive number that can be divided by each of the numbers in [%i, %i]\n", i, FROM, TO);
            break;
        }
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
