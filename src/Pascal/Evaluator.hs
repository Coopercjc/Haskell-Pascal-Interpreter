module Pascal.Evaluator where

import Pascal.Data
import Data.Maybe (fromJust)
import qualified Data.Map.Strict as M

-- Main evaluator for the program


--------------- Real evaluator ---------------


-- Real expression -> scope -----> output
evalReals :: RealExp -> ((String, [Variables]), Functions) -> (Data, Variables)

-- Negative 
evalReals (Op1 "-" r) scope = 
    let 
        ((FloatExp (Real exp)), vars) = evalReals r scope
    in 
        ((FloatExp (Real ((-1) * exp))), vars)

-- Multiply, divide, add, subtract
evalReals (Op2 "*" l r) scope = 
    let ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (lExp * rExp))), vars)

evalReals (Op2 "/" l r) scope = 
    let ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (lExp / rExp))), vars)

evalReals (Op2 "+" l r) scope = 
    let ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (lExp + rExp))), vars)

evalReals (Op2 "-" l r) scope = 
    let ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (lExp - rExp))), vars)

-- Special Expressions
evalReals (Op3 "sqrt" r) scope = 
    let ((FloatExp (Real exp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (sqrt(exp)))), vars)

evalReals (Op3 "ln" r) scope = 
    let ((FloatExp (Real exp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (log(exp)))), vars)

evalReals (Op3 "exp" r) scope = 
    let ((FloatExp (Real ex)), vars) = evalReals r scope
    in
        ((FloatExp (Real (exp(ex)))), vars)

evalReals (Op3 "sin" r) scope = 
    let ((FloatExp (Real exp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (sin(exp)))), vars)

evalReals (Op3 "cos" r) scope = 
    let ((FloatExp (Real exp)), vars) = evalReals r scope
    in
        ((FloatExp (Real (cos(exp)))), vars)
            
-- Base (a raw value)
evalReals (Real r) ((str, (vars:tail)), funcs) = ((FloatExp (Real r)), vars)

-- Base (a raw variable) Variable (string), aka table lookup 
evalReals (RealVar x) ((str, (vars:tail)), funcs) = 
    case variableTable x vars of ((FloatExp f), st') -> ((FloatExp f), st')


--------------- Boolean evaluator ---------------


-- Boolean expression -> scope -----> output
evalBools :: BoolExp -> ((String, [Variables]), Functions) -> (Data, Variables)

-- And
evalBools (BoolOp "and" l r) scope =
    -- Let = define some parameters for the expression
    let 
        -- Evaluate left expression down to base
        ((BoolExp (Boolean lExp)), _) = evalBools l scope
        -- Evaluate right expression down to base
        ((BoolExp (Boolean rExp)), vars) = evalBools r scope
    -- In = return statement
    in
        ((BoolExp (Boolean (lExp && rExp))), vars)

-- Or
evalBools (BoolOp "or" l r) scope =
    let 
        ((BoolExp (Boolean lExp)), _) = evalBools l scope
        ((BoolExp (Boolean rExp)), vars) = evalBools r scope
    in
        ((BoolExp (Boolean (lExp || rExp))), vars)            

-- Not
evalBools (Not b) scope =
    let 
        ((BoolExp (Boolean exp)), vars) = evalBools b scope
    in
        ((BoolExp (Boolean (not exp))), vars)

-- Comparison of reals (==, >, <, >=, <=, <>)
evalBools (Comp "==" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp == rExp))), vars)

evalBools (Comp "<>" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp /= rExp))), vars)

evalBools (Comp ">" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp > rExp))), vars)

evalBools (Comp ">=" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp >= rExp))), vars)

evalBools (Comp "<" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp <= rExp))), vars)

evalBools (Comp "<=" l r) scope = 
    let
        ((FloatExp (Real lExp)), _) = evalReals l scope
        ((FloatExp (Real rExp)), vars) = evalReals r scope
    in
        ((BoolExp (Boolean(lExp <= rExp))), vars)

-- Base (a raw value)
evalBools (Boolean True) ((str, (vars:tail)), funcs) = ((BoolExp (Boolean (True))), vars)
evalBools (Boolean False) ((str, (vars:tail)), funcs) = ((BoolExp (Boolean (False))), vars)

-- Base (a raw variable)
evalBools (BoolVar x) ((str, (vars:tail)), funcs) = 
    case variableTable x vars of ((BoolExp b), vars1) -> ((BoolExp b), vars1)


--------------- Statement evaluator ---------------


-- Statement -> scope -----> update scope
evalState :: Statement -> ((String, [Variables]), Functions) -> ((String, [Variables]), Functions)

-- Variable assignment
evalState (Assign x val) scope =
    let
        theVal = evalParameters scope val
        output = addSymbol x theVal scope
    in
        output

-- Procedure call
evalState (ProcCall procId paramList) ((str, (vars:tail)), funcs) =
    let
        params = map (evalParameters ((str, (vars:tail)), funcs)) paramList
        func = functionTable procId funcs
        (x1, stmts2) = setScope func params ((str, (vars:tail)), funcs) procId
        ((value, x2:tl2), _) = foldl evalOutput ((str, x1:[]), funcs) stmts2
        (x3:tl) = removeScope(x2:vars:tail)
    in
        ((value, (x3:tl)), funcs)

-- Function call
evalState (FuncCall x funcId paramList) ((str, (vars:tail)), funcs) =
    let
        -- Parameters = map to parameterList
        params = map (evalParameters ((str, (vars:tail)), funcs)) paramList
        -- Look up function in Functions
        func = functionTable funcId funcs
        (newScope, states) = setScope func params ((str, (vars:tail)), funcs) funcId
        ((text, newStart:newEnd), _) = foldl evalOutput ((str, newScope:[]), funcs) states
        (result, stTemp) = variableTable funcId newStart
        -- Go back down
        newVars = removeScope(newStart:vars:tail)
        ((theResult, scope), functions) = addSymbol x result ((text, newVars), funcs)
    in 
        ((theResult, scope), funcs)

-- Statement that outputs a string (writeln)
evalOutput :: ((String, [Variables]), Functions) -> Statement -> ((String, [Variables]), Functions)
evalOutput scope (Writeln vals) = 
    let 
        ((text, vars), funcs) = foldl evalWriteln scope vals
    in 
        ((text ++ "\n", vars), funcs)

-- Base case, calls evalState
evalOutput scope statement = 
    let 
        ((text, vars), funcs) = evalState statement scope
    in 
        ((text, vars), funcs)


--------------- Writeln evaluator ---------------


evalWriteln :: ((String, [Variables]), Functions) -> Val -> ((String, [Variables]), Functions)

-- Variable name
evalWriteln ((str, (vars:tail)), funcs) (ValueID x) = 
    case variableTable x vars of
        ((FloatExp (Real f)), myVars) -> ((str ++ (show f), (myVars:tail)), funcs)
        ((BoolExp (Boolean b)), myVars) -> ((str ++ (show b), (myVars:tail)), funcs)

-- Real expression
evalWriteln ((text, (vars:tail)), funcs) (DataExp (FloatExp r)) =
    let 
        ((FloatExp (Real value)), myVars) = evalReals r ((text, (vars:tail)), funcs)
    in 
        ((text ++ (show value), (myVars:tail)), funcs)
        
-- Boolean expression
evalWriteln  ((text, (vars:tail)), funcs) (DataExp (BoolExp b)) =
    let 
        ((BoolExp (Boolean value)), myVars) = evalBools b ((text, (vars:tail)), funcs)
    in
        ((text ++ (show value), (myVars:tail)), funcs)

-- A string
evalWriteln ((str, (vars:tail)), funcs) (ValueStr s) = ((str ++ (removeQuote s), (vars:tail)), funcs)
-- Removes single quotes on strings
removeQuote :: String -> String
removeQuote s = tail (init s)


--------------- Parameter passing-in ---------------


evalParameters :: ((String, [Variables]), Functions) -> Val -> Data

-- Variable name
evalParameters ((str, (vars:tail)), funcs) (ValueID x) = 
    case variableTable x vars of
        ((FloatExp (Real f)), temp) -> (FloatExp (Real f))
        ((BoolExp (Boolean b)), temp) -> (BoolExp (Boolean b))

-- Real expression
evalParameters scope (DataExp (FloatExp r)) =
    let 
        ((FloatExp (Real value)), _) = evalReals r scope
    in 
        (FloatExp (Real value))

-- Boolean expression
evalParameters scope (DataExp (BoolExp b)) =
    let 
        ((BoolExp (Boolean value)), _) = evalBools b scope
    in 
        (BoolExp (Boolean value))


--------------- Variable table ---------------


-- Initialize variables
evalVarDec :: ((String, [Variables]), Functions) -> VarDec -> ((String, [Variables]), Functions)
evalVarDec ((str, (vars:tail)), funcs) (Init x (FloatExp f)) = 
    let 
        ((FloatExp (Real value)), newVars) = evalReals f ((str, (vars:tail)), funcs)
        output = addSymbol x (FloatExp (Real value)) ((str, (newVars:tail)), funcs)
    in
        output

evalVarDec ((str, (vars:tail)), funcs) (Init x (BoolExp b)) =
    let 
        ((BoolExp (Boolean value)), newVars) = evalBools b ((str, (vars:tail)), funcs)
        output = addSymbol x (BoolExp (Boolean value)) ((str, (newVars:tail)), funcs)
    in
        output
    
-- Declaring variables
evalVarDec scope (DecFloat x) =
    let
        output = addSymbol x (FloatExp (Real (0.0::Float))) scope
    in
        output

evalVarDec scope (DecBool x) = 
    let
        output = addSymbol x (BoolExp (Boolean (False::Bool))) scope
    in
        output

-- Add variable to variable table
addSymbol :: String -> Data -> ((String, [Variables]), Functions) -> ((String, [Variables]), Functions)
addSymbol x (FloatExp f) ((str, (vars:tail)), funcs) = 
    let 
        (FloatExp (Real value), _) = evalReals f ((str, (vars:tail)), funcs) 
        newVars = M.insert x (FloatExp (Real value)) vars
    in
        ((str, (newVars:tail)), funcs)

addSymbol x (BoolExp b) ((str, (vars:tail)), funcs) = 
    let 
        (BoolExp (Boolean value), _) = evalBools b ((str, (vars:tail)), funcs) 
        newVars = M.insert x (BoolExp (Boolean value)) vars
    in
        ((str, (newVars:tail)), funcs)


--------------- Function table ---------------


-- Add function to function table
addFunc :: Functions -> Function  -> Functions
addFunc ft (id, body)  = M.insert id body ft

-- Scope of functions and procedures
setScope :: FunctionBody -> [Data] -> ((String, [Variables]), Functions) -> String -> (Variables, [Statement])
-- Real return types
setScope (ReturnReal params theVars states) exps scope name =
    let
        -- Variable declarations
        newScope = foldl evalVarDec scope theVars
        -- Parameters
        newVars = zipWith matchParam params exps
        newerScope = foldl evalVarDec newScope newVars
        ((text, (newerVars:tail)), funcs) = addSymbol name (FloatExp (Real (0.0::Float))) newerScope
    in 
        (newerVars, states)

-- Boolean return types
setScope (ReturnBool params theVars states) exps scope name =
    let
        -- Variable declarations
        newScope = foldl evalVarDec scope theVars
        -- Parameters
        newVars = zipWith matchParam params exps
        newerScope = foldl evalVarDec newScope newVars
        ((text, (newerVars:tail)), funcs) = addSymbol name (BoolExp (Boolean (False::Bool))) newerScope
    in 
        (newerVars, states)

matchParam :: String -> Data -> VarDec
matchParam p v = (Init p v)

--------------- Scope handler ---------------

-- Create a new scope
addScope :: [Variables] -> [Variables]
addScope (vars:tail) = (vars:vars:tail)

-- Remove a scope
removeScope :: [Variables] -> [Variables]
removeScope (vars1:vars2:tail) = ((M.intersection vars1 vars2):tail)

-- Looker-upper for variables
variableTable :: String -> Variables -> (Data, Variables)
variableTable var vars = 
    case M.lookup var vars of
        Just (FloatExp (Real num)) -> ((fromJust (Just (FloatExp (Real num)))), vars)
        Just (BoolExp (Boolean bool)) -> ((fromJust (Just (BoolExp (Boolean bool)))), vars)

-- Looker-upper for functions
functionTable :: String -> Functions -> FunctionBody
functionTable statement funcs = 
    case M.lookup statement funcs of 
        Just (ReturnReal params vars states) -> (fromJust (Just (ReturnReal params vars states)))
        Just (ReturnBool params vars states) -> (fromJust (Just (ReturnBool params vars states)))
