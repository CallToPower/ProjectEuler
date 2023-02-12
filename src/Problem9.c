/*
 //  Problem9.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/27/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 a^2 + b^2 = c^2
 For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
 => 31875000
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define DEPTH 500l
#define NR 1000l

void print_solution()
{
    long a, b, c, sum, a2, b2, c2, pyt_left, pyt_right;
    for(a = 0; a < DEPTH; ++a)
    {
        a2 = pow(a, 2);
        for(b = a + 1; b < DEPTH; ++b)
        {
            b2 = pow(b, 2);
            pyt_left = a2 + b2;
            for(c = b + 1; c < DEPTH; ++c)
            {
                c2 = pow(c, 2);
                pyt_right = c2;
                sum = a + b + c;
                if((sum == NR) && (pyt_left == pyt_right))
                {
                    printf("%ld + %ld + %ld = %ld, a^2 + b^2 = %ld + %ld = %ld = c^2 = %ld\n", a, b, c, NR, a2, b2, pyt_left, pyt_right);
                    printf("a * b * c = %ld\n", a * b * c);
                    return;
                }
            }
        }
    }
    printf("nothing found with depth %ld\n", DEPTH);
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
