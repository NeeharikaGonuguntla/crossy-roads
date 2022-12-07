module Views.GameView where

import Brick

import CrossyRoad
import Models.GameModel
import Views.ViewHelper

import Brick.Widgets.Border as B
import Brick.Widgets.Border.Style as BS
import Brick.Widgets.Center as C

drawScore :: CrossyRoad -> Widget String
drawScore g = withBorderStyle BS.unicodeBold
 $ B.borderWithLabel (str " Score ")
 $ C.hCenter
 $ padAll 1
 $ str $ show (curScore g)

-- drawMaxScore :: CrossyRoad -> Int -> Widget String
-- drawMaxScore g n = withBorderStyle BS.unicodeBold
--  $ B.borderWithLabel (str "Max score")
--  $ C.hCenter
--  $ padAll 1
--  $ str $ show n 

drawCurScoreStats :: CrossyRoad -> Widget String
drawCurScoreStats g = hLimit 20
 $ vBox [drawScore g]

-- drawMaxStats :: CrossyRoad -> Widget String
-- drawMaxStats g = hLimit 11
--  $ vBox [ drawMaxScore g maxScore | maxScore <- [maxScore g]]

gameView :: CrossyRoad -> [Widget String]
gameView g = [gameView' g]

gameView' :: CrossyRoad -> Widget String
-- gameView' g =  vBox [drawCurScoreStats g, drawMaxStats g] <+> createWindow (vTile [ makeRow g row | row <- reverse [0..dim-1] ]) 
gameView' g =  drawCurScoreStats g <+> createWindow (vTile [ makeRow g row | row <- reverse (getRowsToDraw cRow dim) ])
  where
    cRow = row (chicken g)

getRowsToDraw :: Int -> Int -> [Int]
getRowsToDraw cRow dim = if cRow < halfDim then [0..dim-1] else [(cRow-halfDim)..(cRow-1)]++[cRow]++[(cRow+1)..(cRow+halfDim)]
  where
    halfDim = dim `div` 2

makeRow :: CrossyRoad -> Int -> Widget n
makeRow g row = hTile [ makeCell g row col | col <- [0..dim-1] ]

makeCell :: CrossyRoad -> Int -> Int -> Widget n
makeCell g r c
  | row (chicken g) == r && col (chicken g) == c = center chickenCell
  | any (\road -> rowNum road == r && layout road !! c == 1) (roads g) = center carCell
  | otherwise                                    = center blankCell

chickenCell, blankCell, carCell:: Widget n
chickenCell = vBox [ str "🐔" ]
blankCell = vBox [ str " " ]
carCell = vBox [ str "🚗" ]