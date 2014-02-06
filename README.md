# Hop

The simplest Haskell program as a Cabal package.

This is meant to be a simple but complete Cabal package. It provides a library,
an executable, a test suite, and some benchmarks. None of them really do
anything.

The name comes from *H*askell n*op*.

## Setup

``` sh
cabal configure --enable-benchmarks --enable-tests &&
  cabal build &&
  cabal haddock --hyperlink-source &&
  cabal test &&
  cabal bench &&
  cabal install &&
  hop
# => Hop!
```

## Development

``` sh
find . -name '*.hs' -not -path './dist/*' \
  -execdir scan --inplace-modify --multiple-blanks=0 -- '{}' \; \
  -execdir stylish-haskell --inplace -- '{}' \; \
  -execdir hlint --color -- '{}' \;
```

## Links

- <http://www.haskell.org/haskellwiki/How_to_write_a_Haskell_program>
- <http://www.haskell.org/haskellwiki/Structure_of_a_Haskell_project>
- <http://semantic.org/hnop/>
