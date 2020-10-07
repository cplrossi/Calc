/* Scanner specification for simple desk calculator */

/* The generated parser will belong to package ast */
package ast;

/* The terminals are implicitily defined in the parser */
import ast.CalcParser.Terminals;

%%

/* Define the signature for the generated scanner */
%public
%final
%class CalcScanner
%extends beaver.Scanner

/* The interface between the scanner and the parser is the nextToken() method */
%type beaver.Symbol
%function nextToken
%yylexthrow beaver.Scanner.Exception

/* Store line and column information in the tokens */
%line
%column

/* This code will be inlined in the body of the generated scanner class */
%{
	private beaver.Symbol sym(short id) {
		return new beaver.Symbol(
			id, yyline + 1, yycolumn + 1, yylength(), yytext());
	}
%}

WhiteSpace = [ ] | \t | \f | \n | \r | \r\n
Value = [0-9]+

%%

/* Discard whitespace information */
{WhiteSpace} { }

/* Token definitions */
"+"		{ return sym(Terminals.PLUS); }
"-"		{ return sym(Terminals.MINUS); }
"*"		{ return sym(Terminals.TIMES); }
"/"		{ return sym(Terminals.DIV); }
"%"		{ return sym(Terminals.MOD); }
"="		{ return sym(Terminals.RES); }
"("		{ return sym(Terminals.ROUNDO); }
")"		{ return sym(Terminals.ROUNDC); }
{Value}		{ return sym(Terminals.VALUE); }
<<EOF>>		{ return sym(Terminals.EOF); }

/* Error fallback */
[^]		{ }

