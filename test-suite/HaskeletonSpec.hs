module HaskeletonSpec (main, spec) where

import           Haskeleton
import           Test.Hspec
import           Test.Hspec.QuickCheck (prop)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "haskeleton" $ do
        it "returns an empty string" $ do
            haskeleton 0 `shouldBe` ""

        it "returns the right number of haskeletons" $ do
            haskeleton 3 `shouldBe` "Haskeleton! Haskeleton! Haskeleton!"

        prop "is null for integers less than one" $
            \ n -> if n < 1
                then null (haskeleton n)
                else not (null (haskeleton n))
