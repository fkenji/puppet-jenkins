Vagrant.configure("2") do |config|

    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.network :private_network, ip: "192.168.33.12"

    config.vm.hostname = "config"
    config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    config.vm.box = "lucid32"    
    

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024]
    end 

    config.vm.provision :puppet do |puppet|
        puppet.module_path = "modules"
        puppet.manifests_path = "vm-manifests"
        puppet.manifest_file  = 'init.pp'
    end

end