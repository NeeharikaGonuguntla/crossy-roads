module View where

import Brick

import CrossyRoad 
import Views.MainMenuView
import Views.GameView

view :: CrossyRoad -> [Widget String]
view g
  | state g == MainMenu = mainMenuView g
  | state g == Game     = gameView g
  | otherwise           = [emptyWidget]