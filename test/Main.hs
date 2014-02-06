module Main (main) where

import           Hop            (hop)
import           Test.Framework

test_empty = assertEqual "" (hop 0)
test_hopHopHop = assertEqual "Hop! Hop! Hop!" (hop 3)

prop_length :: Int -> Bool
prop_length n
  | n < 1 = null (hop n)
  | otherwise = not (null (hop n))

main :: IO ()
main = htfMain htf_thisModulesTests
