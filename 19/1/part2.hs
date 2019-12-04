fuel :: Integer -> Integer
fuel = sum . tail . takeWhile (>0) . iterate (\m -> div m 3 - 2)

main :: IO ()
main = do
  fileLines <- fmap lines $ readFile "input.txt"
  putStrLn $ show $ sum $ map fuel $ map (read :: String -> Integer) fileLines
