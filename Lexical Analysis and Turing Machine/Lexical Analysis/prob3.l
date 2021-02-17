/*  flex  file for lexical analyser for some simple string expressions.
    Graham Farr, Monash University
    Initially, copied from the Wikipedia page for  lex, then modified.
    Created:  13 July 2017
    Last updated:  13 September 2018
*/
    
/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>
#include <string.h>
void yyerror(char *);
/*
#include "y.tab.h"
*/
%}


%%
    /*** Rules section ***/

            /* yytext is a string containing the matched text. */

    /* Strings are all lower case  */
[a-z]+  {
            printf("Token: STRING;  Lexeme: %s\n", yytext);
/*
            yylval.str = strdup(yytext);
            return  STRING;
*/
        }

[0-9]+  {
        printf("Token: DIGITS;  Lexeme: %s\n", yytext);
/*
        yylval.str = strdup(yytext);
        return  DIGITS;
*/
        }



Reverse {
        printf("Token: REVERSE;  Lexeme: %s\n", yytext);
/*
        yylval.str = strdup(yytext);
        return  REVERSE;
*/
        }


(Vigenere)|(Vigener)|(Vigene)|(Vigen)|(Vige)|(Vig)|(Vi)|(V)  {
        printf("Token: VIGENERE;  Lexeme: %s\n", yytext);
/*
        yylval.str = strdup(yytext);
        return  VIGENERE;
*/
        }


(Simplesub)|(Simplesu)|(Simples)|(Simple)|(Simpl)|(Simp)|(Sim)|(Si)|(S)  {
        printf("Token: SIMPLESUB;  Lexeme: %s\n", yytext);
/*
        yylval.str = strdup(yytext);
        return  SIMPLESUB;
*/
        }

(Loctran)|(Loctra)|(Loctr)|(Loct)|(Loc)|(Lo)|(L)  {
        printf("Token: LOCTRAN;  Lexeme: %s\n", yytext);
/*
        yylval.str = strdup(yytext);
        return  LOCTRAN;
*/
        }




[#()-<>=+*/;{}.]   {
            printf("Token and Lexeme: %s\n", yytext);
/*
            return  *yytext;
*/
        }

\n      {
            printf("Token and Lexeme: <newline>\n");
/*
            return  *yytext;
*/
        }

[ \t]   {    }     /*  skip whitespace  */

.       {
           printf("Invalid character.\n");
/*
           yyerror("invalid character");
*/
        }
     /*  will match any single character that does not match
         any of the above patterns
     */


%%
    /*** C Code section ***/

void yyerror(char *s) {
      fprintf(stderr, "line %d: yytext = %s.  Error msg: %s.\n", yylineno, yytext, s);
}


int yywrap(void) {
   return 1;
}


/*  comment out the function  main()  if using  lex  with  yacc   */
int main(void) {
    yylex();
    return 0;
}
