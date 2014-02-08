module Main (main) where

import           Hop                (hop)
import           System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    mapM_ (putStrLn . hop . read) args
