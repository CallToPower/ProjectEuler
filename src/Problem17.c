/*
 //  Problem_template.c
 //  Project Euler
 //
 //  Created by Denis Meyer on xX/yY/zZ.
 //  Copyright 20Xx CallToPower Software. All rights reserved.
 */

/*
 Problem
 If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 NOTE: Do not count spaces or hyphens.
 For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
 The use of "and" when writing out numbers is in compliance with British usage.
 => 21124
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define FROM 1
#define TO 1000
#define MAX_STR_LEN 33 /* maximum length of a number in english: 32 if number < 1000 */
#define W_SPECIAL_CHAR FALSE
#define TRUE 1
#define FALSE 0

int in(int nr, int from, int to)
{
    if((nr >= from) && (nr <= to))
    {
        return TRUE;
    }
    return FALSE;
}

void clr(char * str)
{
    str[0] = '\0';
}

/* @param w_special_char TRUE: count ' ', '-', FALSE: don't count */
char* nr_to_str(char *buff, int nr, int w_special_char)
{
    char str[MAX_STR_LEN];
    clr(str);
    
    if(nr==1)
    {
        strcat(buff, "one");
    } else if(nr==2)
    {
        strcat(buff, "two");
    } else if(nr==3)
    {
        strcat(buff, "three");
    } else if(nr==4)
    {
        strcat(buff, "four");
    } else if(nr==5)
    {
        strcat(buff, "five");
    } else if(nr==6)
    {
        strcat(buff, "six");
    } else if(nr==7)
    {
        strcat(buff, "seven");
    } else if(nr==8)
    {
        strcat(buff, "eight");
    } else if(nr==9)
    {
        strcat(buff, "nine");
    } else if(nr==10)
    {
        strcat(buff, "ten");
    } else if(nr==11)
    {
        strcat(buff, "eleven");
    } else if(nr==12)
    {
        strcat(buff, "twelve");
    } else if(nr==13)
    {
        strcat(buff, "thirteen");
    } else if(nr==15)
    {
        strcat(buff, "fifteen");
    } else if(nr==18)
    {
        strcat(buff, "eighteen");
    } else if(nr==20)
    {
        strcat(buff, "twenty");
    } else if(nr==30)
    {
        strcat(buff, "thirty");
    } else if(nr==40)
    {
        strcat(buff, "forty");
    } else if(nr==50)
    {
        strcat(buff, "fifty");
    } else if(nr==80)
    {
        strcat(buff, "eighty");
    } else if(in(nr, 14, 19))
    {
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
        strcat(buff, "teen");
    } else if(in(nr, 21, 29))
    {
        strcat(buff, "twenty");
        if(w_special_char)
        {
            strcat(buff, "-");
        }
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
    } else if(in(nr, 31, 39))
    {
        strcat(buff, "thirty");
        if(w_special_char)
        {
            strcat(buff, "-");
        }
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
    } else if(in(nr, 41, 49))
    {
        strcat(buff, "forty");
        if(w_special_char)
        {
            strcat(buff, "-");
        }
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
    } else if(in(nr, 51, 59))
    {
        strcat(buff, "fifty");
        if(w_special_char)
        {
            strcat(buff, "-");
        }
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
    } else if(in(nr, 81, 89))
    {
        strcat(buff, "eighty");
        if(w_special_char)
        {
            strcat(buff, "-");
        }
        strcat(buff, nr_to_str(str, nr%10, w_special_char));
    } else if(in(nr, 21, 99))
    {
        strcat(buff, nr_to_str(str, nr/10, w_special_char));
        strcat(buff, "ty");
        if(nr%10!=0)
        {
            clr(str);
            if(w_special_char)
            {
                strcat(buff, "-");
            }
            strcat(buff, nr_to_str(str, nr%10, w_special_char));
        }
    } else if(in(nr, 100, 999))
    {
        strcat(buff, nr_to_str(str, nr/100, w_special_char));
        if(w_special_char)
        {
            strcat(buff, " ");
        }
        strcat(buff, "hundred");
        if(nr%100!=0)
        {
            clr(str);
            if(w_special_char)
            {
                strcat(buff, " ");
            }
            strcat(buff, "and");
            if(w_special_char)
            {
                strcat(buff, " ");
            }
            strcat(buff, nr_to_str(str, nr%100, w_special_char));
        }
    } else if(in(nr, 1000, 999999)) /* ATTENTION: numbers > 1000 need a bit other treatment than this! */
    {
        strcat(buff, nr_to_str(str, nr/1000, w_special_char));
        if(w_special_char)
        {
            strcat(buff, " ");
        }
        strcat(buff, "thousand");
        if(nr%1000!=0)
        {
            clr(str);
            if(w_special_char)
            {
                strcat(buff, " ");
            }
            strcat(buff, "and");
            if(w_special_char)
            {
                strcat(buff, " ");
            }
            strcat(buff, nr_to_str(str, nr%1000, w_special_char));
        }
    }
    buff[strlen(buff)] = '\0';
    
    return buff;
}

void print_solution()
{
    int i, sum;
    char buff[MAX_STR_LEN];
    
    sum = 0;
    for(i = FROM; i <= TO; ++i)
    {
        clr(buff);
        nr_to_str(buff, i, W_SPECIAL_CHAR);
        sum += strlen(buff);
    }
    printf("%d", sum);
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
