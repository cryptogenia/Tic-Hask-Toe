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
isTied x 
| 


-- Q#06

indexRowStrings = undefined

-- Q#07

formatLine = undefined

-- *** Assignment 2-2 *** --

-- Q#08

isMoveInBounds = undefined

-- Q#09

stringToMove = undefined

-- Q#10

replaceSquareInRow = undefined