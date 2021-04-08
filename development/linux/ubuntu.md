---
layout: page
title: Ubuntu
---

## tools

- [zsh](/dev/zsh/index.html)

## Ubuntu 16.04

- [Oracle Java](java.html)

禁用桌面（GUI）启动，改成命令行界面（CUI）

```
sudo apt-get remove lightdm
```

如果需要恢复桌面（GUI）

```
sudo apt-get install lightdm
```

### 内存占用太高

通过 system-monitor 检查哪些进程内存占用太高，很有可能是内存泄漏，一般处理是重新该应用

unity-panel-service

```
kill $(pgrep unity-panel-ser)
```

## ubuntu 14.04 拼音输入法修复

现象：当打算输入“nihao（你好）”的时候，变成了“niha o（你哈 o）”

解决办法：在终端输入如下，然后立即生效。

```
ibus-daemon -drx
```

问题参照：[http://forum.ubuntu.org.cn/viewtopic.php?f=48&t=462077](http://forum.ubuntu.org.cn/viewtopic.php?f=48&t=462077)

## ubuntu 14.04 默认字体貌似是楷体了，怎么解决

    sudo apt-get remove fonts-arphic-ukai
    sudo apt-get remove fonts-arphic-uming

来源：[http://tieba.baidu.com/p/2860116269](http://tieba.baidu.com/p/2860116269)

## 修改为文本启动

sudo vim /etc/default/grub

将
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
改为
GRUB_CMDLINE_LINUX_DEFAULT="text"

启动的时候就不会显示 splash 了。

将
#GRUB_TERMINAL=console
改为
GRUB_TERMINAL=console

参照：[http://wiki.centos.org/HowTos/SetUpSamba](http://wiki.centos.org/HowTos/SetUpSamba)

## ubuntu 下如何查看硬盘硬件信息

    sudo lshw -c storage -c disk

## ssmtp

参照[http://www.nixtutor.com/linux/send-mail-with-gmail-and-ssmtp/](http://www.nixtutor.com/linux/send-mail-with-gmail-and-ssmtp/)

    #
    # Config file for sSMTP sendmail
    #
    # The person who gets all mail for userids < 1000
    # Make this empty to disable rewriting.
    #root=ci@spolo.org

    # The place where the mail goes. The actual machine name is required no
    # MX records are consulted. Commonly mailhosts are named mail.domain.com
    #mailhub=smtp.spolo.org:25

    # Where will the mail seem to come from?
    #rewriteDomain=

    # The full hostname
    #hostname=sp-storage

    # Are users allowed to set their own From: address?
    # YES - Allow the user to specify their own From: address
    # NO - Use the system generated From: address
    #FromLineOverride=YES

    # mail.spolo.org
    #mailhub=smtp.spolo.org:25
    #AuthUser=ci@spolo.org
    #AuthPass=sp12345678
    #UseTLS=NO
    #UseSTARTTLS=NO
    #FromLineOverride=YES

    # gmail.com
    root=username@gmail.com
    mailhub=smtp.gmail.com:587
    hostname=uge.superpolo@gmail.com
    UseSTARTTLS=YES
    AuthUser=uge.superpolo
    AuthPass=uge2011spp
    FromLineOverride=YES

## ubuntu 14.04 install flash plugin for chrome

```
sudo apt-get install pepperflashplugin-nonfree
```

## mount ssh as filesystem

    fusermount: failed to open /etc/fuse.conf: Permission denied

[http://blog.tordeu.com/?p=50](http://blog.tordeu.com/?p=50)

## restart vino server

    $ pkill vino
    $ export DISPLAY=:0.0
    $ /usr/lib/vino/vino-server &

## Chrome(Chromium) using xdg-open to open external application

Append line to this file: `~/.local/share/applications/mimeapps.list`

    x-scheme-handler/gluehome=gluehome.desktop

Create this file `/usr/share/applications/gluehome.desktop` to call application.

## Install new NIC

[ref](https://bowerstudios.com/node/1015)

After installed hardware.

Show current config, only one interface for old card.

```
chenyang@ubuntu:~$ cat /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet dhcp
```

Find the name of the card

```
chenyang@ubuntu:~$ dmesg |grep -i network
[    4.264991] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    4.340735] FUJITSU Extended Socket Network Device Driver - version 1.0 - Copyright (c) 2015 FUJITSU LIMITED
[    5.888334] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
[    7.260713] e1000 0000:00:08.0 eth1: Intel(R) PRO/1000 Network Connection
[   18.598914] audit: type=1400 audit(1468462899.196:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=753 comm="apparmor_parser"
[   18.598923] audit: type=1400 audit(1468462899.196:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=753 comm="apparmor_parser"
```

Two card

```
[    5.888334] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
[    7.260713] e1000 0000:00:08.0 eth1: Intel(R) PRO/1000 Network Connection
```

But name changed ([Predictable Network Interface Names](https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/) and [name rule](https://github.com/systemd/systemd/blob/master/src/udev/udev-builtin-net_id.c))

```
chenyang@ubuntu:~$ dmesg | grep -e eth1 -e tulip
[    7.254168] e1000 0000:00:08.0 eth1: (PCI:33MHz:32-bit) 08:00:27:29:a5:5d
[    7.260713] e1000 0000:00:08.0 eth1: Intel(R) PRO/1000 Network Connection
[    7.296480] e1000 0000:00:08.0 enp0s8: renamed from eth1
```

But only one used.

```
chenyang@ubuntu:~$ ifconfig
enp0s3    Link encap:Ethernet  HWaddr 08:00:27:6a:1c:2b
          inet addr:10.1.234.245  Bcast:10.1.255.255  Mask:255.255.192.0
          inet6 addr: fe80::a00:27ff:fe6a:1c2b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1477 errors:0 dropped:0 overruns:0 frame:0
          TX packets:167 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:213839 (213.8 KB)  TX bytes:24788 (24.7 KB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:152 errors:0 dropped:0 overruns:0 frame:0
          TX packets:152 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:11248 (11.2 KB)  TX bytes:11248 (11.2 KB)
```

Modify `/etc/network/interfaces` to add new card

```
auto enp0s8
iface enp0s8 inet dhcp
```

restart network interface

```
sudo /etc/init.d/networking restart
```

## Ubuntu 16.04 安装英文版之后无法输入中文

因为`ibus-pinyin`没有安装导致的。

```
sudo apt-get install ibus-pinyin
```

ibus-setup 打开“IBus Preferences > Input Method”，然后点击“Add”按钮，再点“Chinese > Pinyin”

再打开“Text Entry”，点击“+”按钮，添加“Chinese (Pinyin) (IBus)”选项。确保“Input sources to use:”里面第一个是“English (US)”，第二个是“Chinese (Pinyin) (IBus)”。

## How To Add Right-Click Convert and Resize Images in Nautilus

```
sudo add-apt-repository ppa:atareao/nautilus-extensions
sudo apt-get update
sudo apt-get install nautilus-image-tools
nautilus -q
```

To convert many PNG: select many images > Image Tools > convert > a window appear > select destination format e.g. JPEG > OK

refs: [http://www.ubuntubuzz.com/2015/10/how-to-add-right-click-convert-and-resize-images-nautilus.html](http://www.ubuntubuzz.com/2015/10/how-to-add-right-click-convert-and-resize-images-nautilus.html)

## apt-get proxy

```
sudo su
export http_proxy=http://127.0.0.1:8080
export https_proxy=https://127.0.0.1:8080
apt-get install ...
```

## CPU temperature monitor

```
sudo apt-get install psensor
```

## See also

- [apt](/apt.html)
- [Ubuntu 16.04](/ubuntu-16.04.html)
