/*
 //  Problem6.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 The sum of the squares of the first ten natural numbers is,
 1^2 + 2^2 + ... + 10^2 = 385
 The square of the sum of the first ten natural numbers is,
 (1 + 2 + ... + 10)^2 = 552 = 3025
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 => 25164150
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define FROM 1
#define TO 100

// sum = (2n+1)(n+1)n/6 if starting from 0 or 1, else Bruteforce
long sum_of_squares()
{
    long i, sum;
    if((FROM != 0) && (FROM != 1))
    {
        sum = 0l;
        for(i = FROM; i <= TO; ++i)
        {
            sum += pow(i, 2);
        }
    } else
    {
        sum = (2 * TO + 1) * (TO + 1) * TO / 6;
    }
    return sum;
}

// sum = n(n+1)/2 if starting from 0 or 1, else Bruteforce
long square_of_sums()
{
    long i, sum;
    if((FROM != 0) && (FROM != 1))
    {
        sum = 0l;
        for(i = FROM; i <= TO; ++i)
        {
            sum += i;
        }
    } else
    {
        sum = TO * (TO + 1) / 2;
    }
    return pow(sum, 2);
}

void print_solution()
{
    long su_sq, sq_su;
    
    su_sq = square_of_sums();
    sq_su = sum_of_squares();
    printf("square of the sum = %ld\nsum of the squares = %ld\ndifference = %ld\n", su_sq, sq_su, su_sq - sq_su);
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
