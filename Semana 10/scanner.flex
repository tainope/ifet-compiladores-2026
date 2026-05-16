import java_cup.runtime.Symbol;

%%

%class Scanner
%cupsym sym
%cup
%unicode
%line
%column
%public


// Definições de macros (ajuste conforme o seu ex03.flex ou ex04.flex)
digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+
opRelacional = ">"|"<"|">="|"<="|"=="|"!="

Ident = {letra}({letra}|{digito})*

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]

%%

{digitos} {
	double aux = Double.parseDouble(yytext());
	return new Symbol(sym.NUMBER, Double.valueOf(aux));
}

"if" { return new Symbol(sym.KW_IF);}

"else" { return new Symbol(sym.KW_ELSE);}

"program" { return new Symbol(sym.KW_PROGRAM);}

{opRelacional} {
		String opRelacional = yytext();
		return new Symbol(sym.OP_RELACIONAL, opRelacional); // Modifiquei para OP_RELACIONAL, não op_Relacional_symbol
	}
"+" { return new Symbol(sym.MAIS);	}
"-" { return new Symbol(sym.MENOS);}
"/" { return new Symbol(sym.DIV);}
"*" { return new Symbol(sym.MULT);}
"%" { return new Symbol(sym.MOD);} // Mantenha se ainda usa MOD, mas a gramática acima não usa
";" { return new Symbol(sym.PTVIRG);}
"(" { return new Symbol(sym.ABRE_PARENT);}
")" { return new Symbol(sym.FECHA_PARENT);}
"{" { return new Symbol(sym.ABRE_CHAVE);}
"}" { return new Symbol(sym.FECHA_CHAVE);}
"[" { return new Symbol(sym.ABRE_COLCH);}
"]" { return new Symbol(sym.FECHA_COLCH);}
"." { return new Symbol(sym.PTO);}
"," { return new Symbol(sym.VIRG);}
"=" { return new Symbol(sym.IGUAL);}

{Ident} { return new Symbol(sym.IDENT,yytext());} 

{espaco} { /* despreza */ }

[^] { /* Caractere inválido */ 		
	return new Symbol(sym.EOF, yyline, yycolumn, yytext());		
}