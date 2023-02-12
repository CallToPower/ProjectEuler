/*
 //  Problem7.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 What is the 10001st prime number?
 => 104743
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TRUE 1
#define FALSE 0
#define MAX_LEN 1000000l
#define NTH_PRIME 10001

int nr_arr[MAX_LEN];

// sieve of eratosthenes
void init_list()
{
    long i, j, curr_nr;
    
    // set array to true
    for(i = 0; i < MAX_LEN; ++i)
    {
        nr_arr[i] = TRUE;
    }
    
    nr_arr[0] = FALSE;
    nr_arr[1] = FALSE;
    
    for(i = 2; i < MAX_LEN; ++i)
    {
        curr_nr = nr_arr[i];
        if((i!=2) && (i%2==0))
        {
            nr_arr[i] = FALSE;
        } else if(curr_nr == TRUE)
        {
            for(j = i + i; j < MAX_LEN; j += i)
            {
                nr_arr[j] = FALSE;
            }
        }
    }
}

void print_solution()
{
    int count;
    long i, curr_nr;
    
    count = 0;
    init_list();
    for(i = 0; (i < MAX_LEN) && (count != NTH_PRIME); ++i)
    {
        curr_nr = nr_arr[i];
        if(curr_nr == TRUE)
        {
            ++count;
            if(count == NTH_PRIME)
            {
                printf("%i. prime number = %ld\n", NTH_PRIME, i);
            }
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
