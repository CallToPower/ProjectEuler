/*
 //  Problem24.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/30/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 A permutation is an ordered arrangement of objects.
 For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
 If all of the permutations are listed numerically or alphabetically, we call it lexicographic order.
 The lexicographic permutations of 0, 1 and 2 are:
 012   021   102   120   201   210
 What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 
 => 2783915460
 */

#include <algorithm>
#include <iostream>
#include <string>

void print_solution()
{
    std::string x = "0123456789";
    for(int i = 1; i < 1e6; ++i)
    {
        std::next_permutation(x.begin(), x.end());
    }
    std::cout << x << std::endl;
}

int main() {
    double start, end;
    start = clock();
    print_solution();
    end = clock();
    printf("\nprogram execution time: %fs\n\n", (((double) (end - start)) / CLOCKS_PER_SEC));
    return 0;
}
