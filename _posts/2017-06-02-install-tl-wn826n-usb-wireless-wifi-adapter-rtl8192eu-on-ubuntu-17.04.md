---
layout: post
title: Install TL-WN826N USB Wireless Wifi Adapter (rtl8192eu) on Ubuntu 17.04 (Linux kernel 4.9.x above)
---

Install TL-WN826N USB Wireless Wifi Adapter (rtl8192eu) and driver on Ubuntu 17.04 (Linux kernel 4.9.x above)

## before installation

```
$ sudo dkms status

```

```
$ lsmod | grep -e nids -e rtl
rtl8xxxu              126976  0
mac80211              782336  1 rtl8xxxu
```

```
$ dmesg | grep rtl
[64810.406771] usb 1-1.2: rtl8192eu_parse_efuse: dumping efuse (0x200 bytes):
[64810.406917] usb 1-1.2: rtl8xxxu: Loading firmware rtlwifi/rtl8192eu_nic.bin
[64811.499478] rtl8xxxu 1-1.2:1.0 wlx30b49e50c7d9: renamed from wlan0
[65360.719489] usb 1-1.2: rtl8192eu_active_to_emu: Disabling MAC timed out
[65940.847794] usb 1-1.2: rtl8192eu_parse_efuse: dumping efuse (0x200 bytes):
[65940.847887] usb 1-1.2: rtl8xxxu: Loading firmware rtlwifi/rtl8192eu_nic.bin
[65941.940001] rtl8xxxu 1-1.2:1.0 wlx30b49e50c7d9: renamed from wlan0
[65987.531191] usb 1-1.2: rtl8192eu_active_to_emu: Disabling MAC timed out
```

## try ppa:hanipouspilot/rtlwifi

```
$ sudo add-apt-repository ppa:hanipouspilot/rtlwifi
 This is ppa for Realtek drivers from Larry Finger's github.

rtl8192eu is packaged from the Realtek site with some compat patches.
 More info: https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi
Press [ENTER] to continue or ctrl-c to cancel adding it

gpg: keybox '/tmp/tmp4epremj3/pubring.gpg' created
gpg: /tmp/tmp4epremj3/trustdb.gpg: trustdb created
gpg: key 7036069A2F22E44A: public key "Launchpad PPA for Pilot6" imported
gpg: Total number processed: 1
gpg:               imported: 1
OK
```

```
$ sudo apt-get update
Hit:1 http://cn.archive.ubuntu.com/ubuntu zesty InRelease
Hit:2 http://cn.archive.ubuntu.com/ubuntu zesty-updates InRelease                                                                   
Hit:3 http://cn.archive.ubuntu.com/ubuntu zesty-backports InRelease                                                                 
Ign:4 http://ppa.launchpad.net/hanipouspilot/rtlwifi/ubuntu zesty InRelease                                                       
Get:5 http://security.ubuntu.com/ubuntu zesty-security InRelease [89.2 kB]
...
Ign:13 http://ppa.launchpad.net/hanipouspilot/rtlwifi/ubuntu zesty/main all DEP-11 Metadata
Ign:14 http://ppa.launchpad.net/hanipouspilot/rtlwifi/ubuntu zesty/main DEP-11 64x64 Icons
Ign:14 http://120.52.72.23/ppa.launchpad.net/c3pr90ntc0td/hanipouspilot/rtlwifi/ubuntu zesty/main DEP-11 64x64 Icons
Fetched 122 kB in 14s (8,558 B/s)
Reading package lists... Done
W: The repository 'http://ppa.launchpad.net/hanipouspilot/rtlwifi/ubuntu zesty Release' does not have a Release file.
N: Data from such a repository can't be authenticated and is therefore potentially dangerous to use.
N: See apt-secure(8) manpage for repository creation and user configuration details.
E: Failed to fetch http://ppa.launchpad.net/hanipouspilot/rtlwifi/ubuntu/dists/zesty/main/dep11/icons-64x64.tar  404  Not Found
E: Some index files failed to download. They have been ignored, or old ones used instead.
```

no package for 17.04

[https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi](https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi)

## try build

```
$ sudo apt-get install git linux-headers-generic build-essential dkms
```

```
$ git clone https://github.com/Mange/rtl8192eu-linux-driver.git
$ cd rtl8192eu-linux-driver
$ sudo dkms add .

Creating symlink /var/lib/dkms/rtl8192eu/1.0/source ->
                 /usr/src/rtl8192eu-1.0

DKMS: add completed.
```

```
$ sudo dkms install rtl8192eu/1.0

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area...
'make' all KVER=4.10.0-21-generic..................
cleaning build area...

DKMS: build completed.

8192eu.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.10.0-21-generic/updates/dkms/

depmod...

Backing up initrd.img-4.10.0-21-generic to /boot/initrd.img-4.10.0-21-generic.old-dkms
Making new initrd.img-4.10.0-21-generic
(If next boot fails, revert to initrd.img-4.10.0-21-generic.old-dkms image)
update-initramfs.......

DKMS: install completed.
```

```
$ sudo dkms status
rtl8192eu, 1.0, 4.10.0-21-generic, x86_64: installed
```

```
$ sudo service network-manager restart
```

plug the adapter in, but cant access.

## modify /etc/modules

[https://github.com/Mange/rtl8192eu-linux-driver/issues/46#issuecomment-320543338](https://github.com/Mange/rtl8192eu-linux-driver/issues/46#issuecomment-320543338)

```
sudo vim /etc/modules
```

add this line

```
8192eu
```

then reboot

## See also

- [Install TL-WN826N USB Wireless Wifi Adapter on Ubuntu 16.04](/2017/03/28/install-tl-wn826n-usb-wireless-wifi-adapter-rtl8192eu-on-ubuntu-16.04.html)

## References

- [https://github.com/Mange/rtl8192eu-linux-driver](https://github.com/Mange/rtl8192eu-linux-driver)
- [https://askubuntu.com/questions/802500/clicking-an-ap-in-network-manager-causes-error-the-access-point-was-not-in-the](https://askubuntu.com/questions/802500/clicking-an-ap-in-network-manager-causes-error-the-access-point-was-not-in-the)
- [https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi](https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi)
- [https://ubuntuforums.org/showthread.php?t=2342003&page=2](https://ubuntuforums.org/showthread.php?t=2342003&page=2)
- [STEP-4 section](https://scdas141.wordpress.com/2017/01/28/how-to-compile-mangertl8192eu-linux-driver-driver/)