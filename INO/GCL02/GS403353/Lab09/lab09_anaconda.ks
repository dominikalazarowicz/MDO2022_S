# Generated by Anaconda 36.16.2
# Generated by pykickstart v3.36
#version=F36
# Use graphical install
text

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us','pl (legacy)'
# System language
lang en_US.UTF-8

# Network information
network --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network --hostname=Lab09.template

# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

%packages
@^minimal-environment

%end

# Run the Setup Agent on first boot
firstboot --enable

# Generated using Blivet version 3.4.3
ignoredisk --only-use=sda
# Partition clearing information
clearpart --none --initlabel
# Disk partitioning information
part /boot --fstype="xfs" --ondisk=sda --size=1024
part pv.50 --fstype="lvmpv" --ondisk=sda --size=16687
volgroup fedora_lab09 --pesize=4096 pv.50
logvol none --size=13312 --thinpool --metadatasize=16 --chunksize=64 --name=pool00 --vgname=fedora_lab09
logvol / --fstype="xfs" --size=13312 --thin --poolname=pool00 --name=root --vgname=fedora_lab09

# System timezone
timezone Europe/Warsaw --utc

# Root password
rootpw --iscrypted $y$j9T$paHUW1Pfhem3Rb0zscb.kovQ$JwjqAFnLkhd6314Ygrp.0Hi3nNSmQ1pxAdT8qbS9is1
user --name=grrd --password=$y$j9T$yFMCvMPh/thMyMgeM5caSp5h$8SjrQSCDQ/MkabHGrhenqNmshWYsLfYWIVt3Iedkp08 --iscrypted --gecos="grrd"

%post
echo "post-inst code"

mkdir /root/2048game
cd /root/2048game
curl -o 2048 -L https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/raw/GS403353/INO/GCL02/GS403353/Lab09/2048

%end
