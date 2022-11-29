module A1 where

import Data.Char (toUpper)

-- *** Assignment 1-1 *** --

-- Q#01
_SIZE_ :: Integer
_SIZE_ = 3

-- Q#02
_DISPLAY_LOGO_ :: Bool
_DISPLAY_LOGO_ = True

-- Q#03
convertRowIndex :: Char -> Int
convertRowIndex x  =   fromEnum (toUpper x)  - 65

-- Q#04
_INVALID_MOVE_ :: (Int, Int)
_INVALID_MOVE_ = (-1, -1)

-- Q#05
_SEP_ :: String 
_SEP_ = "a|e|y"

-- *** Assignment 1-2 *** --

-- Q#06
data Square = X | O | E
        deriving (Show, Eq)


-- Q#07
data GameState = X_victory | O_victory | Tie | In_progress
        deriving(Show, Eq, Enum)


-- Q#08
type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)




-- Q#09
getFirstPlayer :: Bool -> Player
getFirstPlayer x = 
    if x  
        then X
        else O



getFirstPlayer_ :: Bool -> Player
getFirstPlayer_ x
  | x = X
  | otherwise = O


-- Q#10
showGameState :: GameState -> String
showGameState gs = case gs of
    X_victory -> "X wins"
    O_victory -> "O wins"
    Tie -> "It's a tie"
    _ -> "Game in progress"

-- Q#11
switchPlayer :: Player -> Player
switchPlayer X = O
switchPlayer O = X
switchPlayer _ = E

-- Q#12
showSquare :: Square -> String
showSquare x
  | x == X = "x"
  | x == O = "o"
  | otherwise = "_"