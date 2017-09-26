module Parse where

import System.Environment
import Text.ParserCombinators.Parsec
import qualified Data.Text as T
import Evaluate

readExpr :: String -> String
readExpr input =
  case parse parseExpr "scheme" input of
    Left err  -> "No match: " ++ show err
    Right val -> "Found: " ++ show val

extAlphaChar :: Parser Char
extAlphaChar = oneOf "!#$%&|*+-/:<=>?@^_~"

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
      -- "#{eibodx}":base -> Number
      _   -> Identifier id

parseString :: Parser LispVal
parseString = do
  char '"'
  x <- many (noneOf "\"")
  char '"'
  return $ String x

parseNumber :: Parser LispVal
parseNumber = (Number. read) <$> many1 digit

parseExpr :: Parser LispVal
parseExpr =  parseId
         <|> parseString
         <|> parseNumber
