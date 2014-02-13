module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "source/Hop.hs"
    ]

main :: IO ()
main = doctest arguments
