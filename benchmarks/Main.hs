module Main (main) where

import           Criterion.Main  (bgroup, defaultMain)
import qualified HaskeletonBench

main :: IO ()
main = defaultMain
    [ bgroup "Haskeleton" HaskeletonBench.benchmarks
    ]
