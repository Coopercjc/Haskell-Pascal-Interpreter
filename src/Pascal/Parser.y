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
        float           { Token _ (TokenReal $$) }
        bool            { Token _ (TokenBool $$) }
        string          { Token _ (TokenStr $$) }
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        ':='            { Token _ (TokenOp ":=")   }
        ','             { Token _ (TokenK ",")   }
        ';'             { Token _ (TokenK ";")   }
        ':'             { Token _ (TokenK ":")   }
        '.'             { Token _ (TokenK ".")   }
        '<>'            { Token _ (TokenOp "<>")  }
        '>'             { Token _ (TokenOp ">")  }
        '<'             { Token _ (TokenOp "<")  }
        '<='            { Token _ (TokenOp "<=")  }
        '>='            { Token _ (TokenOp ">=")  }
        'sqrt'          { Token _ (TokenOp "sqrt") }
        'ln'            { Token _ (TokenOp "ln") }
        'exp'           { Token _ (TokenOp "exp") }
        'sin'           { Token _ (TokenOp "sin") }
        'cos'           { Token _ (TokenOp "cos") }
        'program'       { Token _ (TokenK "program") }
        'var'           { Token _ (TokenK "var")  }
        'procedure'     { Token _ (TokenK "procedure") }
        'function'      { Token _ (TokenK "function") }
        'real'          { Token _ (TokenK "real")  }
        'boolean'       { Token _ (TokenK "boolean")  }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'and'           { Token _ (TokenOp "and") }
        'not'           { Token _ (TokenOp "not") }
        'or'            { Token _ (TokenOp "or") }
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


--------------- Main program ---------------


Program :: {Program}
    : 'program' ID ';' VarBlock FuncDecBlock Block '.' { (($4, $5), $6) }


--------------- Variable Declarations ---------------


VarBlock :: {[VarDec]}
    : 'var' VarDecs { $2 }

VarDecs :: {[VarDec]}
    : { [] }
    | VarDec VarDecs { $1:$2 }

VarDec :: {VarDec}
    : ID ':' 'real' '=' RealExp ';'        { Init $1 (FloatExp $5) }
    | ID ':' 'boolean' '=' BoolExp ';'     { Init $1 (BoolExp $5) }
    | ID ':' 'real' ';'                    { DecFloat $1 }
    | ID ':' 'boolean' ';'                 { DecBool $1 }


--------------- Expressions ---------------

-- Real expresions
RealExp :: {RealExp}
    : '-' RealExp                           { Op1 "-" $2}
    | 'sqrt' '(' RealExp ')'                { Op3 "sqrt" $3 }
    | 'ln' '(' RealExp ')'                  { Op3 "ln" $3 }
    | 'exp' '(' RealExp ')'                 { Op3 "exp" $3 }
    | 'sin' '(' RealExp ')'                 { Op3 "sin" $3 }
    | 'cos' '(' RealExp ')'                 { Op3 "cos" $3 }
    | RealExp '*' RealExp                   { Op2 "*" $1 $3 }
    | RealExp '/' RealExp                   { Op2 "/" $1 $3 }
    | RealExp '+' RealExp                   { Op2 "+" $1 $3 }
    | RealExp '-' RealExp                   { Op2 "-" $1 $3 }
    | '(' RealExp ')'                       { $2 }
    | float                                 { Real $1 }             -- Base case - number
    | ID                                    { RealVar $1 }          -- Base case - variable

-- Boolean expressions
BoolExp :: {BoolExp}
    : BoolExp 'and' BoolExp                 { BoolOp "and" $1 $3 }
    | BoolExp 'or' BoolExp                  { BoolOp "or" $1 $3 }
    | 'not' BoolExp                         { Not $2 }
    | RealExp '=' RealExp                   { Comp "=" $1 $3 }
    | RealExp '<>' RealExp                  { Comp "<>" $1 $3 }
    | RealExp '>' RealExp                   { Comp ">" $1 $3 }
    | RealExp '>=' RealExp                  { Comp ">=" $1 $3 }
    | RealExp '<' RealExp                   { Comp "<" $1 $3 }
    | RealExp '<=' RealExp                  { Comp "<=" $1 $3 }
    | bool                                  { Boolean $1 }          -- Base case - boolean
    | ID                                    { BoolVar $1 }          -- Base case - variable


--------------- Statements ---------------


-- Block of statments
StateBlock :: {[Statement]}
    : Block ';' { $1 }
    | Statement { [$1] }

Block :: {[Statement]}
    : 'begin' Statements 'end' { $2 }

-- Statement list
Statements :: {[Statement]}
    : { [] }                            -- nothing; make empty list
    | Statement Statements { $1:$2 }    -- put statement as first element of statements

-- Individual statements
Statement :: {Statement}
    : ID ':=' Generic ';' { Assign $1 $3}
    | ID '(' Parameters ')' ';' { ProcCall $1 $3 }            -- Procedure
    | ID ':=' ID '(' Parameters ')' ';' { FuncCall $1 $3 $5 } -- Function call
    | 'writeln' '(' Vals ')' ';' { Writeln $3 }               -- Writeln
    -- TODO: If, Case, for, while

-- For writeln
Vals :: {[Val]}
    : {[]} 
    | Val { [$1] }
    | Vals { $1 }
    | Val ',' Vals { $1:$3 }

Val :: {Val}
    : ID { ValueID $1 }
    | RealExp { DataExp (FloatExp $1) }
    | BoolExp { DataExp (BoolExp $1) }
    | string { ValueStr $1 }


--------------- Functions ---------------


-- Parameters of the function
Parameters :: {[Val]}
    : { [] } --nothing
    | Generic { [$1] }
    | Parameters { $1 }
    | Generic ',' Parameters { $1:$3 }

-- Generic "data" type
Generic :: {Val}
    : ID {(ValueID $1)}
    | RealExp { DataExp (FloatExp $1) }
    | BoolExp { DataExp (BoolExp $1) }

FuncDecBlock :: { [Function] }
    : { [] } -- nothing
    | FuncDec FuncDecBlock { $1:$2 }

FuncDec :: {Function}
    : 'function' ID '(' FormalParamList ')' ':' 'real' ';' VarBlock Block ';' { ($2, (ReturnReal $4 $9 $10)) }
    | 'function' ID '(' FormalParamList ')' ':' 'boolean' ';' VarBlock Block ';' {  ($2, (ReturnBool $4 $9 $10)) }
    | 'procedure' ID '(' FormalParamList ')' ';' VarBlock Block ';' { ($2, (ReturnNone $4 $7 $8)) }

FormalParamList :: { [String] }
    : { [] } --nothing
    | ParamGroup { $1 }
    | FormalParamList { $1 }
    | ParamGroup ';' FormalParamList { $1 ++ $3 }

ParamGroup :: { [String] }
    : VariableList ':' 'real' { $1 }
    | VariableList ':' 'boolean' { $1 }

VariableList :: { [String] }
    : ID { [$1] }
    | ID ',' VariableList { $1:$3 }

{}
