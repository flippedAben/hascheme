module Main where

import System.Environment
import Parse

main :: IO ()
main = getArgs >>= print . readExpr . head
