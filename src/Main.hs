module Main where

import Pascal
import System.Environment

main :: IO ()
main = do
    -- Read in file name from program arguments
    (fileName:_) <- getArgs
    -- Read the contents of the file to "contents"
    contents <- readFile fileName
    -- Parse contents
    case parseString contents of 
        Left err -> print $ show err
        Right ast -> putStrLn $ interpret ast 

