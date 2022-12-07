module Control where

import Brick
import qualified Graphics.Vty as V
import qualified Brick.Types as T

import Models.GameModel
import CrossyRoad

control :: CrossyRoad -> BrickEvent n Tick -> EventM n (Next CrossyRoad)
control g ev = case state g of
  MainMenu -> mainMenuControl g ev
  Game     -> gameControl g ev
  Paused   -> pausedControl g ev
  GameOver -> gameOverControl g ev

mainMenuControl :: CrossyRoad -> BrickEvent n Tick -> EventM n (Next CrossyRoad)
mainMenuControl g ev = case ev of
  AppEvent Tick                   -> Brick.continue g
  T.VtyEvent (V.EvKey V.KEnter _) -> Brick.continue (changeState Game g)
  T.VtyEvent (V.EvKey V.KEsc _)   -> Brick.halt g
  _                               -> Brick.continue g

gameControl :: CrossyRoad -> BrickEvent n Tick -> EventM n (Next CrossyRoad)
gameControl g ev = case ev of
  AppEvent Tick                        -> Brick.continue (mainFunction g)
  T.VtyEvent (V.EvKey V.KLeft _)       -> Brick.continue (move left  g)
  T.VtyEvent (V.EvKey V.KRight _)      -> Brick.continue (move right g)
  T.VtyEvent (V.EvKey V.KUp   _)       -> Brick.continue (move up    g)
  T.VtyEvent (V.EvKey V.KDown _)       -> Brick.continue (move down  g)
  T.VtyEvent (V.EvKey (V.KChar ' ') _) -> Brick.continue (changeState Paused g)
  T.VtyEvent (V.EvKey (V.KChar 'o') _) -> Brick.continue (changeState GameOver (updateMaxScore g))
  T.VtyEvent (V.EvKey V.KEsc _)        -> Brick.halt g
  _                                    -> Brick.continue g

pausedControl :: CrossyRoad -> BrickEvent n Tick -> EventM n (Next CrossyRoad)
pausedControl g ev = case ev of
  AppEvent Tick                        -> Brick.continue g
  T.VtyEvent (V.EvKey V.KEsc _)        -> Brick.halt g
  T.VtyEvent (V.EvKey (V.KChar ' ') _) -> Brick.continue (changeState Game g)
  T.VtyEvent (V.EvKey (V.KChar 'q') _) -> Brick.continue (changeState MainMenu g)
  T.VtyEvent (V.EvKey (V.KChar 'Q') _) -> Brick.continue (changeState MainMenu g)
  _                                    -> Brick.continue g

gameOverControl :: CrossyRoad -> BrickEvent n Tick -> EventM n (Next CrossyRoad)
gameOverControl g ev = case ev of
  AppEvent Tick                   -> Brick.continue g
  T.VtyEvent (V.EvKey V.KEnter _) -> Brick.continue (changeState MainMenu (resetGame g))
  T.VtyEvent (V.EvKey V.KEsc _)   -> Brick.halt g
  _                               -> Brick.continue g

resetGame :: CrossyRoad -> CrossyRoad
resetGame g = g { chicken = initCoord, curScore = 0, roads = [initRoad r | r <- [0..(dim-1)]] }

changeState :: State -> CrossyRoad -> CrossyRoad
changeState s g = g { state = s }

move :: (Coord -> Coord) -> CrossyRoad -> CrossyRoad
move dir  g = updateRoads (g { chicken = dir (chicken g) })

updateRoads :: CrossyRoad -> CrossyRoad
updateRoads g = if length (roads g) - row (chicken g) == ((dim `div` 2) + 1)
                then g { roads = append (roads g) (initRoad (length (roads g))) }
                else g
  where
    append [] elm = [elm]
    append (x:xs) elm = x:append xs elm

updateScore :: CrossyRoad -> CrossyRoad
updateScore g = g { curScore = max (curScore g) (row (chicken g)) }

updateMaxScore :: CrossyRoad -> CrossyRoad
updateMaxScore g = g { maxScore = max (maxScore g) (curScore g) }

mainFunction :: CrossyRoad -> CrossyRoad
mainFunction g = updateScore (checkChicken (moveCar  g))

moveCar :: CrossyRoad -> CrossyRoad
moveCar g = g { roads = [moveCarHelper road | road <- roads g] }

moveCarHelper :: Road -> Road
moveCarHelper r = if DirLeft == direction r
                  then r { layout = removeFirst (layout r) ++ [0] }
                  else r { layout = 0 : removeLast (layout r) }

removeFirst :: [a] -> [a]
removeFirst [] = []
removeFirst (_:xs) = xs

removeLast :: [a] -> [a]
removeLast [] = []
removeLast [_] = []
removeLast (x:xs) = x:removeLast xs

checkChicken :: CrossyRoad -> CrossyRoad
checkChicken g = do
  if any (\road -> (rowNum road == row (chicken g)) && layout road !! col (chicken g) == 1) (roads g)
    then changeState GameOver (updateMaxScore g)
    else g
