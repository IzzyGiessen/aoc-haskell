import System.IO
import Data.List
import Data.Char
import Control.Monad

findStart :: Int -> String -> Int
findStart 0 _ = 0
findStart n [] = error "There is no start of packet"
findStart n s = let sig = take 4 s
    in if sig == nub sig
    then 4
    else (+) 1 $ findStart n $ tail s

main :: IO ()
main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ls = head $ lines contents
  let start = findStart 4 ls
  print $ start
  hClose file
