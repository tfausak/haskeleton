# ham

The simplest Haskell program as a Cabal package.

This is meant to be a simple but complete Cabal package. It provides a library,
an executable, a test suite, and some benchmarks. None of them really do
anything.

The name comes from *H*askell progr*am*.

``` sh
cabal configure --enable-benchmarks --enable-tests &&
  cabal build &&
  cabal haddock --hyperlink-source &&
  cabal test &&
  cabal bench &&
  cabal install &&
  ham
# => Ham!
```
