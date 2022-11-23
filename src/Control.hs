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
  AppEvent Tick                        -> Brick.continue g -- This should be updated to update traffic in the roads
  T.VtyEvent (V.EvKey V.KLeft _)       -> Brick.continue (move left  g)
  T.VtyEvent (V.EvKey V.KRight _)      -> Brick.continue (move right g)
  T.VtyEvent (V.EvKey V.KUp   _)       -> Brick.continue (move up    g)
  T.VtyEvent (V.EvKey V.KDown _)       -> Brick.continue (move down  g)
  T.VtyEvent (V.EvKey (V.KChar ' ') _) -> Brick.continue (changeState Paused g)
  T.VtyEvent (V.EvKey (V.KChar 'o') _) -> Brick.continue (changeState GameOver g) -- remove this, only here for testing
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
  T.VtyEvent (V.EvKey V.KEnter _) -> Brick.continue (changeState MainMenu (resetInitPosition g))
  T.VtyEvent (V.EvKey V.KEsc _)   -> Brick.halt g
  _                               -> Brick.continue g

resetInitPosition :: CrossyRoad -> CrossyRoad
resetInitPosition g = g { chicken = initCoord }

changeState :: State -> CrossyRoad -> CrossyRoad
changeState s g = g { state = s }

move :: (Coord -> Coord) -> CrossyRoad -> CrossyRoad
move dir g = g { chicken = dir (chicken g) }
