module A5 where

import A1
import A2
import A3
import A4

import System.Random.Stateful (globalStdGen, uniformM)
import Control.Monad (when)

-- *** Assignment 5-1 *** --

-- Q#01 Write an action printBoard that takes a Board value, formats it using formatBoard, and prints the resulting string to the terminal.
printBoard :: Board -> IO ()
printBoard brd = putStrLn $ formatBoard brd

-- Q#02 Write an action printLogo that reads the logo art from an external .txt file and prints it to the terminal.
_LOGO_PATH_ :: FilePath
_LOGO_PATH_ = "./assets/logo.txt"
 
printLogo :: IO ()
printLogo = readFile _LOGO_PATH_ >>= putStrLn

-- Q#03 Write an action firstPlayer which composes the provided _RANDOM_BOOL constant with a lambda expression that applies getFirstPlayer and returns the corresponding Player value in the IO context.
_RANDOM_BOOL_ :: IO Bool
_RANDOM_BOOL_ = uniformM globalStdGen

firstPlayer :: IO Player
firstPlayer = _RANDOM_BOOL_ >>=  return . (\x -> getFirstPlayer x)

-- Q#04 Write an action getMove that takes a Board value as input, receives a move string from the user, validates the move, and then does one of the following
--getMove :: Board
getMove brd = getLine >>= go "xdsad"
 where 
    go move
     | _ = move
     --   go move 
      --   | "está vacío" = "está vacío"
      --   | otherwise = "has escrito " ++ move


--getLine >>= return . (\x -> "test "  ++ x )
-- Q#05

play = undefined

-- *** Assignment 5-2 *** --

-- Q#07

printLogoDo = undefined

-- Q#08

firstPlayerDo = undefined

-- Q#09

getMoveDo = undefined

-- Q#10

playDo = undefined