module Main where 
import Test.HUnit
import GameViewTest
import System.Exit


main :: IO ()

tests = TestList [TestLabel "test1" testUpdateScore1,
                  TestLabel "test2" testUpdateScore2,
                  TestLabel "test3" testCheckChicken1,
                  TestLabel "test4" testChangeState1,
                  TestLabel "test5" testGrassCell]

main = do
  runTestTT tests
  exitWith ExitSuccess