module Main where

import System.Environment
import Parse

main :: IO ()
main = getArgs >>= putStrLn . readExpr . head
