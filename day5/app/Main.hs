import System.IO
import Data.List
import Data.List.Split
import Data.Char
import Control.Monad

data Move = Move {
  from :: Int,
  to   :: Int
}

type Crates = [(Int, Char)]

readLine :: Int -> String -> Crates
readLine _ [] = []
readLine idx line =
    case span (/=']') line of
    (l, []) -> []
    (l, r) -> let ind = idx + length l
              in ((ind+2) `div` 4, last l) : (readLine (ind+1) $ tail r)

move :: Move -> Crates -> Crates
move mv crts = case span (\(idx, _) -> idx /= from mv) crts of
    (left, (_, ch):right) -> (to mv, ch):left++right
    (_, right) -> error $ show crts

moven :: Int -> Move -> Crates -> Crates
moven 0 _ crts = crts
moven n mv crts = moven (n-1) mv $ move mv crts

splitInstr :: String -> (Int, Move)
splitInstr s = (read $ wrds!!1, Move (read $ wrds!!3) $ read $ wrds!!5)
    where wrds = words s

run :: [(Int, Move)] -> Crates -> Crates
run [] crts = crts
run ((n, mv):mvs) crts = run mvs $ moven n mv crts

main :: IO ()
main = do
  file <- openFile "input/input" ReadMode
  contents <- hGetContents file
  let (crts, _:instr) = span (/="") $ lines contents
  let crates = foldl (\acc -> (++) acc . (readLine 0)) [] crts
  print $ map (snd . head)
        $ groupBy (\(i, _) (j, _) -> i==j)
        $ sortBy (\(i, _) (j, _) -> compare i j)
        $ run (map splitInstr instr) crates
  hClose file
