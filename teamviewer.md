---
layout: page
title: Teamviewer
---

## Teamviewer (VPN) and Privoxy

通过Teamviewer VPN访问远程主机所在的网络，比如在北京访问xx现场的网络。

在xx的一台电脑中安装teamviewer和Privoxy

## Ubuntu 16.04

download teamviewer_xxxx_i386.deb

```
sudo dpkg -i teamviewer_xxxx_i386.deb
sudo apt-get install -f
```

[http://unix.stackexchange.com/a/159114/189029](http://unix.stackexchange.com/a/159114/189029)

## Ubuntu 17.04

```
chenyang@chenyang-Lenovo:~/Downloads$ sudo dpkg -i teamviewer_12.0.76279_i386.deb 
[sudo] password for chenyang: 
Selecting previously unselected package teamviewer:i386.
(Reading database ... 204168 files and directories currently installed.)
Preparing to unpack teamviewer_12.0.76279_i386.deb ...
Unpacking teamviewer:i386 (12.0.76279) ...
dpkg: dependency problems prevent configuration of teamviewer:i386:
 teamviewer:i386 depends on libc6 (>= 2.11).
 teamviewer:i386 depends on libgcc1.
 teamviewer:i386 depends on libasound2.
 teamviewer:i386 depends on libdbus-1-3.
 teamviewer:i386 depends on libexpat1.
 teamviewer:i386 depends on libfontconfig1.
 teamviewer:i386 depends on libfreetype6.
 teamviewer:i386 depends on libjpeg62.
 teamviewer:i386 depends on libsm6.
 teamviewer:i386 depends on libxdamage1.
 teamviewer:i386 depends on libxext6.
 teamviewer:i386 depends on libxfixes3.
 teamviewer:i386 depends on libxinerama1.
 teamviewer:i386 depends on libxrandr2.
 teamviewer:i386 depends on libxrender1.
 teamviewer:i386 depends on libxtst6.
 teamviewer:i386 depends on zlib1g.

dpkg: error processing package teamviewer:i386 (--install):
 dependency problems - leaving unconfigured
Processing triggers for bamfdaemon (0.5.3+17.04.20170406-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for gnome-menus (3.13.3-6ubuntu5) ...
Processing triggers for desktop-file-utils (0.23-1ubuntu2) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.15-1) ...
Errors were encountered while processing:
 teamviewer:i386
```

```
chenyang@chenyang-Lenovo:~/Downloads$ sudo apt-get install -f
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Correcting dependencies... Done
The following additional packages will be installed:
  gcc-6-base:i386 libasound2:i386 libc6:i386 libdbus-1-3:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386
  libgcrypt20:i386 libgpg-error0:i386 libice6:i386 libjpeg62:i386 liblz4-1:i386 liblzma5:i386 libpcre3:i386 libpng16-16:i386
  libselinux1:i386 libsm6:i386 libsystemd0:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdamage1:i386
  libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386
Suggested packages:
  libasound2-plugins:i386 glibc-doc:i386 locales:i386 rng-tools:i386
The following NEW packages will be installed:
  gcc-6-base:i386 libasound2:i386 libc6:i386 libdbus-1-3:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386
  libgcrypt20:i386 libgpg-error0:i386 libice6:i386 libjpeg62:i386 liblz4-1:i386 liblzma5:i386 libpcre3:i386 libpng16-16:i386
  libselinux1:i386 libsm6:i386 libsystemd0:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdamage1:i386
  libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386
0 upgraded, 32 newly installed, 0 to remove and 1 not upgraded.
1 not fully installed or removed.
Need to get 5,677 kB of archives.
After this operation, 20.2 MB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://cn.archive.ubuntu.com/ubuntu zesty/main i386 gcc-6-base i386 6.3.0-12ubuntu2 [17.4 kB]
Get:2 http://cn.archive.ubuntu.com/ubuntu zesty/main i386 libgcc1 i386 1:6.3.0-12ubuntu2 [48.0 kB]
Get:3 http://cn.archive.ubuntu.com/ubuntu zesty/main i386 libc6 i386 2.24-9ubuntu2 [2,278 kB]
Get:4 http://cn.archive.ubuntu.com/ubuntu zesty/main i386 libasound2 i386 1.1.3-5 [380 kB]                                          
Get:5 http://cn.archive.ubuntu.com/ubuntu zesty/main i386 libgpg-error0 i386 1.26-2 [37.4 kB]
...
```
