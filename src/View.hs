module View where

import Brick

import CrossyRoad 
import Views.MainMenuView
import Views.GameView
import Views.PausedView
import Views.GameOverView

view :: CrossyRoad -> [Widget String]
view g
  | state g == MainMenu = mainMenuView g
  | state g == Game     = gameView g
  | state g == Paused   = pausedView g
  | otherwise           = gameOverView g