module Main (main) where

import Data.List (genericLength)
import Data.Maybe (catMaybes)
import System.Directory (doesFileExist)
import System.Exit (exitFailure, exitSuccess)
import System.Process (readProcess)
import Text.Regex (matchRegex, mkRegex)

average :: (Fractional a, Real b) => [b] -> a
average xs = realToFrac (sum xs) / genericLength xs

expected :: Fractional a => a
expected = 90

main :: IO ()
main = do
    file <- tix
    let arguments = ["report", file]

    output <- readProcess "hpc" arguments ""
    if average (match output) >= (expected :: Float)
        then exitSuccess
        else putStr output >> exitFailure

match :: String -> [Int]
match = fmap read . concat . catMaybes . fmap (matchRegex pattern) . lines
  where
    pattern = mkRegex "^ *([0-9]*)% "

-- The location of the TIX file changed between versions of cabal-install.
-- See <https://github.com/tfausak/haskeleton/issues/31> for details.
tix :: IO FilePath
tix = do
    let newFile = "tests.tix"
        oldFile = "dist/hpc/tix/tests/tests.tix"
    newFileExists <- doesFileExist newFile
    let file = if newFileExists then newFile else oldFile
    return file
