digit [0-9]
alpha [a-zA-Z]

%%

[\t]   				 {return(TAB);}
[\n]				 { yylineno = yylineno + 1;}
{digit}+			 {return(NUM);}
{alpha}({alpha}|{digit})*	 {return ID;}
def    				 {return(DEF);}
if    				 {return(IF);}
elif  				 {return(ELIF);}
else  				 {return(ELSE);}
for   			 	 {return(FOR);}
while 				 {return(WHILE);}
in    				 {return(IN);}
xrange			 	 {return(RANGE);}
print				 {return(PRINT);}
"=="    			 {return(EQ);}
"<="    			 {return(LE);}
"!="    			 {return(NE);}
">"				 {return(GT);}
">="    			 {return(GE);}
"<"     			 {return(LT);}
#.*       			 ;
.       			 {return yytext[0];}
%%
