import           Data.List

type Gift = (Int, Int, Int)

splitOnHelper :: Eq a => a -> ([a], [a], [[a]]) -> [[a]]
splitOnHelper _ ([], acc, done) = reverse (reverse acc:done)
splitOnHelper x ((y:ys), acc, done) = if x == y then
                                         splitOnHelper x (ys, [], ((reverse acc):done))
                                      else
                                        splitOnHelper x (ys, y:acc, done)

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs = splitOnHelper x (xs, [], [])

listToGift :: [Int] -> Gift
listToGift (l:w:h:[]) = (l, w, h)

slack :: Gift -> Int
slack  = product . min2

min2 :: Gift -> [Int]
min2 (l, w, h) = take 2 $ sort [l, w, h]

volume :: Gift -> Int
volume (l, w, h) = l * w * h

ribbonWrap :: Gift -> Int
ribbonWrap = (*2) . sum . min2

ribbonLength :: Gift -> Int
ribbonLength gift = volume gift + ribbonWrap gift

totalRibbonLength :: String -> Int
totalRibbonLength = sum . map (ribbonLength . listToGift . stringsToInts . (splitOn 'x')) . lines
  where stringsToInts = map (\x -> read x :: Int)

main :: IO ()
main = do
  input <- readFile "input.txt"
  putStrLn $ show $ totalRibbonLength input
