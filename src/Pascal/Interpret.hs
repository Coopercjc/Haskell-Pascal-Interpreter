module Pascal.Interpret 
(
    interpret
)
where

import Pascal.Data
import Pascal.Evaluator
import qualified Data.Map.Strict as M

-- Symbol table
myVariables :: Variables
myVariables = M.empty

myFunctions :: Functions
myFunctions = M.empty

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- make sure you write test unit cases for all functions

-- Interpret the "program" data structure into a String
interpret :: Program -> String

-- The interpreter itself
-- interpret states = concat (map evalOutput' states)
--     where evalOutput' = evalOutput st ""

interpret ((vars, funcs), stmts) = 
    let 
        -- Create the function table
        funcTable = foldl addFunc myFunctions funcs 
        -- Create the variable table
        ((tempStr, newVars:tail), temp) = foldl evalVarDec (("", (myVariables:[])), funcTable) vars 
        -- Output
        ((out, theVars), theFuncs) = foldl evalOutput (("", (newVars:[])), funcTable) stmts
    in
        out

interpret _ = "Not implemented"