$number_cars = 2

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

   (1..$number_cars).each do |i|
        config.vm.define "dev#i" do |dev|
         dev.vm.network  "private_network", ip: "192.168.1.#{10+i}"
         dev.vm.hostname = "dev#i"  
         dev.vm.provider "virtualbox" do |vb|
                vb.gui = true
                vb.memory = "256"
         end
        end
   end
