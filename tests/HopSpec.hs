module HopSpec (main, spec) where

import           Hop             (hop)
import           Test.Hspec      (Spec, describe, hspec, it, shouldBe)
import           Test.HUnit      ()
import           Test.QuickCheck (property)

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

    it "is null for integers less than one" . property $
      \ n -> if n < 1 then null (hop n) else not (null (hop n))
