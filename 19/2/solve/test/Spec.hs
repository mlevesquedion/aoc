import           Test.Hspec

import           Lib

main :: IO ()
main = hspec $ do
  describe "examples" $ do
    it "example1" $ do
      sol1 [1, 0, 0, 0, 99] `shouldBe` 2
    it "example2" $ do
      sol1 [1, 1, 1, 4, 99, 5, 6, 0, 99] `shouldBe` 30
