module Main (main) where

import           Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "library/Foo.hs"
    , "library/Haskeleton.hs"
    ]

main :: IO ()
main = doctest arguments
