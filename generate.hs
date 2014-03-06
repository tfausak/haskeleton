module Main (main) where

-- TODO: Modify existing files.

import           Control.Monad      (join)
import           Data.List          (groupBy, intercalate)
import           Data.Monoid        ((<>))
import           System.Directory   (createDirectoryIfMissing)
import           System.Environment (getArgs)
import           System.FilePath    (joinPath)
import           System.IO          (writeFile)

main :: IO ()
main = do
    args <- getArgs
    mapM_ mkdirs args
    mapM_ mkfiles args

createBenchmark :: String -> IO ()
createBenchmark name = do
    let path = joinPath ("benchmark" : (split '.' name)) <> "Bench.hs"
    writeFile path (templateBenchmark name)

createLibrary :: String -> IO ()
createLibrary name = do
    let path = joinPath ("library" : (split '.' name)) <> ".hs"
    writeFile path (templateLibrary name)

createTestSuite :: String -> IO ()
createTestSuite name = do
    let path = joinPath ("test-suite" : (split '.' name)) <> "Spec.hs"
    writeFile path (templateTestSuite name)

folders :: [String]
folders = ["benchmark", "library", "test-suite"]

mkdir :: String -> IO ()
mkdir = createDirectoryIfMissing True . joinPath . init . split '.'

mkdirs :: String -> IO ()
mkdirs x = mapM_ (mkdir . join . (: [".", x])) folders

mkfiles :: String -> IO ()
mkfiles name = do
    createBenchmark name
    createLibrary name
    createTestSuite name

split :: (Eq a) => a -> [a] -> [[a]]
split x xs = fmap (dropWhile (== x)) (groupBy (const (x /=)) xs)

templateBenchmark :: String -> String
templateBenchmark name = unlines
    [ "module " <> name <> "Bench (benchmarks) where"
    , ""
    , "import Criterion"
    , "import " <> name
    , ""
    , "benchmarks :: [Benchmark]"
    , "benchmarks = []"
    ]

templateLibrary :: String -> String
templateLibrary name = unlines
    [ "-- | TODO"
    , "module " <> name <> " () where"
    ]

templateTestSuite :: String -> String
templateTestSuite name = unlines
    [ "module " <> name <> "Spec (main, spec) where"
    , ""
    , "import Test.Hspec"
    , "import " <> name <> " ()"
    , ""
    , "main :: IO ()"
    , "main = hspec spec"
    , ""
    , "spec :: Spec"
    , "spec = it \"is\" pending"
    ]
