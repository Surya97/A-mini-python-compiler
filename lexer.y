%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>

	extern FILE *fp;

%}


%token FOR WHILE
%token IF IN RANGE ELIF ELSE PRINT
%token DEF TAB
%token NUM ID

%right '='
%left AND OR
%left '<' '>' LE GE EQ NE LT GT
%%

start:	Function
	| Declaration
	;

Declaration: Assignment
	| FunctionCall
	| ArrayUsage
	| error
	;

Assignment: ID '=' Assignment
	| ID '=' FunctionCall
	| ID '=' ArrayUsage
	| ArrayUsage '=' Assignment
	| ID ',' Assignment
	| NUM ',' Assignment
	| ID '+' Assignment
	| ID '-' Assignment
	| ID '*' Assignment
	| ID '/' Assignment
	| NUM '+' Assignment
	| NUM '-' Assignment
	| NUM '*' Assignment
	| NUM '/' Assignment
	| '(' Assignment ')'
	| '-' '(' Assignment ')'
	| '-' NUM
	| '-' ID
	| NUM
	| ID
	;

FunctionCall: ID'('')'
	| ID'('Assignment')'
	;

ArrayUsage: ID'['Assignment']'
	;

Function: DEF ID '(' ArgListOpt ')' CompoundSt
	;

ArgListOpt: ArgList
	|
	;

ArgList: ArgList ',' Arg
	| Arg
	;

Arg: 	ID
	;

CompoundSt: TAB StmtList
	;

StmtList: StmtList Stmt
	|
	;

Stmt: 	WhileStmt
	| Declaration
	| ForStmt
	| IfStmt
	| PrintFunc
	;

WhileStmt: WHILE '(' Expr ')' Stmt
	| WHILE '(' Expr ')' CompoundSt
	;

ForStmt: FOR ID IN RANGE '(' Expr ')' Stmt
	| FOR ID IN RANGE '(' Expr ')' CompoundSt
	;

IfStmt: IF '(' Expr ')'
		Stmt
	;

PrintFunc: PRINT '(' ID ')' 
	;

Expr:
	| Expr LE Expr
	| Expr GE Expr
	| Expr NE Expr
	| Expr GT Expr
	| Expr LT Expr
	| Expr EQ Expr
	| Assignment
	| ArrayUsage
	;
%%
#include"lex.yy.c"
#include<ctype.h>
int count=0;

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	if(yyparse()==1)
		printf("\nParsing failed\n");
	   else
		printf("\nParsing completed successfully\n");
	   fclose(yyin);
	return 0;
}

yyerror(char *s){
	printf("%d: %s %s\n", yylineno, s, yytext );
}
