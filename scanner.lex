%{
#include <stdio.h>
#include "source.h"
#include "parser.tab.hpp"
#include "hw3_output.hpp"
#include <string>
#include <string.h>
using namespace std;
void error();
%}

%option yylineno
%option noyywrap
digit           ([0-9])
letter          ([a-zA-Z])
whitespace      ([\t\n ])


%%

void            {yylval.str = "VOID"; return VOID;}
int             {yylval.str = "INT"; return INT;}
byte            {yylval.str = "BYTE";return BYTE;}
b               {yylval.str = "B";return B;}
bool            {yylval.str = "BOOL";return BOOL;}
and             {yylval.str = "AND";return AND;}
or              {yylval.str = "OR";return OR;}
not             {yylval.str = "NOT";return NOT;}
true            {yylval.str = "TRUE";return TRUE;}
false           {yylval.str = "FALSE"; return FALSE;}
return          {yylval.str = "RETURN";return RETURN;}
if              {yylval.str = "IF";return IF;}
else            {yylval.str = "ELSE";return ELSE;}
while           {yylval.str = "WHILE";return WHILE;}
break           {yylval.str = "BREAK";return BREAK;}
continue        {yylval.str = "CONTINUE";return CONTINUE;}
";"             {yylval.str = "SC";return SC;}
","             {yylval.str = "COMMA";return COMMA;}
"("             {yylval.str = "LPAREN";return LPAREN;}
")"             {yylval.str = "RPAREN";return RPAREN;}
"{"             {yylval.str = "LBRACE";return LBRACE;}
"}"             {yylval.str = "RBRACE";return RBRACE;}
=               {yylval.str = "ASSIGN";return ASSIGN;}
(<)|>|<=|>=       {yylval.str = strdup(yytext); return RELOP;}
==|!=           {yylval.str = strdup(yytext); return EQUAL;}
[\+\-]   		{yylval.str = strdup(yytext); return PLUS;}
[\*\/]			{yylval.str = strdup(yytext); return MULT;}


\/\/.*          {};
enum										{yylval.str = "ENUM";	return ENUM;}
{letter}({digit}|{letter})*                  {yylval.str = strdup(yytext);   return ID;}
[1-9]{digit}*|0                              {yylval.str = strdup(yytext);   return NUM;}
\"([^\n\r\"\\]|\\[rnt"\\])+\"				{yylval.str = strdup(yytext);    return STRING;}

{whitespace}    ;
.               error();

%%

void error() {
	output::errorLex(yylineno);
	exit(1); 
}



