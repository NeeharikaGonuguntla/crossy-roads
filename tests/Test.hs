module Main where 
import Test.HUnit
import GameViewTest
import System.Exit


main :: IO ()

tests = TestList [TestLabel "test1" testUpdateScore1,
                  TestLabel "test2" testUpdateScore2,
                  TestLabel "test3" testUpdateScore3,
                  TestLabel "test4" testCheckChicken1,
                  TestLabel "test5" testChangeState1,
                  TestLabel "test6" testGrassCell,
                  TestLabel "test7" testCarCell]

main = do
  runTestTT tests
  exitWith ExitSuccess