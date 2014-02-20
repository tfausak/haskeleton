module Main (main) where

import           Criterion.Main  (bgroup, defaultMain)
import qualified HaskeletonBench
-- TODO

main :: IO ()
main = defaultMain
    [ bgroup "Haskeleton" HaskeletonBench.benchmarks
    -- TODO
    ]
