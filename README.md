# [Haskeleton][1]

[![Build Status][2]][3]

A Haskell project skeleton. Implemented as a template for [hi][4].

``` sh
$ hi \
    --module-name Example.Module \
    --repository https://github.com/tfausak/haskeleton.git
Creating new project from repository: https://github.com/tfausak/haskeleton.git
    ...
    create  example-module/.ghci
    create  example-module/.gitattributes
    create  example-module/.gitignore
    create  example-module/.stylish-haskell.yaml
    create  example-module/.travis.yml
    create  example-module/CHANGELOG.md
    create  example-module/CONTRIBUTING.md
    create  example-module/HLint.hs
    create  example-module/LICENSE.txt
    create  example-module/README.md
    create  example-module/benchmark/Bench.hs
    create  example-module/benchmark/Example/ModuleBench.hs
    create  example-module/cabal.config
    create  example-module/executable/Main.hs
    create  example-module/haskeleton.hs
    create  example-module/library/Example/Module.hs
    create  example-module/example-module.cabal
    create  example-module/test-suite/DocTest.hs
    create  example-module/test-suite/HLint.hs
    create  example-module/test-suite/HPC.hs
    create  example-module/test-suite/Haddock.hs
    create  example-module/test-suite/Example/ModuleSpec.hs
    create  example-module/test-suite/Spec.hs
    create  example-module/tmp/.gitignore
```

[1]: https://github.com/tfausak/haskeleton
[2]: http://img.shields.io/travis/tfausak/haskeleton/master.svg
[3]: https://travis-ci.org/tfausak/haskeleton
[4]: https://github.com/fujimura/hi
