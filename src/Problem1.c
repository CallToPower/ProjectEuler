/*
 //  Problem1.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 Find the sum of all the multiples of 3 or 5 below 1000.
 => 233168
 */

#include <stdio.h>
#include <time.h>

#define LIM 1000l

long get_sum()
{
    int i;
    long sum;
    
    sum = 0;
    for(i = 0; i < LIM; ++i)
    {
        if((i%3==0) || (i%5==0))
        {
            sum += i;
        }
    }
    return sum;
}

void print_solution()
{
    printf("sum of all the multiples of 3 or 5 below %ld: %ld\n", LIM, get_sum());
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
