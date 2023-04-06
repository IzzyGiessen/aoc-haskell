import System.IO
import Data.List
import Data.List.Split
import Data.Char
import Control.Monad

data Range = Range
  {
    start :: Int,
    end :: Int
  }

contains :: Range -> Range -> Bool
contains r1 r2
  | start r1 >= start r1 && end r1 <= end r2    = True
  | start r1 <= start r1 && end r1 >= end r2    = True
  | otherwise                                   = False

stringToRange :: String -> Range
stringToRange s = let left:right:[] = splitOn "-" s in
  Range (read left) (read right)

main = do
  file <- openFile "input/sample" ReadMode
  contents <- hGetContents file
  let ans = lines contents
  print ans
  hClose file
