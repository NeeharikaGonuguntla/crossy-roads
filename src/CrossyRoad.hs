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
                             , grass :: [Coord]
                             , state    :: State
                             , maxScore :: Int
                             , curScore :: Int
                             , iterations :: Int
                             } deriving Show

initGame :: Int -> CrossyRoad
initGame ms = CrossyRoad { chicken  = initCoord
                      , carPos = initCars
                      , grass = initGrass
                      , state    = MainMenu
                      , maxScore = ms
                      , curScore = 0
                      , iterations = 0
                      }
