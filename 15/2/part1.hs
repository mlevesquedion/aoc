import           Data.List

splitOnHelper :: Eq a => a -> ([a], [a], [[a]]) -> [[a]]
splitOnHelper _ ([], acc, done) = reverse $ map reverse (acc:done)
splitOnHelper x ((y:ys), acc, done) = if x == y then
                                         splitOnHelper x (ys, [], (acc:done))
                                      else
                                        splitOnHelper x (ys, y:acc, done)

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs = splitOnHelper x (xs, [], [])

listToGift :: [Int] -> (Int, Int, Int)
listToGift (l:w:h:[]) = (l, w, h)

boxArea :: (Int, Int, Int) -> Int
boxArea (l, w, h) = 2*l*w + 2*w*h + 2*h*l

slack :: (Int, Int, Int) -> Int
slack (l, w, h) = min1 * min2
  where (min1:min2:_) = sort [l, w, h]

giftArea :: (Int, Int, Int) -> Int
giftArea gift = boxArea gift + slack gift

wrappingPaperArea :: String -> Int
wrappingPaperArea = sum . map (giftArea . listToGift . stringsToInts . (splitOn 'x')) . lines
  where stringsToInts = map (\x -> read x :: Int)

main :: IO ()
main = do
  input <- readFile "input.txt"
  putStrLn $ show $ wrappingPaperArea input
