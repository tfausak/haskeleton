# Usage: ruby generate.rb Foo.Bar

ARGV.each do |arg|
  %x( mkdir -p #{File.join('benchmark', *arg.split('.')[0..-2])} )
  path = File.join('benchmark', *arg.split('.')) + '.hs'
  File.open(path, 'w').write(<<-HASKELL)
module #{arg}Bench (benchmarks) where

import           Criterion
import           #{arg}

benchmarks :: [Benchmark]
benchmarks = []
  HASKELL
end

ARGV.each do |arg|
  %x( mkdir -p #{File.join('library', *arg.split('.')[0..-2])} )
  path = File.join('library', *arg.split('.')) + '.hs'
  File.open(path, 'w').write(<<-HASKELL)
-- | TODO
module #{arg} () where
  HASKELL
end

ARGV.each do |arg|
  %x( mkdir -p #{File.join('test-suite', *arg.split('.')[0..-2])} )
  path = File.join('test-suite', *arg.split('.')) + '.hs'
  File.open(path, 'w').write(<<-HASKELL)
module #{arg}Spec (main, spec) where

import           #{arg}
import           Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    it "needs tests" $ do
        pending
  HASKELL
end

[
  '.ghci',
  'haskeleton.cabal',
  File.join('benchmark', 'Bench.hs'),
  File.join('test-suite', 'DocTest.hs')
].each do |path|
  content = File.open(path).readlines.flat_map do |line|
    stub = line.sub('-- TODO: ', '')
    if line['X.X.X']
      ARGV.map do |arg|
        stub.gsub('X.X.X', arg)
      end + [line]
    elsif line['X/X/X']
      ARGV.map do |arg|
        stub.gsub('X/X/X', arg.gsub('.', '/'))
      end + [line]
    else
      line
    end
  end

  File.open(path, 'w').write(content.join)
end
