module Views.GameOverView where

import Brick

import Brick.Widgets.Center (center)

import Text.Printf

import CrossyRoad
import Views.ViewHelper

gameOverView :: CrossyRoad -> [Widget String]
gameOverView g = [gameOverView' g]

gameOverView' :: CrossyRoad -> Widget String
gameOverView' g = createWindow (vTile [ center (gameOver (curScore g) (maxScore g)) ])

gameOver :: Int -> Int -> Widget n
gameOver cur max = vBox [ str "   ______                        ____                 "
                        , str "  / ____/___ _____ ___  ___     / __ \\_   _____  _____"
                        , str " / / __/ __ `/ __ `__ \\/ _ \\   / / / / | / / _ \\/ ___/"
                        , str "/ /_/ / /_/ / / / / / /  __/  / /_/ /| |/ /  __/ /    "
                        , str "\\____/\\__,_/_/ /_/ /_/\\___/   \\____/ |___/\\___/_/ "
                        , str " "
                        , str "Press Enter to go back to main menu"
                        , str "Press Esc to quit"
                        , str " "
                        , str (printf "Score: %d" cur)
                        , str (printf "High score: %d" max)]