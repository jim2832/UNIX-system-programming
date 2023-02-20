#include <stdio.h>
#include <stdlib.h>
char Rock[]="a";
char Paper[]="b";
char Scissors[]="c";
//char Rock[]="✊",Paper[]="✋",Scissors[]="✌ ";
char *choices[3];
char answer[100];

int choice()
{ while (1)
  { printf("Rock, Paper, or Scissors? [R/P/S]: ");
    scanf("%s",&answer);
    switch (answer[0])
    { case 'R': case 'r': return 0;
      case 'P': case 'p': return 1;
      case 'S': case 's': return 2;
    }
    printf("Input must be either an R, P, or S.\n\n");
  }
}

int main()
{  int u, m, you=0, me=0;
   choices[0]=Rock; choices[1]=Paper; choices[2]=Scissors;
   while(1)
   { u=choice();
     m=(int)(rand()>>4)&3;
     if (m==3) m=(u+1)%3;
     switch(m)
     { case 0: printf("I chose ✊\n"); break;
       case 1: printf("I chose ✋\n"); break;
       case 2: printf("I chose ✌ \n");
     }
     switch(m-u)
     { case 0: printf("Its a tie!\n"); break;
       case 1: case 2: printf("I win!\n"); me++; break;
       default: printf("You win!\n"); you++;
     }
     printf("Your score is now %d to %d. Go again? ",you, me);
     scanf("%s",&answer);
     if ((answer[0]=='N')||(answer[0]=='n'))
     { if (you>=me)
	 printf("No, we can't quit yet. I was about to start winning!\n");
       else
       { printf("Loser! I'm the winner! Woohoo. Too bad for you, loser!\n");
	 break;
       }
     }
     if ((answer[0]=='Y')||(answer[0]=='y')) printf("Great!\n");
     else printf("I'll take that as a 'Yes'.\n");
   }
}
