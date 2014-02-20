module Main (main) where

import           Criterion.Main  (bgroup, defaultMain)
import qualified HaskeletonBench
-- TODO: import qualified X.X.XBench

main :: IO ()
main = defaultMain
    [ bgroup "Haskeleton" HaskeletonBench.benchmarks
    -- TODO: , bgroup "X.X.X" X.X.XBench.benchmarks
    ]
