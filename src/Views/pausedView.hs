module Views.PausedView where

import Brick

import Brick.Widgets.Center (center)

import Text.Printf

import CrossyRoad
import Views.ViewHelper

pausedView :: CrossyRoad -> [Widget String]
pausedView g = [pausedView' g]

pausedView' :: CrossyRoad -> Widget String
pausedView' g = createWindow (vTile [ center (pause (curScore g) (maxScore g)) ])

pause :: Int -> Int -> Widget n
pause cur max = vBox [ str "______                        _ "
                     , str "| ___ \\                      | |"
                     , str "| |_/ /_ _ _   _ ___  ___  __| |"
                     , str "|  __/ _` | | | / __|/ _ \\/ _` |"
                     , str "| | | (_| | |_| \\__ \\  __/ (_| |"
                     , str "\\_|  \\__,_|\\__,_|___/\\___|\\__,_|"
                     , str " "
                     , str "Press Space to resume"
                     , str "Press Q to go back to the main menu"
                     , str " "
                     , str (printf "Current score: %d" cur)
                     , str (printf "High score: %d" max)]