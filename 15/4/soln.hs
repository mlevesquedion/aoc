has5LeadingZeroes :: String -> Bool
has5LeadingZeroes = (== replicate 5 '0') . take 5


firstMD5With5LeadingZeroes :: String -> String
firstMD5With5LeadingZeroes s = head $ filter has5LeadingZeroes $ map md5 $ map (s++) $ map show [1..]


main :: IO ()
main = do
  putStrLn $ firstMD5With5LeadingZeroes "iwrupvqb"
