module Parse where

import System.Environment
import Text.ParserCombinators.Parsec
import qualified Data.Text as T

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input =
  case parse symbol "scheme" input of
    Left err  -> "No match: " ++ show err
    Right val -> "Found value"
