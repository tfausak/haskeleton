# Vagrant 1.4.3 <http://www.vagrantup.com/downloads.html>
# VirtualBox 4.3.6 <https://www.virtualbox.org/wiki/Downloads>

Vagrant.require_version '>= 1.4.3'

# How many CPUs does the host machine have?
def cpus
  case RUBY_PLATFORM
  when /darwin/
    Integer(`sysctl -n hw.ncpu`)
  end
end

# How much RAM (in MB) does the host machine have?
def memory
  case RUBY_PLATFORM
  when /darwin/
    Integer(`sysctl -n hw.memsize`) / (1 << 21)
  end
end

Vagrant.configure('2') do |config|
  config.vm.box = 'saucy64'
  config.vm.box_download_checksum = 'bb4b16e96744a43d906887e01310435d'
  config.vm.box_download_checksum_type = 'md5'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com' \
    '/vagrant/virtualbox/opscode_ubuntu-13.10_chef-provisionerless.box'

  config.vm.provider :virtualbox do |vb|
    values = {
      'modifyvm' => :id,
      '--cpus' => cpus,
      '--memory' => memory
    }.reject { |_, v| v.nil? }.to_a.flatten

    vb.customize(values) if values.length > 2
  end

  config.vm.provision :shell, inline: <<-'SH'
    set -e -x
    update-locale LC_ALL=en_US.UTF-8
    apt-get update
    apt-get -y install git haskell-platform haskell-platform-doc make
  SH

  config.vm.provision :shell, inline: <<-'SH', privileged: false
    set -e -x
    echo 'PATH="$HOME/.cabal/bin:$PATH"' > .bash_profile
    source .bash_profile
    cabal update
    which hlint ||
      cabal install hlint
    which pointfree ||
      cabal install pointfree
    which pointful ||
      cabal install pointful
    which scan ||
      cabal install scan
    which stylish-haskell ||
      cabal install stylish-haskell
    cd /vagrant
    make install
  SH
end
