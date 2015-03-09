# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
    sudo apt-get update
    sudo aptitude install unzip qemu-utils libxtst6 libxcursor1 libxinerama1 libxi6 wget python2.7 python2.7-dev python-pip python-gobject fabric python-jinja2  libstartup-notification0 libgtop2-7 -y
    sudo mount --bind /sys/bus /proc/bus
    sudo gem install methadone
    cd /home/vagrant
    #sudo pip install --allow-all-external -r /home/vagrant/share/requirements.txt
    wget -O packer.zip --progress=dot:giga https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip && unzip packer.zip && rm packer.zip && sudo mv packer* /usr/local/bin
    wget -O vmware.bundle --progress=dot:giga https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-11.0.0-2305329.x86_64.bundle && sudo bash vmware.bundle --required --eulas-agreed --console && rm vmware.bundle
    echo '"You may need to open VMware and request a trial before you can build images with Packer. To do this, SSH to the VM with X forwarding and run "vmware"'
    echo "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key -X vagrant@`facter ipaddress_eth0`"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "public_network"

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "4096"
    v.vmx["numvcpus"] = "4"
  end
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  config.vm.synced_folder ".", "/home/vagrant/share"

  config.vm.provision :shell, :inline => $script

  #Show connection details for getting X
end
