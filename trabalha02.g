grammar MinhaLinguagem;

programa: (declaracao | funcao)* EOF;

declaracao: tipo ID ';' ;

tipo: 'int' | 'float' | 'string';

funcao: tipo ID '(' parametros? ')' bloco;

parametros: parametro (',' parametro)*;

parametro: tipo ID;

bloco: '{' instrucao* '}';

instrucao: declaracao
          | atribuicao
          | comando
          | retorno
          | chamadaFuncao
          ;

atribuicao: ID '=' expressao ';' ;

expressao: termo (('+' | '-') termo)*;

termo: fator (('*' | '/') fator)*;

fator: ID
     | NUMERO
     | '(' expressao ')'
     ;

comando: 'if' '(' expressao ')' bloco ('else' bloco)?
       | 'while' '(' expressao ')' bloco
       | 'for' '(' atribuicao? ';' expressao? ';' atribuicao? ')' bloco
       ;

retorno: 'return' expressao? ';' ;

chamadaFuncao: ID '(' argumentos? ')' ';' ;

argumentos: expressao (',' expressao)*;

ID: [a-zA-Z_][a-zA-Z0-9_]*;

NUMERO: '-'? [0-9]+ ('.' [0-9]+)?;

WS: [ \t\r\n]+ -> skip;