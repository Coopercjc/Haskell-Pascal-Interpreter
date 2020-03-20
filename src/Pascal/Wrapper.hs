module Pascal.Wrapper
  ( parse
  , parseString
  , Error(..)
  , ErrClass(..)
  )
  where

----------------------------------------------------------------------------
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.Char8 as BLC

import           Data.List            (isPrefixOf)
----
import           Pascal.Lexer            (runAlex)
import           Pascal.Data            (Program)
import           Pascal.Parser          (happyParser)
----------------------------------------------------------------------------

data ErrClass
    = Syntactical (Maybe String)
    | Lexical
    | Message String
    deriving (Show, Eq)

data Error = Error
    { errLine  :: Int
    , errPos   :: Int
    , errClass :: ErrClass
    } deriving (Show, Eq)

parse :: BL.ByteString -> Either Error Program
parse s =
    -- Alex's error type is a String, that we have to parse here,
    -- otherwise we cannot get type-safe information out of 'parse'.
    let showErrPrefix = "show-error: " :: String
        lexicalErrorPrefix = "lexical error at line " :: String
     in case runAlex s $ happyParser of
            Right x -> Right x
            Left str | showErrPrefix `isPrefixOf` str ->
                          let (line, column, m) =
                                  (read (drop (length showErrPrefix) str) :: (Int, Int, Maybe String))
                           in Left (Error line column (Syntactical m))
                     | lexicalErrorPrefix `isPrefixOf` str ->
                          let info = drop (length lexicalErrorPrefix) str
                              lineStr = takeWhile (/= ',') info
                              columnStr = drop (9 + length lineStr) info
                           in Left (Error (read lineStr) (read columnStr) Lexical)
                     | otherwise  -> Left (Error 0 0 (Message str))

-- string version of above function for testing and running
parseString :: String -> Either Error Program
parseString s = parse $ BLC.pack s 