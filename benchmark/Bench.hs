module Main (main) where

import           Criterion.Main  (bgroup, defaultMain)
import qualified FooBench
import qualified HaskeletonBench

main :: IO ()
main = defaultMain
    [ bgroup "Foo" FooBench.benchmarks
    , bgroup "Haskeleton" HaskeletonBench.benchmarks
    ]
