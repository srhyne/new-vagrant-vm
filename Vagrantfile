# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

hostname = "throwbo-dev"
ip       = "192.168.88.33"

VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "bento/ubuntu-16.04"
  config.vm.box = "bento/ubuntu-14.04"

  config.vm.hostname = hostname

  # for live reload
  config.vm.network "forwarded_port", guest: 35729, host: 35729

  # for mysql
  config.vm.network "forwarded_port", guest: 3306, host: 3305

  # RabbitMQ
  config.vm.network "forwarded_port", guest: 5672, host: 5672
  config.vm.network "forwarded_port", guest: 15672, host: 15672

  # web interface
  config.vm.network "forwarded_port", guest: 8080, host: 8080


  # presence.io
  config.vm.network "forwarded_port", guest: 16022, host: 16022


  config.vm.network :private_network, ip: ip

  config.vm.synced_folder "~/Sites/conveyour.dev", "/var/sites/conveyour.dev",
  id: "conveyour",
  type: "nfs",
  :mount_options => ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=2', 'nolock'],
  linux__nfs_options: ['rw','no_subtree_check','all_squash','async']

  config.vm.synced_folder "~/Sites/webpditest.com", "/var/sites/webpditest.com",
  id: "webpdi",
  type: "nfs",
  :mount_options => ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=2'],
  linux__nfs_options: ['rw','no_subtree_check','all_squash','async']
  config.vm.provider "virtualbox" do |vb|
    vb.name = hostname
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end


  config.vm.provision "shell", inline: <<-SHELL
    apt-get update -y
    apt-get install -y nginx
    sudo apt install php5 -y
    sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password password'
    sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password password'
    sudo apt-get -y install mysql-server-5.5
    sudo apt install mysql-server-5.5 php5-mysql -y
    sudo apt install php5-fpm php5-common php5-xml php5-curl php5-mbstring php5-mcrypt -y
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
    sudo apt-get update
    sudo apt-get install mongodb-org --force-yes -y

    #sudo cp /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/conveyour
    #sudo apt-get install -y mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0
    #sudo apt-get install python-software-properties -y
    #sudo add-apt-repository ppa:ondrej/php -y
    #apt-get update -y
    #sudo apt install php5.6-fpm -y
  SHELL




end


# Disable automatic box update checking. If you disable this, then
# boxes will only be checked for updates when the user runs
# `vagrant box outdated`. This is not recommended.
# config.vm.box_check_update = false

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine. In the example below,
# accessing "localhost:8080" will access port 80 on the guest machine.
# NOTE: This will enable public access to the opened port
# config.vm.network "forwarded_port", guest: 80, host: 8080

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine and only allow access
# via 127.0.0.1 to disable public access
# config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

# Create a private network, which allows host-only access to the machine
# using a specific IP.
# config.vm.network "private_network", ip: "192.168.33.10"

# Create a public network, which generally matched to bridged network.
# Bridged networks make the machine appear as another physical device on
# your network.
# config.vm.network "public_network"

# Share an additional folder to the guest VM. The first argument is
# the path on the host to the actual folder. The second argument is
# the path on the guest to mount the folder. And the optional third
# argument is a set of non-required options.
# config.vm.synced_folder "../data", "/vagrant_data"

# Provider-specific configuration so you can fine-tune various
# backing providers for Vagrant. These expose provider-specific options.
# Example for VirtualBox:
#
# config.vm.provider "virtualbox" do |vb|
#   # Display the VirtualBox GUI when booting the machine
#   vb.gui = true
#
#   # Customize the amount of memory on the VM:
#   vb.memory = "1024"
# end
#
# View the documentation for the provider you are using for more
# information on available options.

# Enable provisioning with a shell script. Additional provisioners such as
# Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
# documentation for more information about their specific syntax and use.
# config.vm.provision "shell", inline: <<-SHELL
#   apt-get update
#   apt-get install -y apache2
# SHELL