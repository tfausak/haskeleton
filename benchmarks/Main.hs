module Main (main) where

import           Criterion.Main (bgroup, defaultMain)
import qualified HopBench

main :: IO ()
main = defaultMain
  [ bgroup "Hop" HopBench.benchmarks
  ]
