# Vagrant 1.5.2 <http://www.vagrantup.com/downloads.html>
# VirtualBox 4.3.10 <https://www.virtualbox.org/wiki/Downloads>

Vagrant.require_version '~> 1.5'

Vagrant.configure('2') do |config|
    config.vm.box = 'chef/ubuntu-13.10'
    config.vm.box_version = '~> 1.0'

    config.vm.provision :shell, inline: <<-'SH'
        set -e -x

        # Install dependencies.
        sudo apt-get update
        sudo apt-get install --assume-yes git libgmp-dev

        # Install GHC.
        if ! which ghc
        then
            test -e ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz ||
                wget http://www.haskell.org/ghc/dist/7.8.1/ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz
            test -e ghc-7.8.1 ||
                tar --extract --file ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz
            cd ghc-7.8.1
            ./configure
            make install
            cd ..
        fi
    SH

    config.vm.provision :shell, inline: <<-'SH', privileged: false
        set -e -x

        # Add Cabal to the path.
        echo 'PATH="$HOME/.cabal/bin:$PATH"' > .bash_profile
        source .bash_profile

        # Install Cabal.
        if ! which cabal
        then
            test -f cabal-install-v1.20.0.0.tar.gz ||
                wget https://github.com/haskell/cabal/archive/cabal-install-v1.20.0.0.tar.gz
            test -d cabal-cabal-install-v1.20.0.0 ||
                tar --extract --file cabal-install-v1.20.0.0.tar.gz
            cd cabal-cabal-install-v1.20.0.0/cabal-install
            ./bootstrap.sh
            cd ../..
        fi

        # Install some handy Cabal packages.
        cabal update
        for package in happy hi hlint pointfree pointful scan stylish-haskell
        do
            which $package ||
                cabal install $package
        done
    SH
end
