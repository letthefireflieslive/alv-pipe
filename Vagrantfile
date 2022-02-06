SSH_PUB_KEY="~/.ssh/id_rsa.pub"

Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |v|
        v.memory = 13000
        v.cpus = 4
    end

    config.vm.define "cluster" do |config|
        config.vm.box = "centos/7"
        config.vm.network "forwarded_port", guest: 80, host: 80
        config.vm.network "forwarded_port", guest: 22, host: 5022
        config.vm.network "private_network", ip: "55.55.55.5"
        config.vm.hostname = "box.local"

        #Add your local SSH public key to vagrant box
        config.vm.provision "file", source: SSH_PUB_KEY, destination: "~/.ssh/me.pub"
        config.vm.provision "shell", inline: <<-SHELL
            cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
        SHELL
    end

end
