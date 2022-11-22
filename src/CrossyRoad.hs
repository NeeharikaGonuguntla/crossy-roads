module CrossyRoad where

import Models.GameModel

data Tick = Tick

data State = MainMenu
           | Game
           | Paused
           | GameOver
    deriving (Show, Eq)

data CrossyRoad = CrossyRoad { chicken  :: Coord
                             , state    :: State
                             , maxScore :: Int
                             } deriving Show

initGame :: CrossyRoad
initGame = CrossyRoad {chicken = Coord {row = 0, col = dim `div` 2}, state = MainMenu, maxScore = 0}