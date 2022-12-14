{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module A2 where

import A1
import Data.List (intercalate)

-- *** Assignment 2-1 *** --

-- Q#01
promptPlayer :: Player -> [String]
promptPlayer x =  concat [["Player "], [show x], [" 's turn: enter a row and column position (ex. A1)"]]

-- Q#02
_RANGE_ :: [Int]
_RANGE_ = [0 .. _SIZE_-1]

-- Q#03
isDigit :: Char -> Bool
isDigit x =  x `elem` ['0' .. '9']

readDigit :: Char -> Int
readDigit  x 
  | isDigit x = read [x]
  | otherwise = -1
-- Q#04

_EMPTY_ROW_ = replicate _SIZE_ E


_EMPTY_BOARD_ = replicate _SIZE_ _EMPTY_ROW_

-- Q#05

_TIED_BOARD_ :: Board
_TIED_BOARD_ = [
    [X, O, O]
  , [O, X, X]
  , [O, X, O]
  ]

isTied :: Board -> Bool
isTied x = E `notElem` concat x


-- Q#06
indexRowStrings :: [String] -> [(Char, String)]
indexRowStrings x = zip ['A' .. ] x

-- Q#07
formatLine :: [String] -> String
formatLine x = concat [ _SEP_, intercalate _SEP_ x, _SEP_]

-- *** Assignment 2-2 *** --

-- Q#08
isMoveInBounds :: Move -> Bool
isMoveInBounds (x, y) = xValid && yValid
  where 
    xValid = x `elem` [0 .. _SIZE_-1]
    yValid = x `elem` [0 .. _SIZE_-1]

-- Q#09
stringToMove :: String -> Move
stringToMove [x,y] = (convertRowIndex x, readDigit y)
stringToMove _ = _INVALID_MOVE_

-- Q#10
rsX :: Int -> Row -> Row
rsX cIndex row = replaceSquareInRow X cIndex row 

rsO :: Int -> Row -> Row
rsO cIndex row = replaceSquareInRow O cIndex row 

replaceSquareInRow :: Player -> Int -> Row -> Row
replaceSquareInRow player cIndex row 
      | cIndex >= length row || cIndex < 0  = row
      | otherwise = x ++ player:ys
           where (x,_:ys)= splitAt cIndex row 


  
  
  --splitAt i (row)