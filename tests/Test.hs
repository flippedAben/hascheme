import Parse
import Test.Tasty
import Test.Tasty.HUnit
import System.IO.Silently

main :: IO ()
main = defaultMain testSuite

testSuite :: TestTree
testSuite =
  testGroup "Unit Tests"
  [
    testGroup "Irrelevent"
    [
      testCase "Unity" $ test1 1
    ],
    testGroup "Parse"
    [
      testCase "1" $ isSymbol "!"
    ]
  ]

test1 n = do
  (out, _) <- capture (print n)
  assert (out == "1" ++ "\n")

isSymbol ch = do
  assert (readExpr ch == "Found value")
