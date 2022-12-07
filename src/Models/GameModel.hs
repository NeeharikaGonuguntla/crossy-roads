module Models.GameModel where

import Data.Bits

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
                 , updateRate :: Int -- the higher, the slower
                 , curTime :: Int
                 , layout :: [Int]
                 } deriving Show

initRoad :: Int -> Road
initRoad row = Road { rowNum = row
                    , direction = getDir row
                    , updateRate = max 1 (10 - (row `div` 10))
                    , curTime = 0
                    , layout = genRoad row
                    }
  where
    getDir r = if r `mod` 3 == 0 || r `mod` 5 == 0
               then DirRight
               else DirLeft

genRoad :: Int -> [Int]
genRoad row
  | even row  = res
  | otherwise = reverse res 
  where
    res = [min 1 ((.&.) row (2^x)) | x <- [0..(dim-2)]]++[0]

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