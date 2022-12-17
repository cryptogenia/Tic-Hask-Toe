module A3 where

import A1
import A2

import Data.List (transpose)

-- *** Assignment 3-1 ***

-- Q#01
showInts :: [Int] -> [String]
showInts [] = []
showInts (x:xs) = show x : showInts xs

_HEADER_ :: String
_HEADER_  =  " " ++ formatLine (showInts _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
showSquares [] = []
--error was here -> showSquares (x:xs) = show x : showSquares xs
showSquares (x:xs) = showSquare x : showSquares xs

-- Q#03

formatRows :: [Row] -> [String]
formatRows [] = []
formatRows (x:xs) =  (formatLine (showSquares x)) : formatRows xs

-- Q#04
isColEmpty :: Row -> Int -> Bool
isColEmpty [] _ = False
isColEmpty (x:_) 0 = x == E
isColEmpty (_:xs) colIndex = isColEmpty xs (colIndex - 1)

-- Q#05
dropFirstCol :: Board -> Board
dropFirstCol [] = []
dropFirstCol (x:xs) = tail x : dropFirstCol xs


dropLastCol :: Board -> Board
dropLastCol [] = []
dropLastCol (x:xs) = init x : dropLastCol xs

-- Q#06
getDiag1 :: Board -> Line
getDiag1 [] = []
getDiag1 (x:xs) = head x : getDiag1 (dropFirstCol xs)


getDiag2 :: Board -> Line
getDiag2 [] = []
getDiag2 (x:xs) = last x : getDiag2 (dropLastCol xs)

getAllLines :: Board -> [Line]
getAllLines x = x ++ transpose x ++ [getDiag1 x] ++ [getDiag2 x]
 
-- *** Assignment 3-2 ***

-- Q#07
putSquare :: Player -> Board -> Move -> Board
putSquare _ [] (_,_) = []
putSquare p (x:xs) (r,c) = go 0 (x:xs)
    where 
    go _ [] = []
    go aux (x:xs) 
        | aux == r = replaceSquareInRow p c x : xs
        | otherwise = x : go  (aux+1) xs
        

-- Q#08
prependRowIndices :: [String] -> [String]
prependRowIndices x = go (indexRowStrings x)
 where 
        go []           = []
        go ((chr, str):xs) = (chr:str) : go xs

-- Q#09
isWinningLine :: Player -> Line -> Bool
isWinningLine _ [] = False
isWinningLine p l = go False l
 where
    go aux [] = aux
    go aux (x:xs) 
     | x == p = go True xs
     | otherwise = False

-- Q#10

isValidMove = undefined
