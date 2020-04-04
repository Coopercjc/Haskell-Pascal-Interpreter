{

{-# LANGUAGE OverloadedStrings                 #-}
{-# LANGUAGE NoMonomorphismRestriction          #-}
{-# LANGUAGE CPP                                #-}
{-# OPTIONS_GHC -fno-warn-unused-binds          #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures    #-}
{-# OPTIONS_GHC -fno-warn-unused-matches        #-}
{-# OPTIONS_GHC -fno-warn-unused-imports        #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing        #-}
{-# OPTIONS_GHC -fno-warn-tabs                  #-}
{-# OPTIONS_GHC -funbox-strict-fields           #-}

module Pascal.Lexer
  ( Alex(..)
  , AlexPosn(..)
  , AlexState(..)
  , Token(..)
  , TokenClass(..)
  , alexError
  , alexMonadScan
  , runAlex
  , tokenToPosN
  )
where

import System.Exit
import qualified Data.ByteString.Lazy.Char8 as B
}

%wrapper "monadUserState-bytestring"

$digit = 0-9                    -- digits
$alpha = [a-zA-Z]               -- alphabetic characters


-- TODO: Map symbols into token types (with or without parameters)
tokens :-
  $white+                               ; -- remove multiple white-spaces
  "//".*                                ; -- skip one line comments
  $digit+ "." $digit+ | $digit+         { tok_read     TokenReal }
  True|False                            { tok_read     TokenBool }
  "'" [$alpha $digit \ ]* "'"           { tok_string   TokenStr }
  \:=                                   { tok_string   TokenOp }
  [\+]|[\-]|[\*]|[\/]|[\=]|[\<>]|[\>]
  |[\<]|[\>=]|[\<=]|and|not|or
  |sqrt|ln|exp|sin|cos                  { tok_string   TokenOp }
  [\(]|[\)]|[\;]|[\:]|[\.]|[\,]
  |program|var|function|procedure
  |begin|real|boolean|end|true|false
  |for|while|case|break|continue
  |if|else|then|of|to|do|writeln|readln { tok_string   TokenK }
  $alpha [$alpha $digit \_ \']*         { tok_string   TokenID }

{

-- Some action helpers:
tok' f (p, _, input, _) len = return $ Token p (f (B.take (fromIntegral len) input))
tok x = tok' (\s -> x)
tok_string x = tok' (\s -> x (B.unpack s))
tok_read x = tok' (\s -> x (read (B.unpack s)))

-- The token type:
data Token = Token AlexPosn TokenClass
  deriving (Show)

tokenToPosN :: Token -> AlexPosn
tokenToPosN (Token p _) = p


-- TODO: Add your own token types here
data TokenClass
 = TokenOp     String
 | TokenK      String
 | TokenStr    String
 | TokenReal   Float
 | TokenBool   Bool
 | TokenID     String
 | TokenEOF
 deriving (Eq, Show)

alexEOF :: Alex Token
alexEOF = do
  (p, _, _, _) <- alexGetInput
  return $ Token p TokenEOF

type AlexUserState = ()
alexInitUserState = ()
}
