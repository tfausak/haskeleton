module HopBench (benchmarks) where

import           Criterion.Main  (bench, nf)
import           Criterion.Types (Benchmark)
import           Hop             (hop)

benchmarks :: [Benchmark]
benchmarks =
    [ bench "hop 0" (nf hop 0)
    , bench "hop 3" (nf hop 3)
    ]
