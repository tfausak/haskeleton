module HopSpec (main, spec) where

import           Hop                   (hop)
import           Test.Hspec            (Spec, describe, hspec, it, shouldBe)
import           Test.Hspec.QuickCheck (prop)
import           Test.HUnit            ()
import           Test.QuickCheck       ()

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "hop" $ do
        it "returns an empty string" $ do
            hop 0 `shouldBe` ""

        it "returns the right number of hops" $ do
            hop 3 `shouldBe` "Hop! Hop! Hop!"

        prop "is null for integers less than one" $
            \ n -> if n < 1 then null (hop n) else not (null (hop n))
