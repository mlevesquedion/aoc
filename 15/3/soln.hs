import           Data.List

coordinates :: String -> [(Int, Int)]
coordinates = scanl move (0, 0)
  where move (x, y) direction = case direction of
                                  '<' -> (x - 1, y)
                                  '>' -> (x + 1, y)
                                  '^' -> (x, y + 1)
                                  'v' -> (x, y - 1)
                                  _   -> (x, y)
-- Part 1
part1 :: String -> Int
part1 = length . nub . sort . coordinates

-- Part 2
evenOddSplit :: [a] -> ([a], [a])
evenOddSplit [] = ([], [])
evenOddSplit (x:xs) = (x:right, left)
  where (left, right) = evenOddSplit xs


part2 :: String -> Int
part2 directions = length . nub . sort $ (coordinates evens) ++ (coordinates odds)
  where (evens, odds) = evenOddSplit directions

howManyHouses :: String -> Int
howManyHouses = part2

main :: IO ()
main = do
  input <- readFile "input.txt"
  putStrLn $ show $ howManyHouses input
