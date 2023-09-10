module Grid where

import Data.List

type Grid = [[Int]]

countTrees :: Grid -> Int
countTrees grid = sum $ map (foldl (\acc t -> if t > -1 then acc+1 else acc) 0) grid

filterTrees :: Grid -> Grid
filterTrees grid = map (\(l, r) -> combineRows l r) $ zip hFiltered vFiltered
  where hFiltered = map filterHorizontal grid
        vFiltered = transpose $ map filterHorizontal (transpose grid)

filterHorizontal :: [Int] -> [Int]
filterHorizontal row = combineRows fromLeft fromRight
  where fromLeft = filterRow row (-1)
        fromRight = reverse $ filterRow (reverse row) (-1)

filterRow :: [Int] -> Int -> [Int]
filterRow [] _ = []
filterRow (t:ts) max
  | t > max = t : (filterRow ts t)
  | otherwise = -1 : (filterRow ts max)

--             Left     Right    Only visible trees
combineRows :: [Int] -> [Int] -> [Int]
combineRows left right = map (\(l, r) -> max l r) $ zip left right
