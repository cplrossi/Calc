/* scanner specification for simple desk calculator */

/* the generated parser will belong to package ast */
package ast;

/* the terminals are implicitily defined in the parser */
import ast.CalcParser.Terminals;

%%

/* define the signature for the generated scanner */
%public
%final
%class CalcScanner
%extends beaver.Scanner

/* the interface between the scanner and the parser is the nextToken() method */
%type beaver.Symbol
%function nextToken
%yylexthrow beaver.Scanner.Exception

/* store line and column information in the tokens */
%line
%column

/* this code will be inlined in the body of the generated scanner class */
%{
	private beaver.Symbol sym(short id) {
		return new beaver.Symbol(
			id, yyline + 1, yycolumn + 1, yylength(), yytext());
	}
%}

WhiteSpace = [ ] | \t | \f | \n | \r | \r\n
Value = [0-9]+

%%

/* discard whitespace information */
{WhiteSpace} { }

/* token definitions */
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

/* error fallback */
[^]		{ throw new Error("Illegal character <"
			+ yytext() + ">"); }

