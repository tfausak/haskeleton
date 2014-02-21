module HaskeletonBench (benchmarks) where

import           Criterion
import           Haskeleton

benchmarks :: [Benchmark]
benchmarks =
    [ bench "haskeleton 0" (nf haskeleton 0)
    , bench "haskeleton 3" (nf haskeleton 3)
    ]
