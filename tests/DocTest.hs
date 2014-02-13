module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "source/Haskeleton.hs"
    ]

main :: IO ()
main = doctest arguments
