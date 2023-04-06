import System.IO
import Data.List
import Data.Char
import Control.Monad


magicFilter :: String -> Char
magicFilter s =
  let (left, right) = splitAt ((length s) `div` 2) s
  in head $ filter (`elem` left) right

charToScore :: Char -> Int
charToScore c =
  if isUpper c then (ord c) - (ord 'A') + 27
  else (ord c) - (ord 'a') + 1

main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ans = sum $ map charToScore $ map magicFilter $ lines contents
  print ans
  hClose file
