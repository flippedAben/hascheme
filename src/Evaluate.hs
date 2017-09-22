module Evaluate where

import System.Environment

data LispVal
  = Identifier String
  | List [LispVal]
  | Number Integer
  | String String
  | Bool Bool

instance Show LispVal where show = showVal

showVal :: LispVal -> String
showVal (Identifier x) = x
showVal (String x) = "\"" ++ x ++ "\""
showVal (Bool True) = "#t"
showVal (Bool False) = "#f"
