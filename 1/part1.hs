main :: IO ()
main = do
  fileLines <- fmap lines $ readFile "input.txt"
  putStrLn $ show $ sum $ map fuel $ map (read :: String -> Int) fileLines
    where fuel mass = div mass 3 - 2
