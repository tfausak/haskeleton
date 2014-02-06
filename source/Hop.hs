-- | This is the top-level module documentation.
module Hop (hop) where

import           Data.List (intercalate)

{- | This is the documentation for the 'hop' function.

>>> hop 3 -- This is some example code.
"Hop! Hop! Hop!" -}
hop :: Int -- ^ The number of times you want to hop.
  -> String -- ^ This is the return value, which happens to be a 'String'.
hop = unwords . flip replicate "Hop!"
