package scanner;
import java_cup.runtime.Symbol;
import parser.sym;
import java.nio.charset.StandardCharsets;
import erros.ListaErros;

%%

%class Scanner
%cup
%unicode   // permite usar caracteres unicode
%line      // permite usar yyline
%column    // permite usar yycolumn
%public

%eofval{
    return new Symbol(sym.EOF);	
%eofval}

// código inserido na classe
%{ 
	//atributo
	private ListaErros listaErros; 
    
	public Scanner(java.io.FileReader in, ListaErros listaErros) {
		this(in);
		this.listaErros = listaErros;
	}
	
	public ListaErros getListaErros() {
		return listaErros; 
	}

    public void defineErro(int linha, int coluna, String texto) {
        listaErros.defineErro(linha, coluna, texto);
    }

    public void defineErro(int linha, int coluna) {
        listaErros.defineErro(linha, coluna);
    }

    public void defineErro(String texto) {
        listaErros.defineErro(texto);
    }

	private Symbol criaSimbolo(int code, Object value) {
        System.out.println("TKN [" + yytext() + "] = " + value);
		return new Symbol(code, yyline, yycolumn, value);
	}
	
	private Symbol criaSimbolo(int code) {		
        System.out.println("TKN [" + yytext() + "]");
		return new Symbol(code, yyline, yycolumn, null);
	}

%}


KW_PROGRAM  = "program"
KW_FINAL    = "final"
KW_CLASS    = "class"
KW_IF       = "if"
KW_ELSE     = "else"
KW_WHILE    = "while"
KW_READ     = "read"
KW_PRINT    = "print"
KW_RETURN   = "return"
KW_VOID     = "void"
KW_NEW      = "new"

ABREPAR     = "("
FECHAPAR    = ")"
ABRECHAVE   = "{"
FECHACHAVE  = "}"
ABRECOL     = "["
FECHACOL    = "]"

MAIS        = "+"
MENOS       = "-"
VEZES       = "*"
DIV         = "/"
MOD         = "%"
IGUALIGUAL  = "=="
DIF         = "!="
MAIOR       = ">"
MENOR       = "<"
MAIORIGUAL  = ">="
MENORIGUAL  = "<="

IGUAL       = "="
PTO         = "."
PTVIRG      = ";"
VIRG        = ","

UNDERLINE   = "_"
LETRA       = [a-zA-Z]
DIGITO      = [0-9]
IDENT       = ({LETRA} | {UNDERLINE}) ({LETRA} | {DIGITO} | {UNDERLINE})*
IDENT_ERR   = {DIGITO}+ ({LETRA} | {DIGITO} | {UNDERLINE})*
INTEIRO     = {DIGITO}*
FLOAT       = {INTEIRO} "." {INTEIRO}
HEXADECIMAL = "0x" ([a-f0-9])+
CHAR        = "\'" . "\'"

ENDL        = \r|\n|\r\n
ESPACO      = {ENDL} | [\t] | " "*
COMENTARIO  = "//" ~ {ENDL} | "/*" ~ "*/"
//NUMERO      = INTEIRO | FLOAT | HEXADECIMAL

Whitespaces = {ENDL} | {ESPACO} | {COMENTARIO}

ERR = 
    {IDENT_ERR}

%%


{KW_PROGRAM} { return criaSimbolo(sym.KW_PROGRAM); }
{KW_FINAL} { return criaSimbolo(sym.KW_FINAL); }
{KW_CLASS} { return criaSimbolo(sym.KW_CLASS); }
{KW_IF} { return criaSimbolo(sym.KW_IF); }
{KW_ELSE} { return criaSimbolo(sym.KW_ELSE); }
{KW_WHILE} { return criaSimbolo(sym.KW_WHILE); }
{KW_READ} { return criaSimbolo(sym.KW_READ); }
{KW_PRINT} { return criaSimbolo(sym.KW_PRINT); }
{KW_RETURN} { return criaSimbolo(sym.KW_RETURN); }
{KW_VOID} { return criaSimbolo(sym.KW_VOID); }
{KW_NEW} { return criaSimbolo(sym.KW_NEW); }

{ABREPAR} { return criaSimbolo(sym.ABREPAR); }
{FECHAPAR} { return criaSimbolo(sym.FECHAPAR); }
{ABRECHAVE} { return criaSimbolo(sym.ABRECHAVE); }
{FECHACHAVE} { return criaSimbolo(sym.FECHACHAVE); }
{ABRECOL} { return criaSimbolo(sym.ABRECOL); }
{FECHACOL} { return criaSimbolo(sym.FECHACOL); }

{MAIS} { return criaSimbolo(sym.MAIS); }
{MENOS} { return criaSimbolo(sym.MENOS); }
{VEZES} { return criaSimbolo(sym.VEZES); }
{DIV} { return criaSimbolo(sym.DIV); }
{MOD} { return criaSimbolo(sym.MOD); }
{IGUALIGUAL} { return criaSimbolo(sym.IGUALIGUAL); }
{DIF} { return criaSimbolo(sym.DIF); }
{MAIOR} { return criaSimbolo(sym.MAIOR); }
{MENOR} { return criaSimbolo(sym.MENOR); }
{MAIORIGUAL} { return criaSimbolo(sym.MAIORIGUAL); }
{MENORIGUAL} { return criaSimbolo(sym.MENORIGUAL); }

{IGUAL} { return criaSimbolo(sym.IGUAL); }
{PTO} { return criaSimbolo(sym.PTO); }
{PTVIRG} { return criaSimbolo(sym.PTVIRG); }
{VIRG} { return criaSimbolo(sym.VIRG); }

//{LETRA} { return criaSimbolo(sym.LETRA); }
/* {DIGITO}
    { 
        int aux = Integer.parseInt(yytext());
        return criaSimbolo(sym.DIGITO, Integer.valueOf(aux)); 
    } */
{IDENT}  { return criaSimbolo(sym.IDENT, yytext()); }


{INTEIRO}
    {
        int aux = Integer.parseInt(yytext());
        return criaSimbolo(sym.INTEIRO, Integer.valueOf(aux)); 
    }
{FLOAT}
    { 
        Float aux = Float.parseFloat(yytext());
        return criaSimbolo(sym.FLOAT, Float.valueOf(aux)); 
    }
{CHAR}
    {
        return criaSimbolo(sym.CHAR, Character.valueOf(yytext().charAt(1)));
    }
{HEXADECIMAL}
    {
        int aux = Integer.parseInt(yytext(), 16);
        return criaSimbolo(sym.INTEIRO, Integer.valueOf(aux)); 
    }


{ERR} {
    this.defineErro(yyline, yycolumn, "Erro lexico: " + yytext());
}


{Whitespaces} {}
