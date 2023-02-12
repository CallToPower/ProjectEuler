/*
 //  Problem3.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 The prime factors of 13195 are 5, 7, 13 and 29.
 What is the largest prime factor of the number 600851475143 ?
 => 6857
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

void prime_factorization(long x)
{
	long i = 3;
	long f = x; /* remaining product to factor */
    
    /* 2 == only even prime => increase the counter i with 2 every step (see 'else') */
	while ((f % 2) == 0)
    {
		printf("%i ", 2);
		f /= 2;
	}
    
    /*
     - every number n can at most have one prime factor f greater than sqrt(f) (=> upper limit)
     - if factor exceeds this square root => remaining number is prime
     */
	while (i <= (sqrt(f)+1))
    {
		if ((f % i) == 0)
        {
			printf("%ld ", i);
			f /= i;
		}
		else
        {
			i += 2;
        }
	}
    
	if(f > 1)
    {
        printf("%ld ", f);
    }
    printf("\n");
}

void print_solution()
{
    long the_nr;
    
    the_nr = 600851475143l;
    printf("prime factors of %ld: ", the_nr);
    prime_factorization(the_nr);
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
