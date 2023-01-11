module A4 where

import A1
import A2
import A3 hiding (
  _HEADER_,
  showSquares,
  dropFirstCol,
  dropLastCol,
  formatRows,
  isWinningLine,
  prependRowIndices
  )

-- *** Assignment 4-1 *** --

-- Q#01

_HEADER_ :: String
_HEADER_  =  " " ++ formatLine (map show _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
--EMPshowSquares [] = []
showSquares str = map showSquare str 

-- Q#03

dropFirstCol :: Board -> Board
--dropFirstCol [] = []
dropFirstCol str = map tail str

-- Q#04

dropLastCol :: Board -> Board
dropLastCol str = map init str

--Q#05

formatRows :: [Row] -> [String]
formatRows str =  map  (\x -> formatLine (showSquares x)) str
--formatRows str =  map  (\x -> formatLine x) showSquares str
--formatRows (x:xs) =  (formatLine (showSquares x)) : formatRows xs

-- Q#06
isWinningLine_ :: Player -> Line -> Bool
isWinningLine_ _ [] = False
isWinningLine_ p l = null $ filter (\x -> not $ p == x) l 

-- *** Assignment 4-2 *** --

-- Q#07
isWinningLine :: Player -> Line -> Bool
isWinningLine _ [] = False
isWinningLine p l = foldr (\x aux ->  x == p && aux) True l

-- Q#08
hasWon :: Player -> Board -> Bool
hasWon _ [] = False
hasWon p b = foldr (\x aux -> aux || isWinningLine p x ) False (getAllLines b)

_X_WIN_ = [ [X, O, O]
          , [O, X, O]
          , [O, O, X]
          ]

_O_WIN_ = [ [O, X, O]
          , [X, X, O]
          , [X, O, O]
          ]
-- Q#09
getGameState :: Board -> GameState
getGameState brd 
  | hasWon X brd = X_victory
  | hasWon O brd = O_victory
  | 'E' `elem` show brd = In_progress
  | otherwise = Tie


playMove :: Player -> Board -> Move -> (GameState, Board)
playMove p brd m = let newbrd = putSquare p brd m
  in (getGameState $ newbrd, newbrd)

-- Q#10
prependRowIndices :: [String] -> [String]
--prependRowIndices x = zipWith (++) (map (:[]) ['A'.. ]) x
prependRowIndices x = zipWith (:) ['A'.. ] x

-- Q#11
formatBoard :: Board -> String 
formatBoard brd = unlines $ _HEADER_ : ( prependRowIndices $  formatRows brd)
