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
                             , curScore :: Int
                             } deriving Show

initGame :: CrossyRoad
initGame = CrossyRoad { chicken  = initCoord
                      , state    = MainMenu
                      , maxScore = 0
                      , curScore = 0}