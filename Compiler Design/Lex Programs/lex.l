%{
#include <stdio.h>
%}

%%

int|float|return|if|else { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
. ;

%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }