# A-mini-python-compiler
A mini python compiler designed using Lex and Yacc
### The following are the steps to be followed.
* install lex using the command: sudo apt-get install lex
* install yacc using the command: sudo apt-get install bison
* lex lexer.l
* yacc lexer.y
* gcc y.tab.c -ll -ly
* ./a.out [filename]

#### Update 1: On executing the command ' ./a.out [filename] ' we will be able to know whether our code is syntactically correct or not.
#### Future enhancements:
* Symbol Table
* Intermediate Code Generation
* Target language code

#### Note: The name of the lex file and yacc file should be same



                          
