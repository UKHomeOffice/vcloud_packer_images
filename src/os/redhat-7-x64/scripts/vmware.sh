#!/bin/bash

# Mount the disk image
#cd /tmp
#mkdir /tmp/isomount
#mount -t iso9660 -o loop /root/linux.iso /tmp/isomount
# Install the drivers
#cp /tmp/isomount/VMwareTools-*.gz /tmp
#curl -o vmtool.tar.gz http://adegnan.net/VMwareTools-9.0.15-2323214.tar.gz
#tar -zxvf vmtool.tar.gz
#perl ./vmware-tools-distrib/vmware-install.pl -d
#rm vmtool.tar.gz
# Cleanup
#umount isomount
#rm -rf isomount /root/linux.iso VMwareTools*.gz vmware-tools-distrib



#echo -ne "[vmware-tools]\nname=VMware Tools\nbaseurl=http://packages.vmware.com/tools/esx/5.5/rhel6/x86_64\nenabled=1\ngpgcheck=1" > /etc/yum.repos.d/vmware-tools.repo

rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub
rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub

cat > /etc/yum.repos.d/vmware-tools.repo <<-EOF
[vmware-tools]
name = VMware Tools
baseurl = http://packages.vmware.com/packages/rhel7/x86_64/
enabled = 1
gpgcheck = 1
EOF

yum install -y open-vm-tools-deploypkg
systemctl restart vmtoolsd
