module FooSpec (main, spec) where

import           Foo        ()
import           Test.Hspec (Spec, hspec, it, pending)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    it "needs tests" $ do
        pending
