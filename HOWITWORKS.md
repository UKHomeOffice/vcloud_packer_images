# More detailed explanation of how the various components fits together

## Kickstart generation
1. The createimage script will parse the *ks-or-preseed.template* file in the *templates* directory. It will treat the file as an **ERB** template. 
1. The createimage script will then save this file which is the file that packer will use to build against. This allows customizations like a custom root password.


## RHEL7 VMWare tools installation
The documentation for VMWare tools can be found at: [http://partnerweb.vmware.com/GOSIG/home.html] where you can select the specific OS for detailed instructions.
For Red Hat 7.0 you should install *open-vm-tools-deploypkg* which will also install *open-vm-tools* as dependency. In addition the installation of ```gcc make gcc-c++ kernel-devel-`uname -r` perl``` is required for *Guest Customization* to work correctly in Skyscape and potentially elsewhere. 

## CentOS 7.0 image creation
The openvm tools does not currently recognize CentOS7.0 . To fix it you should change the /etc/redhat-release to *Red Hat Enterprise Linux Server release 7.0 (Maipo)*


## Software selection
TODO: Add why are packages being removed and or added

