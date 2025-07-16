Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080 # expose port 8080

  # Provision using bash script
  config.vm.provision "shell", path: "provision.sh"

  # Optional: synced folder to share code
  config.vm.synced_folder ".", "/home/vagrant/app"
end
