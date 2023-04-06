import System.IO
import Data.List
import Data.List.Split
import Data.Char
import Control.Monad

data Range = Range
  {
    start :: Int,
    end :: Int
  } deriving Show

contains :: Range -> Range -> Bool
contains r1 r2
  | start r1 <= start r2 = end r1 >= start r2
  | otherwise            = end r2 >= start r1

stringToRange :: String -> Range
stringToRange s = let left:right:[] = splitOn "-" s in
  Range (read left) (read right)

main :: IO ()
main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ans = length $ filter (\(x, y) -> contains x y)
        $ map (\(x:y:[]) -> ((stringToRange x), (stringToRange y)))
        $ map (splitOn ",") $ lines contents
  print ans
  hClose file
