grammar Scripts;

@header{package pl.maciej.parser;}

compilationUnit: (opcja
 | setOpcja
 | ifrule
 | scriptLink
 | cpiece
 | cpiecexu
 | seterror
 | setnumeric
 | getnumeric SEMICOLON
 | piecex
 | piece
 | surface
 | csurface
 | surfacex
 | surfacexu
 | innercolor
 | outercolor
 | color
 | colour
 | vardecl
 | crod
 | crodx
 | crodxu
 | rod
 | rodx
 | cinrod
 | coutrod
 | message
 | workforce
 | existVar
 | setdimension
 | nazwa)* EOF;

ifrule: IF LBRACKET (opcja | variable | existVar) RBRACKET THEN (setOpcja | ifrule)* ENDIF;
opcja: OPTION LEFT ID COMMA ID RIGHT;
setOpcja: SETOPTION LEFT ID COMMA ID RIGHT SEMICOLON;
scriptLink: SCRIPT LEFT ID COMMA ID RIGHT SEMICOLON;
vardecl: vardeclaration (getnumeric | LBRACKET getnumeric RBRACKET) SEMICOLON;
vardeclaration: LET VAR EQUALS;
variable: VAR;
color: COLOR LEFT ID RIGHT;
colour: COLOUR LEFT ID RIGHT;
innercolor: INNERCOLOUR LEFT ID RIGHT;
outercolor: OUTERCOLOUR LEFT ID RIGHT;
cpiece: CPIECE LEFT ID COMMA arg RIGHT SEMICOLON;
cpiecexu: CPIECE_EX_U LEFT ID COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
seterror: SETERROR LEFT arg RIGHT SEMICOLON;
setnumeric: SETNUMERICOPTION LEFT ID COMMA arg RIGHT SEMICOLON;
getnumeric: GETNUMERICOPTION LEFT ID RIGHT;
piecex: PIECE_EX_U LEFT ID COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
piece: PIECE LEFT ID COMMA arg RIGHT SEMICOLON;
surface: SURFACE LEFT ID COMMA arg COMMA arg COMMA arg RIGHT SEMICOLON;
csurface: CSURFACE LEFT ID COMMA arg COMMA arg COMMA arg RIGHT SEMICOLON;
surfacex: SURFACE_EX LEFT ID COMMA arg COMMA arg COMMA arg COMMA ID RIGHT SEMICOLON;
surfacexu: SURFACE_EX_U LEFT ID COMMA arg COMMA arg COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
crod: CROD LEFT ID COMMA arg COMMA arg COMMA arg COMMA arg RIGHT SEMICOLON;
crodx: CROD_EX LEFT ID COMMA  arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA ID RIGHT SEMICOLON;
crodxu: CROD_EX_U LEFT ID COMMA  arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
rod: ROD LEFT ID COMMA arg COMMA arg COMMA arg COMMA arg RIGHT SEMICOLON;
rodx: ROD_EX_U LEFT ID COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
cinrod: CINNROD_EX_U LEFT ID COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
coutrod: COUTROD_EX_U LEFT ID COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA arg COMMA ID COMMA arg RIGHT SEMICOLON;
message: MESSAGE LEFT ID RIGHT SEMICOLON;
workforce: WORKFORCE LEFT ID COMMA arg RIGHT SEMICOLON;
existVar: EXISTSVARIABLE LEFT ID RIGHT;
setdimension: SETDIMENSION LEFT ID COMMA arg RIGHT SEMICOLON;
arg: LBRACKET (NUMBER | DECIMAL | VAR) RBRACKET;
nazwa: NAZWA LEFT ID RIGHT SEMICOLON;


IF: 'IF';
LBRACKET:'[';
RBRACKET:']';
THEN: 'THEN';
ENDIF: 'ENDIF';
OR: 'OR';
AND: 'AND';
EQUALS: '=';
FASLE:'FALSE';
TRUE:'TRUE';
SETOPTION:'SETOPTION';
PLUS: '+';
MINUS: '-';
ASTERISK: '*' ;
DIVISION: '/' ;
LEFT:'(';
RIGHT:')';
OPTION: 'OPTION';
CPIECE: 'CPIECE';
CPIECE_EX_U:'CPIECE_EX_U';
SETERROR: 'SETERROR';
LET: 'LET';
COLOUR:'COLOUR';
COLOR:'COLOR';
SETNUMERICOPTION: 'SETNUMERICOPTION';
GETNUMERICOPTION:'GETNUMERICOPTION';
PIECE_EX_U:'PIECE_EX_U';
PIECE:'PIECE';
SURFACE:'SURFACE';
CSURFACE:'CSURFACE';
SURFACE_EX:'SURFACE_EX';
SURFACE_EX_U:'SURFACE_EX_U';
OUTERCOLOUR:'OUTERCOLOUR';
INNERCOLOUR:'INNERCOLOUR';
CROD:'CROD';
CROD_EX:'CROD_EX';
CROD_EX_U:'CROD_EX_U';
ROD: 'ROD';
ROD_EX_U:'ROD_EX_U';
CINNROD_EX_U: 'CINNROD_EX_U';
COUTROD_EX_U: 'COUTROD_EX_U';
MESSAGE:'MESSAGE';
SCRIPT: 'SCRIPT';
NAZWA: 'NAZWA';
WORKFORCE:'WORKFORCE';
MH:'MH';
ROUND:'ROUND';
EXISTSVARIABLE:'EXISTSVARIABLE';
SETDIMENSION:'SETDIMENSION';
NUMBER: '0'|[1-9][0-9]* ;
DECIMAL: '0'|[1-9][0-9]* '.' [0-9]+ ;
COMMA:',';
SEMICOLON: ';';
ID: '"'.*?'"';
VAR: [a-zA-Z0-9_ąćżźółĄĆŻŹÓŁ]+ ;
WS: [ \t\n\r]+ -> skip ;
COMMENT: '%'.*?'\n' -> skip;




