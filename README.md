# Hop

[![Build Status][1]][2]

The simplest Haskell program as a Cabal package.

This is meant to be a simple but complete Cabal package. It provides a library,
an executable, a test suite, and some benchmarks. None of them really do
anything.

The name comes from *H*askell n*op*.

## Setup

``` sh
sudo apt-get -y install haskell-platform haskell-platform-doc
cabal update
cabal install cabal-install
cabal sandbox init
cabal install --enable-benchmarks --enable-tests -fdocumentation --only-dependencies
cabal configure --enable-benchmarks --enable-tests
cabal build
cabal haddock --hyperlink-source
cabal test
cabal bench
cabal run hop 3
# => Hop! Hop! Hop!
```

[1]: https://travis-ci.org/tfausak/hop.png?branch=master
[2]: https://travis-ci.org/tfausak/hop
