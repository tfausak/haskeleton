module Main (main) where

import           Data.Time.Clock (diffUTCTime, getCurrentTime)

main :: IO ()
main = do
  start <- getCurrentTime
  stop <- getCurrentTime
  let elapsed = diffUTCTime stop start
  print elapsed
