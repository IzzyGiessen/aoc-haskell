import System.IO
import Data.List
import Control.Monad

play :: String -> Int
play x = case x of
  ('A':_:r:[]) -> case r of
    'X' -> 3
    'Y' -> 4
    'Z' -> 8
  ('B':_:r:[]) -> case r of
    'X' -> 1
    'Y' -> 5
    'Z' -> 9
  ('C':_:r:[]) -> case r of
    'X' -> 2
    'Y' -> 6
    'Z' -> 7
  _            -> error x

main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ans = foldl (\acc -> (+) acc . play) 0 $ lines contents
  print ans
  hClose file


--Int -> Int -> Int
--Int -> String -> Int
