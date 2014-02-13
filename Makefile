all: init haddock test bench run

bench:
	cabal install --enable-benchmarks --only-dependencies
	cabal configure --enable-benchmarks
	cabal build
	cabal bench

clean:
	cabal clean
	test -d .cabal-sandbox && cabal sandbox delete || true
	rm --force --recursive .hpc

coverage: test
	hpc report --include=Hop dist/hpc/tix/hspec/hspec.tix
	hpc markup --destdir=tmp --include=Hop dist/hpc/tix/hspec/hspec.tix

haddock:
	cabal install --flags=documentation --only-dependencies
	cabal configure
	cabal build
	cabal haddock --hyperlink-source

init:
	cabal update
	cabal install cabal-install
	cabal sandbox init

repl:
	cabal install --only-dependencies
	cabal configure
	cabal build
	cabal repl lib:hop

run:
	cabal install --only-dependencies
	cabal configure
	cabal build
	cabal run hop

test:
	cabal install --enable-tests --only-dependencies
	cabal configure --enable-tests
	cabal build
	cabal test
