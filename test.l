%%
[0-9]+ | [0-9]+\.[0-9]+ | \.[0-9]+     { return NUMBER; }
#*                                     { return COMMENT; }
\n                                     { return '\n';}
%%
#include<stdio.h>

main(argc,argv)
int argc;
char *argv[];
{
int val;

while(val=yylex()) printf("value id %d\n",val);
}
