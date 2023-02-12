/*
 //  Problem14.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/29/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 The following iterative sequence is defined for the set of positive integers:
 n -> n/2 (n is even)
 n -> 3n+1 (n is odd)
 Using the rule above and starting with 13, we generate the following sequence:
 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
 Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 Which starting number, under one million, produces the longest chain?
 => 837799
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_NR 1000000l

void print_solution()
{
    long i, tmp, cnt, nr, longest;
    
    nr = 0;
    longest = 0;
    for(i = MAX_NR/2+1; i < MAX_NR; ++i)
    {
        tmp = i;
        cnt = 0;
        while(tmp != 1)
        {
            tmp = ((tmp&1)==0) ? (tmp/2) : (3*tmp+1); // faster than tmp = (tmp%2==0) ? (tmp/2) : (3*tmp+1);
            ++cnt;
        }
        if(cnt > longest)
        {
            nr = i;
            longest = cnt;
        }
    }
    printf("Longest chain length < %ld: %ld with %ld", MAX_NR, nr, longest + 1);
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
