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
                  TestLabel "test6" testUpdateRoads1,
                  TestLabel "test7" testGetRoadsToDraw1,
                  TestLabel "test8" testGameState,
                  TestLabel "test9" testGameState2,
                  TestLabel "test10" testGetRoadsToDraw2,
                  TestLabel "test11" testChangeState2,
                  TestLabel "test12" testUpdateRoads2]

main = do
  runTestTT tests
  exitWith ExitSuccess