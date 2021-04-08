---
layout: post
title: TL-WN826N USB Wireless Wifi Adapter on Ubuntu 16.04
---

[https://wikidevi.com/wiki/TP-LINK_TL-WN823N_v1](https://wikidevi.com/wiki/TP-LINK_TL-WN823N_v1)

[http://blog.csdn.net/chaisonglei2010/article/details/51738242](http://blog.csdn.net/chaisonglei2010/article/details/51738242)

## Building and installing using DKMS

```
sudo apt-get install git linux-headers-generic build-essential dkms
git clone https://github.com/Mange/rtl8192eu-linux-driver.git
cd rtl8192eu-linux-driver
sudo dkms add .
sudo dkms install rtl8192eu/1.0
```

No need to reboot

how to remove

```
sudo dkms remove rtl8192eu/1.0 --all
```

how to uninstall

```
sudo dkms uninstall rtl8192eu/1.0
```

## FAQ

**Can not find wireless wifi adapter after reboot.**

Method 1:

Try to unplug the USB port of adapter and plug in again.

If not work, try method 2

Method 2:

```
sudo dkms uninstall rtl8192eu/1.0
sudo dkms remove rtl8192eu/1.0 --all
cd rtl8192eu-linux-driver
sudo dkms add .
sudo dkms install rtl8192eu/1.0
```

Try to unplug the USB port of adapter and plug in again.

```
sudo service network-manager restart
```

Method 3: (I haven't tested this method yet)

```
sudo dkms uninstall rtl8192eu/1.0
sudo dkms install rtl8192eu/1.0
```

Method 4:

reboot twice and unplug and plug again

**Other**

```
sudo service network-manager restart
```

## kernel version upper than 4.4.x

Try this code:

- [https://github.com/masterzorag/RTL8192EU-linux/tree/linux-4.11](https://github.com/masterzorag/RTL8192EU-linux/tree/linux-4.11)
- [https://github.com/CGarces/rtl8192eu-linux-driver/tree/v4.4.1](https://github.com/CGarces/rtl8192eu-linux-driver/tree/v4.4.1)

## See also

- [Install TL-WN826N USB Wireless Wifi Adapter (rtl8192eu) on Ubuntu 17.04 (Linux kernel 4.9.x above)](/2017/06/02/install-tl-wn826n-usb-wireless-wifi-adapter-rtl8192eu-on-ubuntu-17.04.html)