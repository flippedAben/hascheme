module Parse where

import System.Environment
import Text.ParserCombinators.Parsec
import qualified Data.Text as T
import Control.Monad (when)

data LispVal
  = Identifier String
  | List [LispVal]
  | Number Integer
  | String String
  | Bool Bool

extAlphaChar :: Parser Char
extAlphaChar = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input =
  case parse parseExpr "scheme" input of
    Left err  -> "No match: " ++ show err
    Right val -> "Found value"

spaces1 :: Parser ()
spaces1 = skipMany1 space

parseId :: Parser LispVal
parseId  = do
  first <- letter <|> extAlphaChar
  other <- many (letter <|> digit <|> extAlphaChar)
  let id = first:other
  return $
    case id of
      "#t" -> Bool True
      "#f" -> Bool False
      -- "#\\":char -> Character
      -- "#(":vector -> Vector
      -- "#{eibodx}":vector -> Vector
      _   -> Identifier id

parseString :: Parser LispVal
parseString = do
  char '"'
  x <- many (noneOf "\"")
  char '"'
  return $ String x

parseExpr :: Parser LispVal
parseExpr =  parseId
         <|> parseString
