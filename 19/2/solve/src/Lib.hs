module Lib where

import           Data.Vector ((!))
import qualified Data.Vector as V
import           Debug.Trace

sol1 :: [Int] -> Int
sol1 program = eval 0 (V.fromList program)
  where
    update f i leftAddr rightAddr destAddr program = V.update program (V.fromList $ [(destAddr, f (program ! leftAddr) (program ! rightAddr))])
    eval i program
          | i + 4 < V.length program = let (opcode:leftAddr:rightAddr:destAddr:[]) = V.toList $ V.slice i 4 program in
                                           case opcode of
                                             99 -> V.head program
                                             1 -> eval (i+4) $ update (+) i leftAddr rightAddr destAddr program
                                             2 -> eval (i+4) $ update (+) i leftAddr rightAddr destAddr program
          | otherwise = V.head (trace (show program) program)


sol2 :: [Int] -> Int
sol2 program = 0
