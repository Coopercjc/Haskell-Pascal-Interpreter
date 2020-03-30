-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        Exp(..),
        BoolExp(..),
        -- MathExp(..),
        GenExp(..),
        Val(..),
        VarDec(..),
        Statement(..),
        Program
    ) where

data GenExp =
    FloatExp Exp
    | BoolExp BoolExp

-- Data-structure for  numeric expressions
data Exp =
    -- unary operator: Op name expression
    Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    -- variable: e.g. Var "x"
    | Var String

-- Data-structure for boolean expressions
data BoolExp = 
    -- binary operator on boolean expressions
    OpB String BoolExp BoolExp
    -- negation, the only unary operator
    | Not BoolExp
    -- comparison operator: Comp name expression expression
    | Comp String Exp Exp
    -- true and false constants
    | True_C
    | False_C

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
    Assign String Exp
    -- If statement
    | If BoolExp Statement Statement
    -- Else If statement
    | ElseIf BoolExp Statement 
    -- Else
    | Else Statement
    -- Block
    | Block [Statement]
    -- Case
    | Case String Statement Statement
    -- Cases for Case
    | Cases String Statement
    -- Writeln
    | Writeln Val
    -- Writeln - No var
    | Write Statement
    -- Writeln - Var
    | WriteVar Statement String
    -- Readln
    | Readln String
    -- While
    | While BoolExp Statement
    -- For
    | For String Exp Exp Statement
    -- Break
    | Break
    -- Continue
    | Continue
    | Statements

data Val =
    Val_ID String
    | Val_S String

data VarDec =
    -- Initializing a Real or Boolean expression
    Init String GenExp
    -- Declaring a Real Expression to default value
    | DecF String
    -- Declaring a Boolean Expression to default value
    | DecB String


-- Data-structure for whole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = ([VarDec], [Statement])