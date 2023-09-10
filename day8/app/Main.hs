import System.IO
import Data.List
import Data.Char
import Control.Monad
import Grid

main :: IO ()
main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ls = lines contents
  -- read into grid
  let grid = map (map digitToInt) ls
  print $ countTrees $ filterTrees grid
  hClose file
