countLit :: String -> Int
countLit = countLitLights . performInstructions ([0..999], [0..999]) . readInstructions

main :: IO ()
main = do
  input <- readFile "input.txt"
  print $ countLit input
