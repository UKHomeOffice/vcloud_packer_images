yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*


#Stop logging services.
#/sbin/service rsyslog stop
#/sbin/service auditd stop

#Remove old kernels
#/bin/package-cleanup --oldkernels --count=1

#Clean out yum
#/usr/bin/yum clean all

#Force the logs to rotate & remove old logs we don’t need
#/usr/sbin/logrotate –f /etc/logrotate.conf
#/bin/rm –f /var/log/*-???????? /var/log/*.gz
#/bin/rm -f /var/log/dmesg.old
#/bin/rm -rf /var/log/anaconda

#Truncate the audit logs 
#/bin/cat /dev/null > /var/log/audit/audit.log
#/bin/cat /dev/null > /var/log/wtmp
#/bin/cat /dev/null > /var/log/lastlog
#/bin/cat /dev/null > /var/log/grubby

#Remove the udev persistent device rules.
/bin/rm -f /etc/udev/rules.d/70*
echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules



#Remove the traces of the template MAC address and UUIDs
/bin/sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0
/bin/sed -i '/UUID/d' /etc/sysconfig/network-scripts/ifcfg-eth0


#Clean /tmp out
/bin/rm –rf /tmp/*
/bin/rm –rf /var/tmp/*

#Remove the SSH host keys
/bin/rm –f /etc/ssh/*key*

#Remove the root user’s shell history.
/bin/rm -f ~root/.bash_history
unset HISTFILE

#Remove the root user’s SSH history & other cruft
/bin/rm -rf ~root/.ssh/
/bin/rm -f ~root/anaconda-ks.cfg

