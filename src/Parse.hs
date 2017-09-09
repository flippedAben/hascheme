module Parse where

import Text.ParserCombinators.Parsec
import System.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"
