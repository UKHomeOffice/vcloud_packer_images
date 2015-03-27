sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
rpm -Uvh https://anorien.csc.warwick.ac.uk/mirrors/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` perl docker cloud-init
