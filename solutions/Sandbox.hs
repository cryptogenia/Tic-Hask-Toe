module Sandbox where

--live programming A2
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' q (x:xs) =  q == x || elem' q xs 

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

last' :: [a] -> a
last' [] = error "empty list"
last' (x:[]) = x
last' (_:xs) = last' xs

init' :: [a] -> [a]
init' [] = error "empty list"
init' (_:[]) = []
init' (_:xs) = xs