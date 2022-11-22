module Models.GameModel where

data Coord = Coord { row :: Int
                   , col :: Int
                   } deriving Show

initCoord :: Coord
initCoord = Coord {row = 0, col = dim `div` 2}

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