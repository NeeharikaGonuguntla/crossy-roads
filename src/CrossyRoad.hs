module CrossyRoad where

import Models.GameModel

data Tick = Tick

data State = MainMenu
           | Game
           | Paused
           | GameOver
    deriving (Show, Eq)

data CrossyRoad = CrossyRoad { chicken  :: Coord
                             , carPos :: [Coord]
                             , state    :: State
                             , maxScore :: Int
                             , curScore :: Int
                             } deriving Show

initGame :: CrossyRoad
initGame = CrossyRoad { chicken  = initCoord
                      , carPos = initCars
                      , state    = MainMenu
                      , maxScore = 0
                      , curScore = 0}