module Models.GameModel where

data Coord = Coord { row :: Int
                   , col :: Int
                   } deriving Show

initCoord :: Coord
initCoord = Coord {row = 0, col = dim `div` 2}

initCar :: Coord
initCar = Coord {row = 1, col = dim `div` 2}

initCars :: [Coord]
initCars = [
            Coord {row = 4, col = dim `div` 2},
            Coord {row = 5, col = dim `div` 3},
            Coord {row = 6, col = dim `div` 4},
            Coord {row = 7, col = dim `div` 5},
            Coord {row = 8, col = dim `div` 6},
            Coord {row = 9, col = dim `div` 2},
            Coord {row = 10, col = dim `div` 3}]

dim :: Int
dim = 21

up :: Coord -> Coord 
up p = p 
  { row = min (dim-1) (row p + 1)
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