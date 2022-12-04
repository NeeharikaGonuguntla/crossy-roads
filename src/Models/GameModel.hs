module Models.GameModel where
import System.IO.Unsafe
import System.Random

data Coord = Coord { row :: Int
                   , col :: Int
                   } deriving Show

initCoord :: Coord
initCoord = Coord {row = 0, col = dim `div` 2}

-- Function to generate a random integer between a and b
chooseInt :: Int -> Int -> IO Int
chooseInt a b = randomRIO (a, b)

-- Function to convert IO Int to Int
getIOInt :: IO Int -> Int
getIOInt x = unsafePerformIO x

initCars :: [Coord]
initCars = [
            Coord {row = 1, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 2, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 3, col = getIOInt (chooseInt 0 (dim-1))},
            Coord {row = 4, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 6, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 6, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 7, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 7, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 8, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 8, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 9, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 9, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 11, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 12, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 13, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 14, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 16, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 17, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 18, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 19, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))},
            Coord {row = 20, col = getIOInt(chooseInt 0 (dim-1))}]

initGrass :: [Coord]
initGrass = [
            Coord {row = 5, col = 0},
            Coord {row = 5, col = 1},
            Coord {row = 5, col = 2},
            Coord {row = 5, col = 3},
            Coord {row = 5, col = 4},
            Coord {row = 5, col = 5},
            Coord {row = 5, col = 6},
            Coord {row = 5, col = 7},
            Coord {row = 5, col = 8},
            Coord {row = 5, col = 9},
            Coord {row = 5, col = 10},
            Coord {row = 5, col = 11},
            Coord {row = 5, col = 12},
            Coord {row = 5, col = 13},
            Coord {row = 5, col = 14},
            Coord {row = 5, col = 15},
            Coord {row = 5, col = 16},
            Coord {row = 5, col = 17},
            Coord {row = 5, col = 18},
            Coord {row = 5, col = 19},
            Coord {row = 5, col = 20}
            ]

dim :: Int
dim = 15

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