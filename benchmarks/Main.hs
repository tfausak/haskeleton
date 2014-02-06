module Main (main) where

import           Criterion.Main (bench, defaultMain, whnf)
import           Hop            (hop)

main :: IO ()
main = defaultMain
  [ bench "hop" (whnf hop 3)
  ]
