/*
 //  Problem10.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 Find the sum of all the primes below two million.
 => 142913828922
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TRUE 1
#define FALSE 0
#define MAX_LEN 2000000l

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
    long count;
    long i, curr_nr;
    
    count = 0;
    init_list();
    for(i = 0; i < MAX_LEN; ++i)
    {
        curr_nr = nr_arr[i];
        if(curr_nr == TRUE)
        {
            count += i;
        }
    }
    printf("sum of the primes below %ld: %ld\n", MAX_LEN, count);
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
