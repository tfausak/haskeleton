all: install haddock coverage bench run

bench:
	cabal configure --enable-benchmarks
	cabal build
	cabal bench

clean:
	cabal clean
	test -d .cabal-sandbox && cabal sandbox delete || true
	rm -f -r .hpc

coverage: test
	hpc report dist/hpc/tix/hspec/hspec.tix
	hpc markup --destdir=tmp dist/hpc/tix/hspec/hspec.tix

format:
	git ls-files '*.hs' | xargs --max-args=1 scan --inplace-modify --multiple-blanks=0
	git ls-files '*.hs' | xargs stylish-haskell --inplace

haddock:
	cabal configure
	cabal build
	cabal haddock --hyperlink-source

install:
	cabal update
	cabal --numeric-version | grep -F 1.18.0.2 || cabal install cabal-install
	cabal sandbox init
	cabal install --enable-benchmarks --enable-tests --flags=documentation --only-dependencies

repl:
	cabal configure
	cabal build
	cabal repl lib:haskeleton

run:
	cabal configure
	cabal build
	cabal run haskeleton

test:
	cabal configure --enable-tests
	cabal build
	cabal test
