import           Data.List.Split (splitOn)

sol1 :: [Integer] -> Integer
sol1 program = head $ foldr eval instructions program
  where instructions = chunksOf 4 program
        eval (program, (opcode, left, right, dest))
          | opcode == 99 = program
          | otherwise = let (left', right') = (program !! left, program !! right) in
                            if opcode == 1 then



sol2 :: [Integer] -> Integer
sol2 program = 0

main :: IO ()
main = do
  csv <- readFile "input.txt"
  let program = map (read :: String -> Integer) $ splitOn "," csv
  putStrLn $ show $ sol1 program
  putStrLn $ show $ sol2 program
