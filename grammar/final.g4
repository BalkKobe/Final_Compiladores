grammar final;

program
    : statement+
    ;

statement
    : variableDeclaration
    | assignment
    | function
    | forLoop
    | whileLoop
    | ifStatement
    | printStatement
    | envVariableDeclaration
    | expression                                
    ;

variableDeclaration
    : VAR ID EQ expression ';'                  #VarVariable
    ;

assignment
    : ID EQ expression ';'                      #Asiggn
    ;

function
    :   DEF ID '(' arg_func ')' '{' statement+ '}' #Func
    ;

arg_func
    : ID (',' ID)*
    ;

forLoop
    : FOR ID IN list DO statement+ DONE         #ForSentence
    ;
    
whileLoop
    : WHILE expression DO statement+ DONE       #WhileSentence
    ;

ifStatement
    : IF expression THEN statement+ ELSE statement+ FI      #ifelse
    | IF expression THEN statement+ FI                      #if
    ;

printStatement
    : PRINT expression ';'                                  #print
    ;     

envVariableDeclaration
    : ENV ID EQ expression ';'                              #EnvVariable
    ;

list
    : '[' (expression (',' expression)*)? ']'               #Lista
    ;

expression
    : ID                                                                #Identifier
    | NUMBER                                                            #Number
    | list                                                              #RootList
    | '(' expression ')'                                                #ParenExpr
    | expression opt=(TIMES | DIV ) expression                              #MulDiv
    | expression opt=(PLUS | MINUS | MOD) expression                        #PlusMinus
    | expression opt=(COMP | DIFF | LESS | GREAT | LTE | GTE) expression    #Comparation
    | expression opt=(AND | OR) expression                                  #AndOr
    | NOT expression                                                        #NotExpr
    ;


DEF: 'def';

WHILE: 'while';
FOR: 'for';
IN: 'in';
DO: 'do';
DONE: 'done';

IF: 'if';
THEN: 'then';
FI: 'fi';
ELSE: 'else';

EQ: '=';
NOT: '!';
COMP: '==';
DIFF: '!=';
LTE: '<=';
LESS: '<';
GTE: '>=';
GREAT: '>';
AND: '&&';
OR: '||';

PLUS: '+';
MINUS: '-';
TIMES: '*';
DIV: '/';
MOD: '%';


LBRACE: '{';
RBRACE: '}';
LPAREN: '(';
RPAREN: ')';
LBRANCH: '[';
RBRANCH: ']';
COMMA:',';
COL: ';';

PRINT: 'print';
VAR: 'var';


NUMBER: '-'? ('.' [0-9]+|[0-9]+ ('.' [0-9]*)? );
ID: [a-zA-Z0-9]+('.'[a-zA-Z]+)*;
WS: [ \t\n\r\f]+ -> skip ;
