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
        test -e ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz ||
            wget http://www.haskell.org/ghc/dist/7.8.1/ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz
        test -e ghc-7.8.1 ||
            tar --extract --file ghc-7.8.1-x86_64-unknown-linux-deb7.tar.xz
        cd ghc-7.8.1
        which ghc ||
            (./configure && make install)
        cd ..
    SH

    config.vm.provision :shell, inline: <<-'SH', privileged: false
        set -e -x

        # Add Cabal to the path.
        echo 'PATH="$HOME/.cabal/bin:$PATH"' > .bash_profile
        source .bash_profile

        # Install Cabal.
        test -e cabal-install-v1.18.0.3.tar.gz ||
            wget https://github.com/haskell/cabal/archive/cabal-install-v1.18.0.3.tar.gz
        test -e cabal-cabal-install-v1.18.0.3 ||
            tar --extract --file cabal-install-v1.18.0.3.tar.gz
        cd cabal-cabal-install-v1.18.0.3/cabal-install
        which cabal ||
            ./bootstrap.sh
        cd ../..

        # Install some handy Cabal packages.
        cabal update
        for package in happy hi hlint pointfree pointful scan stylish-haskell
        do
            cabal install $package
        done
    SH
end
