/*
 //  Problem26.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 4/3/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
 1/2	= 	0.5
 1/3	= 	0.(3)
 1/4	= 	0.25
 1/5	= 	0.2
 1/6	= 	0.1(6)
 1/7	= 	0.(142857)
 1/8	= 	0.125
 1/9	= 	0.(1)
 1/10	= 	0.1
 Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
 Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 => 983
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void print_solution()
{
    int n, i, len, maxlen, maxn;
    
    maxlen = 0;
    for(n=2; n<=1000; n++)
    {
        int rest = 1;
        int r0;
        for(i=0; i<n; i++)
        {
            rest = (rest*10)%n;
        }
        r0 = rest;
        len = 0;
        do {
            rest = (rest*10)%n;
            len++;
        } while(rest!=r0);
        if(len>maxlen)
        {
            maxn = n;
            maxlen = len;
        }
    }
    printf("value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part: %d\n", maxn);
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
