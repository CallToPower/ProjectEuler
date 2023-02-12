/*
 //  Problem_template.c
 //  Project Euler
 //
 //  Created by Denis Meyer on xX/yY/zZ.
 //  Copyright 20Xx CallToPower Software. All rights reserved.
 */

/*
 Problem
 Description
 => Result
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void print_solution()
{
    
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
