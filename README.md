# [Haskeleton][1]

[![Build Status][2]][3]

Haskeleton is a project skeleton for Haskell packages. It's a tool,
like [`cabal init`][4], for creating new packages. Unlike `cabal
init`, packages created by Haskeleton are fully-featured and
idiomatic. Your new package will have:

- A library with its own source directory and section in the Cabal
  file.

- An executable that depends on your library.

- A comprehensive test suite including unit tests, property checks,
  doctests, program and documentation coverage, and code quality.

- A benchmark suite for analyzing the peformance of your library.

For a more complete explanation of these features, read [Haskeleton's
introductory blog post][5]. It also describes why you might want
each of these things.

Haskeleton is implemented as a template for [`hi`][6]. To create a
new package, run `hi` and point it to this repository. For example:

``` sh
$ hi example \
    --repository git://github.com/tfausak/haskeleton.git
Creating new project with git repository:git://github.com/tfausak/haskeleton.git
    create  example/.gitattributes
    create  example/.gitignore
    create  example/.stylish-haskell.yaml
    create  example/.travis.yml
    create  example/CHANGELOG.md
    create  example/CONTRIBUTING.md
    create  example/HLint.hs
    create  example/Haskeleton.hs
    create  example/LICENSE.md
    create  example/Makefile
    create  example/README.md
    create  example/Setup.hs
    create  example/benchmark/Bench.hs
    create  example/benchmark/ExampleBench.hs
    create  example/executable/Main.hs
    create  example/library/Example.hs
    create  example/example.cabal
    create  example/test-suite/DocTest.hs
    create  example/test-suite/HLint.hs
    create  example/test-suite/HPC.hs
    create  example/test-suite/Haddock.hs
    create  example/test-suite/ExampleSpec.hs
    create  example/test-suite/Spec.hs
    create  example/tmp/.gitignore
```

Haskeleton works with `hi` version 1.x. The packages it creates
work with GHC 7.8 and 7.6, along with the latest version of the
Haskell platform (2014.2.0.0).

[1]: http://taylor.fausak.me/haskeleton/
[2]: https://img.shields.io/travis/tfausak/haskeleton/master.svg?label=build&style=flat-square
[3]: https://travis-ci.org/tfausak/haskeleton
[4]: https://www.haskell.org/cabal/users-guide/developing-packages.html#using-cabal-init
[5]: http://taylor.fausak.me/2014/03/04/haskeleton-a-haskell-project-skeleton/
[6]: https://github.com/fujimura/hi
