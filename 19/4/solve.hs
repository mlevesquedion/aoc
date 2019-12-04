import           Data.List       (groupBy)
import           Data.List.Split (splitOn)

digits :: Int -> [Int]
digits n = reverse $ go $ divMod n 10
  where go (0, m) = m:[]
        go (d, m) = m:(go $ divMod d 10)

nonDecreasing :: Ord a => [a] -> Bool
nonDecreasing xs = all (uncurry (<=)) (zip xs (tail xs))

valid1 :: Int -> Bool
valid1 n = adjacentDuplicate && nonDecreasing d
  where d = digits n
        adjacentDuplicate = any (uncurry (==)) (zip d (tail d))

valid2 :: Int -> Bool
valid2 n = adjacentDuplicate && nonDecreasing d
  where d = digits n
        adjacentDuplicate = any ((==2) . length) $ groupBy (==) d

countMatches :: (Int -> Bool) -> [Int] -> Int
countMatches p = length . filter p

sol1 :: Int -> Int -> Int
sol1 b e = countMatches valid1 [b..e]

sol2 :: Int -> Int -> Int
sol2 b e = countMatches valid2 [b..e]

main :: IO ()
main = do
  range <- readFile "input.txt"
  let [begin, end] = splitOn "-" range
  let (b, e) = (read begin :: Int, read end :: Int)
  putStrLn $ show $ sol1 b e
  putStrLn $ show $ sol2 b e
