-- Test cases for GameView.hs

module GameViewTest where
import Test.HUnit
import Brick
import qualified Graphics.Vty as V
import qualified Brick.Types as T
import Brick.Widgets.Center (center)
import Views.ViewHelper

import Brick.Widgets.Border as B
import Brick.Widgets.Border.Style as BS
import Brick.Widgets.Center as C

import Views.GameView
import Models.GameModel
import CrossyRoad
import Control
import System.IO.Unsafe
import System.Random


-- Function to generate a random integer between a and b
chooseInt :: Int -> Int -> IO Int
chooseInt a b = randomRIO (a, b)

-- Function to convert IO Int to Int
getIOInt :: IO Int -> Int
getIOInt x = unsafePerformIO x

initCars :: [Coord]
initCars = [
            Coord {row = 1, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 2, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 3, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 4, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 6, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 6, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 7, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 7, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 8, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 8, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 9, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 9, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))}]

initGrass :: [Coord]
initGrass = [
            Coord {row = 5, col = 0},
            Coord {row = 5, col = 1},
            Coord {row = 5, col = 2},
            Coord {row = 5, col = 3},
            Coord {row = 5, col = 4},
            Coord {row = 5, col = 5},
            Coord {row = 5, col = 6},
            Coord {row = 5, col = 7},
            Coord {row = 5, col = 8},
            Coord {row = 5, col = 9},
            Coord {row = 5, col = 10},
            Coord {row = 5, col = 11},
            Coord {row = 5, col = 12},
            Coord {row = 5, col = 13},
            Coord {row = 5, col = 14},
            Coord {row = 5, col = 15},
            Coord {row = 5, col = 16},
            Coord {row = 5, col = 17},
            Coord {row = 5, col = 18},
            Coord {row = 5, col = 19},
            Coord {row = 5, col = 20},
            Coord {row = 10, col = 0},
            Coord {row = 10, col = 1},
            Coord {row = 10, col = 2},
            Coord {row = 10, col = 3},
            Coord {row = 10, col = 4},
            Coord {row = 10, col = 5},
            Coord {row = 10, col = 6},
            Coord {row = 10, col = 7},
            Coord {row = 10, col = 8},
            Coord {row = 10, col = 9},
            Coord {row = 10, col = 10},
            Coord {row = 10, col = 11},
            Coord {row = 10, col = 12},
            Coord {row = 10, col = 13},
            Coord {row = 10, col = 14},
            Coord {row = 10, col = 15},
            Coord {row = 10, col = 16},
            Coord {row = 10, col = 17},
            Coord {row = 10, col = 18},
            Coord {row = 10, col = 19},
            Coord {row = 10, col = 20}
            ]

g = initGame 0

-- Test cases for Game state
testGameState = TestCase (
    assertEqual "for (updateScore g 1)," 
    (state g)
    (MainMenu))

-- Test cases for updateScore
new_g = g {maxScore = 26, state = Game}
testUpdateScore1 = TestCase (
    assertEqual "CurrScoreDefaultIterationTest, " 
    (curScore 
        (updateScore 
            g {chicken = Coord{row = 10, col = 9}}
        )
    ) (10))

testUpdateScore2 = TestCase (
    assertEqual "CurrScoreSecondIterationTest, " 
    (curScore 
        (updateScore 
            g {chicken = Coord{row = 11, col = 12}}
        )
    ) (11))

testUpdateScore3 = TestCase (
    assertEqual "HighScoreFirstIterationTest, " 
    (maxScore 
        (updateScore 
            new_g {chicken = Coord{row = 6, col = 7}}
        )
    ) (26))

-- Test case for getRowsToDraw
testGetRoadsToDraw2 = TestCase (
    assertEqual "GetRowsToDrawTest, " 
    (getRowsToDraw 10 10) 
    ([5,6,7,8,9,10,11,12,13,14,15]))

-- Test cases for updateRoads
testUpdateRoads2 = TestCase (
    assertEqual "UpdateRoadsTest, " 
    (length (roads (updateRoads g))) 
    (length (roads g)))

-- Test cases for Game state
testGameState2 = TestCase (
    assertEqual "GameViewTest, " 
    (state new_g)(Game))

-- Test cases for checkChicken
testCheckChicken1 = TestCase (
    assertEqual "ChickenCollidesCarTest, " 
    (
        row (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}})), 
        col (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}}))
    ) 
    (
        row(Coord{row = 10, col = 9}), col(Coord{row = 10, col = 9})
    ))

-- Test cases for changeState
testChangeState1 = TestCase (
    assertEqual "ChangeStateTest,"
        (state(changeState GameOver g )) 
        (GameOver))

testChangeState2 = TestCase (
    assertEqual "ChangeStateTest,"
        (state(changeState Game g )) 
        (Game))

-- Test cases for updateRoads
testUpdateRoads1 = TestCase (
    assertEqual "UpdateRoadsTest, " 
    (length (roads (updateRoads g))) 
    (length (roads g)))

-- Test cases for getRowsToDraw
testGetRoadsToDraw1 = TestCase (
    assertEqual "GetRowsToDrawTest, " 
    (getRowsToDraw 10 20) 
    ([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]))





