module HopSpec (main, spec) where

import           Hop
import           Test.Hspec

main :: IO ()
main = hspec spec

{-# ANN spec "HLint: ignore Redundant do" #-}
spec :: Spec
spec = do
  describe "hop" $ do
    it "returns an empty string" $ do
      hop 0 `shouldBe` ""

    it "returns the right number of hops" $ do
      hop 3 `shouldBe` "Hop! Hop! Hop!"
