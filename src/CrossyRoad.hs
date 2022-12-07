module CrossyRoad where

import Models.GameModel

data Tick = Tick

data State = MainMenu
           | Game
           | Paused
           | GameOver
    deriving (Show, Eq)

data CrossyRoad = CrossyRoad { chicken  :: Coord
                             , roads :: [Road]
                             , state    :: State
                             , maxScore :: Int
                             , curScore :: Int
                             }

initGame :: Int -> CrossyRoad
initGame ms = CrossyRoad { chicken  = initCoord
                      , roads = [initRoad r | r <- [0..(dim-1)]]
                      , state    = MainMenu
                      , maxScore = ms
                      , curScore = 0
                      }
