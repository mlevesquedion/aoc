import           System.IO

entersBasementAt :: String -> Int
entersBasementAt = length . takeWhile (>=0) . scanl (+) 0 . map convert
  where convert c = case c of
                      '(' -> 1
                      ')' -> -1
                      _   -> 0

main :: IO ()
main = do
  parens <- readFile "input.txt"
  putStrLn $ show $ entersBasementAt parens
