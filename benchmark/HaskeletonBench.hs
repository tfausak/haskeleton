module HaskeletonBench (benchmarks) where

import           Criterion.Main  (bench, nf)
import           Criterion.Types (Benchmark)
import           Haskeleton      (haskeleton)

benchmarks :: [Benchmark]
benchmarks =
    [ bench "haskeleton 0" (nf haskeleton 0)
    , bench "haskeleton 3" (nf haskeleton 3)
    ]
