/*
 //  Problem19.c
 //  Project Euler
 //
 //  Created by Denis Meyer on 3/30/11.
 //  Copyright 2011 CallToPower Software. All rights reserved.
 */

/*
 Problem
 You are given the following information, but you may prefer to do some research for yourself.
 - 1 Jan 1900 was a Monday.
 - Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
 - And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
    How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
 => 171
 */

#define START_YEAR 1901
#define END_YEAR 2001

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void print_solution()
{
    int i, year, total_nr_days, total;
    int months[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    total_nr_days=0;
    total=0;
    for(i = 0; i < 12; i++)
    {
        total_nr_days += months[i];
    }
    for(year = START_YEAR; year < END_YEAR; ++year)
    {
        // check for leapyear
        if((year%4==0) && ((year%100==0) || (year%400==0)))
        {
            months[1]=29;
        }
        else
        {
            months[1]=28;
        }
        for(i = 0; i < 12; ++i)
        {
            if(total_nr_days%7==0)
            {
                ++total;
            }
            total_nr_days += months[i];
        }
    }
    printf("Sundays on the first of the month from %d to %d: %d\n", START_YEAR, END_YEAR, total);
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
