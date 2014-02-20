module Main (main) where

import           Criterion.Main  (bgroup, defaultMain)
import qualified HaskeletonBench
-- TODO: import qualified XXXBench

main :: IO ()
main = defaultMain
    [ bgroup "Haskeleton" HaskeletonBench.benchmarks
    -- TODO: , bgroup "XXX" XXXBench.benchmarks
    ]
