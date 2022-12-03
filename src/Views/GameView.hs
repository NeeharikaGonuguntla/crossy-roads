module Views.GameView where

import Brick

import Brick.Widgets.Center (center)

import CrossyRoad
import Models.GameModel
import Views.ViewHelper

gameView :: CrossyRoad -> [Widget String]
gameView g = [gameView' g]

gameView' :: CrossyRoad -> Widget String
gameView' g = createWindow (vTile [ makeRow g row | row <- reverse [0..dim-1] ])

makeRow :: CrossyRoad -> Int -> Widget n
makeRow g row = hTile [ makeCell g row col | col <- [0..dim-1] ]

makeCell :: CrossyRoad -> Int -> Int -> Widget n
makeCell g r c
  | row (chicken g) == r && col (chicken g) == c = center chickenCell
  | any (\x -> row x == r && col x == c) (carPos g) = center carCell 
  | any (\x -> row x == r && col x == c) (grass g) = center grassCell 
  | otherwise                                    = center blankCell

chickenCell, blankCell:: Widget n
chickenCell = vBox [ str "🐔" ]
blankCell = vBox [ str " " ]
carCell = vBox [ str "🚗" ]
grassCell = vBox [str "🎄"]