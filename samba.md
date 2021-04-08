---
layout: page
title: samba
---

## Install samba on CentOS 6.4

- Install samba service

```
yum install samba
```

- Create a linux user for samba

```
useradd samba-guest
```

- Make samba password (not linux password) for this user

```
smbpasswd -a samba-guest
New SMB password: (123456)
Retype new SMB password: (123456)
Added user samba-guest.
```

- iptables (for old windows) [?](http://wiki.centos.org/HowTos/SetUpSamba)

```
-A INPUT -s 192.168.2.0/24 -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
-A INPUT -s 192.168.2.0/24 -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
-A INPUT -s 192.168.2.0/24 -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
```

- Login from windows

1. input ```\\192.168.0.12``` in explorer.
1. input user ```samba-guest```
1. input password (123456)

## Install samba on CentOS 7.2

[https://www.howtoforge.com/samba-server-installation-and-configuration-on-centos-7](https://www.howtoforge.com/samba-server-installation-and-configuration-on-centos-7)

```
yum install samba samba-client samba-common -y
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
vim /etc/samba/smb.conf
```

```
[global]
	workgroup = WORKGROUP
	server string = Samba Server %v
	netbios name = centos
	security = user
	map to guest = bad user
	dns proxy = no
[pub]
	path = /var/www/html/pub
	browsable =yes
	writable = yes
	guest ok = yes
	read only = no
```

```
mkdir -p /var/www/html/pub
chown nobody.nobody /var/www/html/pub
```

```
systemctl enable smb.service
systemctl enable nmb.service
systemctl restart smb.service
systemctl restart nmb.service
```

## Ubuntu 14.04 创建匿名访问并且可读写的samba

创建guest用户。

```
useradd samba-guest
```

server端，在global中添加

```
guest account = samba-guest
```

设定用户往samba上创建文件/目录时候的权限为777，那么在server端，在global中添加

```
create mask = 0777
directory mask = 0777
```

server端，添加一个profile

```
[share]
comment = SPP Share
path = /public/www/share
public = yes
writeable = yes
browseable = yes
guest ok = yes
#force user = nobody
#force group = nogroup
available = yes
```

client端，在fstab中添加

```
//192.168.2.21/share /home/chenyang/mnt/share cifs rw,username=samba-guest,file_mode=0777,dir_mode=0777,uid=chenyang,gid=chenyang        0 0
```

对于centos来说，除了以上步骤，还需要进行：

需要创建guest用户的同时，并设定linux密码，以及samba密码。

```
useradd samba-guest
passwd samba-guest
smbpasswd -a samba-guest
```