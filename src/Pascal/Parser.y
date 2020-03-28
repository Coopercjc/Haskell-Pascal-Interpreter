{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token
        int             { Token _ (TokenInt $$) }
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        ':='            { Token _ (TokenOp ":=")   }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'and'           { Token _ (TokenK "and") }
        'not'           { Token _ (TokenK "not") }
        'for'           { Token _ (TokenK "for") }
        'while'         { Token _ (TokenK "while") }
        'case'          { Token _ (TokenK "case") }
        'writeln'       { Token _ (TokenK "writeln") }
        'readln'        { Token _ (TokenK "readln") }
        'break'         { Token _ (TokenK "break") }
        'continue'      { Token _ (TokenK "continue") }
        'if'            { Token _ (TokenK "if") }
        'else'          { Token _ (TokenK "else") }
        'then'          { Token _ (TokenK "then") }
        'of'            { Token _ (TokenK "of") }
        'to'            { Token _ (TokenK "to") }
        'do'            { Token _ (TokenK "of") }



-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : 'begin' Statements 'end' { $2 }

-- Expressions
Exp :: {Exp}
    : '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets

BoolExp :: {BoolExp}
    : 'true' { True_C }
    | 'false' { False_C }
    | 'not' BoolExp { Not $2 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }

--MathExp :: {MathExp}
  --  : '-' MathExp { Op1 "-" $2}
    --| MathExp '/' MathExp { OpM2 "/" $1 $3} 

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

Statement :: {Statement}
    : ID ':=' Exp { Assign $1 $3 }
    | 'for' ID ':=' int 'to' int 'do' Program { For Assign $2 $4 $6 }
    | 'while' '(' BoolExp ')' 'do' Statement { While $3 $6 }
    | 'case' ID 'of' Statements 'else' Statement { Case $2 $4 $6 }
    | 'break' { Break }
    | 'continue' { Continue }
    | 'if' '(' BoolExp ')' 'then' Statement 'else' Statement { If $3 $6 $8 }
    | 'writeln' '(' Statement ')' { Writeln $3 }
    | 'readln' '(' Statement ')' { Readln $3 }

{}
