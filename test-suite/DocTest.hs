module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "library/Haskeleton.hs"
    -- TODO
    ]

main :: IO ()
main = doctest arguments
