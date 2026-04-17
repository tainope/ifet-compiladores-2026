
%%

%standalone
%line
%column

Sym_OpenCommentBlock = "/*"
Sym_CloseComentBlock = "*/"
Comment     = ("/*" (. [^"*/"] | [^"*"])* "*/") | ("//" (.)*)

KW_Program  = "program"
KW_Class    = "class"
KW_Main     = "main"
KW_Int      = "int"
KW_Float    = "float"
KW_Char     = "char"
KW_Void     = "void"
KW_New      = "new"
KW_Final    = "final"
KW_If       = "if"
KW_Print    = "print"
KW_Read     = "read"
Sym_OpenPar          =   "("
Sym_ClosedBPar       =   ")"
Sym_OpenSquareBrac   =   "["
Sym_ClosedSquareBrac =   "]"
Sym_OpenCurlyBrac    =   "{"
Sym_ClosedCurlyBrac  =   "}"
Sym_OpenAngleBrac    =   "<"
Sym_ClosedAngleBrac  =   ">"
Sym_Apostrophe   =   "\'"  
Sym_Quote        = "\""
Sym_Period   = "."
Sym_Comma    = ","
Sym_Semicolon = ";"
Sym_Attrib   = "="
Sym_Whitespace   = (" " | "\n" | "\t" | "\r")


Integer = {digit}*
Float = {Integer} ("." {Integer})? ("e" ("+" | "-")? {Integer})
Hexadecimal = "0x" ({Integer} | [A-Fa-f])*

number      = ({Integer} | {Float} | {Hexadecimal})
ident       = {letter} ({letter} | {digit})*
letter      = [A-Za-z]
digit       = [0-9]
Addop       = ("+" | "-")
Mulop       = ("*" | "/" | "%")
Relop       = ("==" | "!=" | ">" | ">=" | "<" | "<=")




%%


{Comment} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Comment): " + yytext()); }

{KW_Program} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Program): " + yytext()); }
{KW_Class} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_class): " + yytext()); }
{KW_Int} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Int): " + yytext()); }
{KW_Main} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Main): " + yytext()); }
{KW_Float} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Float): " + yytext()); }
{KW_Char} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Char): " + yytext()); }
{KW_Void} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Void): " + yytext()); }
{KW_New} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_New): " + yytext()); }
{KW_Final} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_Final): " + yytext()); }
{KW_If} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "KW_If): " + yytext()); }
{Sym_OpenPar} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_OpenPar): " + yytext()); }
{Sym_ClosedBPar} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_ClosedBPar): " + yytext()); }
{Sym_OpenSquareBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_OpenSquareBrac): " + yytext()); }
{Sym_ClosedSquareBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_ClosedSquareBrac): " + yytext()); }
{Sym_OpenCurlyBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_OpenCurlyBrac): " + yytext()); }
{Sym_ClosedCurlyBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_ClosedCurlyBrac): " + yytext()); }
{Sym_OpenAngleBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_OpenAngleBrac): " + yytext()); }
{Sym_ClosedAngleBrac} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_ClosedAngleBrac): " + yytext()); }
{Sym_Apostrophe} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Apostrophe): " + yytext()); }
{Sym_Quote} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Quote): " + yytext()); }
{Sym_Period} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Period): " + yytext()); }
{Sym_Comma} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Comma): " + yytext()); }
{Sym_Semicolon} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Semicolon): " + yytext()); }
{Sym_Attrib} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Attrib): " + yytext()); }
//{Sym_Whitespace} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Sym_Whitespace)"); }
{Sym_Whitespace} { }
{Integer} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Integer): " + yytext()); }
{Float} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Float): " + yytext()); }
{Hexadecimal} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Hexadecimal): " + yytext()); }

{ident} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "ident): " + yytext()); }
{letter} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "letter): " + yytext()); }
{digit} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "digit): " + yytext()); }
{Addop} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Addop): " + yytext()); }
{Mulop} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Mulop): " + yytext()); }
{Relop} { System.out.println("("+ yyline + ", " + yycolumn + ", " + "Relop): " + yytext()); }



. { System.out.println("("+ yyline + ", " + yycolumn + ", " + "UNKNOWN): " + yytext()); }