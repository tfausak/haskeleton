module Main (main) where

import           Haskeleton         (haskeleton)
import           System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    mapM_ (putStrLn . haskeleton . read) args
