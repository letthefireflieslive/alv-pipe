Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |v|
        v.memory = 9000
        v.cpus = 4
    end

    config.vm.define "cluster" do |config|
        config.vm.box = "centos/8"
        config.vm.network "forwarded_port", guest: 80, host: 5080
        config.vm.network "forwarded_port", guest: 22, host: 5022
    end

end
