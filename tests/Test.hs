import Test.Tasty
import Test.Tasty.HUnit
import System.IO.Silently

main :: IO ()
main = defaultMain testSuite

testSuite :: TestTree
testSuite =
  testGroup "Unit Tests"
  [
    testCase "Unity" $ test1 1
  ]

test1 n = do
  (out, _) <- capture (print n)
  assert (out == "1" ++ "\n")
