parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

program
    : stat* EOF
    ;

stat
    : assignment
    | expression
    | printStatement
    | forStatement
    ;

assignment
    : ID ASSIGN expression SEMICOLON
    ;

expression
    : ID
    | INT
    | funcCall
    | NOT expression
    | expression AND expression
    | expression OR expression
    ;

funcCall
    : ID LPAREN (expression (COMMA expression)*)? RPAREN
    ;

printStatement
    : PRINT LPAREN expression RPAREN SEMICOLON
    ;

forStatement
    : FOR LPAREN ID IN expression RANGE expression RPAREN block
    ;

block
    : LBRACE stat* RBRACE
    ;
