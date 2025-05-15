package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t\r,\n]+

%{
    public Symbol symbol (int type, Object value) {;
        return new Symbol(type, value);
    }

    public Symbol symbol (int type) {;
        return new Symbol(type, null);
    }
%}
%%
{espacio} {/*Ignore*/}
"\n" {return symbol(sym.Linea, yytext());}
"(" {return symbol(sym.Parentesis_a, yytext());}
")" {return symbol(sym.Parentesis_c,yytext());}
";" {return symbol(sym.P_coma, yytext());}
"==" { return symbol(sym.DobleIgual, yytext());}
"if" {return symbol(sym.If, yytext());}
"true" {return symbol(sym.True, yytext());}
"false" {return symbol(sym.False, yytext());}
"<=" {return symbol(sym.Menor_Igual, yytext());}
">=" {return symbol(sym.Mayor_Igual, yytext());}
"<" {return symbol(sym.Menor, yytext());}
">" {return symbol(sym.Mayor, yytext());}
{L}({L}|{D})* {return new Symbol(sym.Identificador, yytext());}
("-"{D}+")"|{D}+) {return symbol(sym.Numero, yytext());}
. {return symbol(sym.ERROR, yytext());}
