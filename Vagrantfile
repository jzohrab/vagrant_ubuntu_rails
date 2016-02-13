Vagrant.configure("2") do |config|

  config.vm.define :rails do |rails|
    rails.vm.box = "ubuntu/trusty64"
    rails.vm.hostname = "rails"

    rails.vm.network :forwarded_port, guest: 80, host: 8080
    rails.vm.network :private_network, ip: "172.28.33.10"
    rails.vm.provision "shell", privileged: false, path: "provision.sh"

    rails.vm.synced_folder "bookshelf", "/bookshelf", create: true
  end
   
end
