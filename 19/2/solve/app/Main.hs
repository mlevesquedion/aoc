module Main where

import           Data.List.Split (splitOn)
import           Lib

main :: IO ()
main = do
  csv <- readFile "input.txt"
  let program = map (read :: String -> Int) $ splitOn "," csv
  putStrLn $ show $ sol1 program
  putStrLn $ show $ sol2 program
