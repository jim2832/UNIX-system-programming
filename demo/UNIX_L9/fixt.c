#include <stdio.h>
int c;
/* This is a test program.
   The C / *..* / operator
   does not allow nesting.*/
int main()
{   scanf("%d",&c);
    /* This runs for
       values of c > 0*/
    if (c>0)
    {   printf("Yes\n"); 
        while (c>0) /*still works*/
        {   printf("%d\n",c--);
}   }   }
