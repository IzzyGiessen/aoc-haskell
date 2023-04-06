import System.IO
import Data.List
import Data.Char
import Control.Monad


magicFilter :: (String, String, String) -> Char
magicFilter (one, two, three) =
  head $ filter (`elem` one) $ filter (`elem` two) three

charToScore :: Char -> Int
charToScore c =
  if isUpper c then (ord c) - (ord 'A') + 27
  else (ord c) - (ord 'a') + 1

groupElves :: [String] -> [(String, String, String)]
groupElves [] = []
groupElves (one:two:three:s) = (one, two, three) : groupElves s
groupElves _ = error "Input not a multiple of three."


main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let ans = sum $ map charToScore $ map magicFilter
        $ groupElves $ lines contents
  print ans
  hClose file
