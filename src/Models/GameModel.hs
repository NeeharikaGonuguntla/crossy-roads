module Models.GameModel where

data Coord = Coord { row :: Int
                   , col :: Int
                   } deriving (Show, Eq)

initCoord :: Coord
initCoord = Coord {row = 0, col = dim `div` 2}

data Direction = DirLeft
               | DirRight
               deriving (Show, Eq)

data Road = Road { rowNum :: Int
                 , direction :: Direction
                 , carWeight :: Int
                 , layout :: [Int]
                 } deriving Show

initRoad :: Int -> Road
initRoad row = Road { rowNum = row
                    , direction = DirRight
                    , carWeight = row
                    , layout = [car | _ <- [1..dim]]
                    }
  where
    car = if row >= 1 then 1 else 0

dim :: Int
dim = 15

up :: Coord -> Coord
up p = p
  { row = row p + 1
  }

down :: Coord -> Coord
down p = p
  { row = max 0 (row p - 1)
  }

left :: Coord -> Coord
left p = p
  { col   = max 0 (col p - 1)
  }

right :: Coord -> Coord
right p = p
  { col = min (dim-1) (col p + 1)
  }