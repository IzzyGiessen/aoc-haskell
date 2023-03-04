import System.IO
import Data.List
import Control.Monad

split :: [String] -> [[String]]
split [] = []
split xs =
  case span (/= []) xs of
    (left, [])    -> [left]
    (left, right) -> [left] ++ (split $ tail right)

getTopThree :: [Int] -> [String] -> [Int]
getTopThree acc x =
  let cap = sum $ map read x in
    if cap > acc!!2 then sortOn negate [acc!!0, acc!!1, cap]
    else acc

main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let top = foldl getTopThree [0, 0, 0] (split $ lines contents)
  print $ sum top
  hClose file
