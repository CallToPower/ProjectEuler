/*
 //  Problem21.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/28/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 
 For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 
 Evaluate the sum of all the amicable numbers under 10000.
 
 => 31626
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define MAX_NUM 10000

long long arr[MAX_NUM];

long long sum_divisors(long long n)
{
    long long i, cnt;
    
    cnt = 0;
    for (i = 1; i < (n/2 + 1); i++)
    {
        if(n%i==0)
        {
            cnt += i;
        }
    }
    
    return cnt;
}

void print_solution()
{
    long long i, da, db, sum;
    
    printf("Amicable pairs:\n");
    sum = 0;
    for(i = 0; i < MAX_NUM; ++i)
    {
        da = sum_divisors(i);
        db = sum_divisors(da);
        if((i == db) && (i < da))
        {
            sum += i;
            sum += da;
            printf("%lld - %lld\n", i, da);
        }
    }
    printf("\nSum = %lld\n", sum);
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
