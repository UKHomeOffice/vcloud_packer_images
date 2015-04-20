set -e

# Add a vagrant user
useradd -m vagrant
echo -e 'vagrant'"\n"'vagrant' | passwd

# Setup Vagrant user
# insecure keys (will be removed by vagrant)
# Generate a dummy key (to setup .ssh directory correctly with selinux etc...)
su vagrant -c "ssh-keygen -t rsa -N ''"
su vagrant -c "curl -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
chmod 0600 /home/vagrant/.ssh/authorized_keys
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/vagrant

# Install VirtualBox extensions:
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /mnt
yum --enablerepo=extras install epel-release -y
yum -y install dkms kernel-devel-$(uname -r) kernel-headers-$(uname -r);
/mnt/VBoxLinuxAdditions.run  -- --force
umount /mnt
yum remove epel-release -y
