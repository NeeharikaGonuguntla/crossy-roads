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

g = initGame 0

-- Test cases for Game state
testGameState = TestCase (assertEqual "for (updateScore g 1)," 
    (state g)(MainMenu))

-- Test cases for updateScore
new_g = g {maxScore = 26, state = Game}
testUpdateScore1 = TestCase (assertEqual "CurrScoreDefaultIterationTest, " 
    (curScore (updateScore g {chicken = Coord{row = 10, col = 9}})) (10))

testUpdateScore2 = TestCase (assertEqual "CurrScoreSecondIterationTest, " 
    (curScore (updateScore g {chicken = Coord{row = 11, col = 12}, iterations=1})) (26))

testUpdateScore3 = TestCase (assertEqual "HighScoreFirstIterationTest, " 
    (maxScore (updateScore new_g {chicken = Coord{row = 6, col = 7}, iterations=0})) (26))

-- Test cases for Game state
testGameState2 = TestCase (assertEqual "GameViewTest, " 
    (state new_g)(Game))

-- Test cases for checkChicken
testCheckChicken1 = TestCase (assertEqual "ChickenCollidesCarTest, " 
    (row (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}})), 
    col (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}}))) 
    (row(Coord{row = 10, col = 9}), col(Coord{row = 10, col = 9})))

-- Test cases for changeState
testChangeState1 = TestCase (assertEqual "ChangeStateTest,"
        (state(changeState GameOver g )) (GameOver))

-- Test cases for grassCell
testGrassCell = TestCase (assertEqual "GrassPositionTest,"
        (row(head initGrass)) (5))

-- Test cases for carCell
testCarCell = TestCase (assertEqual "CarCellTest,"
        (row(head initCars)) (1))







