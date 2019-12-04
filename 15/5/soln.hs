import           Data.Char
import           Data.List
import qualified Data.Set  as Set

satisfiesAll :: [(a -> Bool)] -> a -> Bool
satisfiesAll ps x = and $ map ($x) ps

atLeastThreeVowels :: String -> Bool
atLeastThreeVowels = (>=3) . length . filter isVowel
  where isVowel = flip elem "aeiou"

atLeastOneDoubledLetter :: String -> Bool
atLeastOneDoubledLetter s = any (uncurry (==)) $ zip s (tail s)

noRestrictedPairs :: String -> Bool
noRestrictedPairs s = all (not . flip isInfixOf s) ["ab", "cd", "pq", "xy"]

second :: (a, b, c) -> b
second (_, x, _) = x

-- O(nlogn), would be O(n) with HashSet
repeatedNonOverlappingPair :: String -> Bool
repeatedNonOverlappingPair s = second $ foldl
                                  (\(set, bool_, prev) p -> (Set.insert p set, bool_ || (prev /= p && Set.member p set), p))
                                  (Set.empty, False, ('0', '0'))
                                  (zip s (tail s))

triples :: [a] -> [(a, a, a)]
triples xs = zip3 xs t (tail t)
  where t = tail xs

repeatingLetterWithBetween :: String -> Bool
repeatingLetterWithBetween = any (\(a, _, b) -> a == b) . triples

part1 :: String -> Bool
part1 = satisfiesAll [atLeastThreeVowels, atLeastOneDoubledLetter, noRestrictedPairs]

part2 :: String -> Bool
part2 = satisfiesAll [repeatedNonOverlappingPair, repeatingLetterWithBetween]

nice :: String -> Bool
nice = part2

countNice :: String -> Int
countNice = length . filter nice . lines

main :: IO ()
main = do
  input <- readFile "input.txt"
  print $ countNice input
