module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "library/Haskeleton.hs"
    -- TODO: , "library/X/X/X.hs"
    ]

main :: IO ()
main = doctest arguments
