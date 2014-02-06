module Main (main) where

import           Criterion.Main (defaultMain)
import qualified HopBench

main :: IO ()
main = defaultMain HopBench.benchmarks
