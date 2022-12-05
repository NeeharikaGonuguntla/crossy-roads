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

-- Test cases for updateScore
testUpdateScore1 = TestCase (assertEqual "for (updateScore g)," 
    (curScore (updateScore g {chicken = Coord{row = 10, col = 9}})) (10))
testUpdateScore2 = TestCase (assertEqual "for (updateScore g)," 
    (curScore (updateScore g {chicken = Coord{row = 11, col = 9}, iterations=1})) (26))

-- Test cases for checkChicken
testCheckChicken1 = TestCase (assertEqual "for (checkChicken g)," 
    (row (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}})), 
    col (chicken (checkChicken g {chicken = Coord{row = 10, col = 9}}))) 
    (row(Coord{row = 10, col = 9}), col(Coord{row = 10, col = 9})))

-- Test cases for changeState
testChangeState1 = TestCase (assertEqual "for (changeState g),"
        (state(changeState GameOver g )) (GameOver))

-- Test cases for grassCell
testGrassCell = TestCase (assertEqual "for (grassPosition g),"
        (row(head initGrass)) (5))

-- Test cases for carCell
testCarCell = TestCase (assertEqual "for (carPosition g),"
        (row(head initCars)) (1))







