import           System.IO

finalFloor :: String -> Int
finalFloor = sum . map convert
  where convert c = case c of
                      '(' -> 1
                      ')' -> -1
                      _   -> 0

main :: IO ()
main = do
  parens <- readFile "input.txt"
  putStrLn $ show $ finalFloor parens
