-- | This is the top-level module documentation.
module Haskeleton (haskeleton) where

{- | This is the documentation for the 'haskeleton' function.

>>> haskeleton 3 -- This is some example code.
"Haskeleton! Haskeleton! Haskeleton!" -}
haskeleton :: Int -- ^ The number of times you want to haskeleton.
  -> String -- ^ This is the return value, which happens to be a 'String'.
haskeleton = unwords . flip replicate "Haskeleton!"
