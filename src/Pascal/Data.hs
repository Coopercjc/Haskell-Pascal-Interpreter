-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        Exp(..),
        BoolExp(..),
        -- MathExp(..),
        Statement(..),
        Program
    ) where

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

-- Data-structure for boolean expressions
-- data MathExp = 
    -- unary operator: Op name expression
    -- OpM1 String Exp
    -- binary operator on math expressions
    -- | OpM2 String MathExp MathExp
    -- real value
    -- | Realm Float


-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    Prgm String 
    -- Variable assignment
    | Assign String Exp
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
    | Writeln Statement
    -- Writeln - No var
    | Write Statement
    -- Writeln - Var
    | WriteVar Statement String
    -- Readln
    | Readln String
    -- While
    | While BoolExp Statement
    -- For
    | For Statement Exp
    -- Break
    | Break
    -- Continue
    | Continue


-- Data-structure for whole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]