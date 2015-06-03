## vcloud_packer_images
Helps you generates an image from an iso ( currently tested using ubuntu 14.04 but should be pretty portable) which we can upload as a skyscape template.  

## Intended use
### General form 
Build a new template:
```./createimage [-p,-u,-o,-t] [build|upload] <template name>```

The createimage script will upload the template to Skyscape or a vCenter compatible provider.

** Required Fields for upload**
* -d distro
* -u username
* -o org
* -c catalog

The upload options will build an ovftool command and the ovftool will in turn prompt you for a password. For the sake of security specifying the
password for image uploading is not allowed.


### Examples
```
git clone git@github.com:UKHomeOffice/vcloud_packer_images.git
cd vcloud_packer_images
./createimage -p p4ssw0rd build centos-66-x64 #_for Centos 66_
./createimage -p p4ssw0rd build ubuntu-1404-x64 #_for Ubuntu 14.04_
./createimage -u 123.456.789 -o 1234-456-223a -t centos -c CentOS  upload centos-66-x64
./createimage build #_you will be prompted for options (distro, vm type, password) during the build run
```

### Skyscape translation
To get API details for skyscape you need to login to the (portal)[https://portal.skyscapecloud.com] and click on your username and then (API)[https://portal.skyscapecloud.com/user/api] . 
This will give you the API details requried to run the createimage tool. **Note** however that the username as specified by Skyscape is actually your username and the organisation 
seperated by an **@** symbol.

## TODO

- Add to the build command so it runs a fix on any json configs before proceeding.
- Figure out how to run this without infecting host system. (If you have vagrant running with something else other than virtualbox, you _should_ be able to vagrant up) 
- Double check ruby dependancies are correct.
- Integrate with local or remote vagrant store to upload vagrant images
- Move puppet scripts to a share directory used by all images
- Make the packer build files an ERB template
- Add PACKER_CACHE_DIR env variable to keep centralised iso cache, if not already.

## Requirements

The following is what you'll need on a fairly recent debian / ubuntu system.

# Ubuntu
- aptitude install unzip qemu libxtst6 libxcursor1 libxinerama1 libxi6 wget ruby -y
- wget -O packer.zip https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip && unzip packer.zip && rm packer.zip && cp packer* /usr/local/bin
- wget -O vmware.bundle https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-11.0.0-2305329.x86_64.bundle && bash vmware.bundle --required --eulas-agreed --console

# Mac os X
- Use brew to install the dependencies above i.e. ruby etc. 
- Brew's version of packer isn't updated enough and doesn't understand the hardware version for the vmware-iso 
- wget -O packer.zip https://dl.bintray.com/mitchellh/packer/packer_0.7.5_darwin_amd64.zip && unzip packer.zip && rm packer.zip && sudo cp packer* /usr/local/bin
- Download VMWARE Fusion for MAC

You'll also need ovftool if it isn't insalled with vmware-workstation / vmware fusion (MAC).  Currently, this is only available on the vmware website after you signup.
ovftool can be downloaded from: [VMWare](https://my.vmware.com/web/vmware/details?downloadGroup=OVFTOOL400&productId=353)

_You'll need to do some work if you want to run this on another type of host._

## Would be nice
- If this feature request ever happens, we'll update the Vagrantfile so this all works within vbox.
- [https://www.virtualbox.org/ticket/4032]
