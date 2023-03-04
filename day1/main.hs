import System.IO
import Data.List
import Control.Monad

split :: [String] -> [[String]]
split [] = []
split xs =
  let part = takeWhile (/= []) xs
      (_, rest) = splitAt (length part + 1) xs
  in [part] ++ split rest

getMax :: [String] -> Int
getMax [] = 0
getMax ls =
  let caps = map (map read) $ split ls :: [[Int]]
  in case sortOn (negate) $ map (foldl (+) 0) caps of
    x:y:z:xs -> x + y + z
    xs -> sum xs
  --in maximum (map (foldl (+) 0) caps)

main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ans = getMax $ lines contents
  print ans
  hClose file
