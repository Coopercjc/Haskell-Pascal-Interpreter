-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        RealExp(..),
        BoolExp(..),
        Data(..),
        Val(..),
        VarDec(..),
        Statement(..),
        FunctionBody(..),
        Program,
        Variables,
        Functions,
        Function
    ) where

import qualified Data.Map.Strict as M

-- Our generic "data" type from last project
data Data =
    FloatExp RealExp
    | BoolExp BoolExp
    -- Show lets us display as string
    deriving (Show, Eq)

-- Data-structure for real expressions
data RealExp =
    -- unary operator: Op name expression
    Op1 String RealExp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String RealExp RealExp
    -- Equations
    | Op3 String RealExp
    -- Real value
    | Real Float
    -- FunctionCall
    | RFuncCall String [Val]
    -- Variable
    | RealVar String
    deriving (Show, Eq)

-- Data-structure for boolean expressions
data BoolExp = 
    -- binary operator on boolean expressions
    BoolOp String BoolExp BoolExp
    -- negation, the only unary operator
    | Not BoolExp
    -- comparison operator: Comp name expression expression
    | Comp String RealExp RealExp
    -- Bool value
    | Boolean Bool
    -- Variable
    | BoolVar String
    deriving (Show, Eq)

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
    Assign String Val
    -- procedure call
    | ProcCall String [Val]
    -- function call: FunctionCall name ListArguments
    | FuncCall String String [Val]
    -- writeln statement
    | Writeln [Val]
    -- Block
    | Block [Statement]
    deriving (Show, Eq)

data Val =
    ValueID String
    | DataExp Data
    | ValueStr String
    deriving (Show, Eq)

data VarDec =
    -- Initializing a Real or Boolean expression
    Init String Data
    -- Declaring a Real Expression to default value
    | DecFloat String
    -- Declaring a Boolean Expression to default value
    | DecBool String
    deriving (Show, Eq)

data FunctionBody = 
    -- Return types
    ReturnReal [String] [VarDec] [Statement]
    | ReturnBool [String] [VarDec] [Statement]
    | ReturnNone [String] [VarDec] [Statement]
    deriving (Show, Eq)


-- Data-structure for whole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = (([VarDec], [Function]), [Statement])

-- Data-structure for functions
type Function = (String, FunctionBody)

-- Map for variables
type Variables = M.Map String Data

-- Map for functions
type Functions = M.Map String FunctionBody

