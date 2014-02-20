module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "library/Haskeleton.hs"
    -- TODO: , "library/XXX.hs"
    ]

main :: IO ()
main = doctest arguments
