module Tests (tests) where

import           Distribution.TestSuite (Progress (Finished), Result (Pass),
                                         Test (..), TestInstance (..))

tests :: IO [Test]
tests = return [Test succeeds]
  where
    succeeds = TestInstance
      { run = return $ Finished Pass
      , name = "succeeds"
      , tags = []
      , options = []
      , setOption = \_ _ -> Right succeeds
      }
