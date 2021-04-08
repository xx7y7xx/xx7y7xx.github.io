---
layout: page
title: CentOS
---


```
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
```

```
sudo yum install deltarpm
```

## Install and Activate Bash Autocomplete Feature

```
sudo yum install bash-completion
```

ref: [https://www.cyberciti.biz/faq/fedora-redhat-scientific-linuxenable-bash-completion/](https://www.cyberciti.biz/faq/fedora-redhat-scientific-linuxenable-bash-completion/)

## centos 7 change hostname

[https://www.atlantic.net/community/howto/change-your-hostname-in-centos-7/](https://www.atlantic.net/community/howto/change-your-hostname-in-centos-7/)

`hostnamectl` will modify `/etc/hostname` and `/etc/machine-info`, and will not modify `/etc/hosts`

```
# hostnamectl 
   Static hostname: localhost.localdomain
Transient hostname: yzb-centos-08
         Icon name: computer-vm
           Chassis: vm
        Machine ID: ef3e5618f3854f9e8f279e42f3f310d9
           Boot ID: 7d5b180711004778aae7e6179a05ad05
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-327.28.3.el7.x86_64
      Architecture: x86-64
```

```
# cat /etc/sysconfig/network
# Created by anaconda
```

```
# hostname
yzb-centos-08
```

```
# cat /etc/hostname 
localhost.localdomain
```

```
# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
```

```
# cat /etc/machine-info
cat: /etc/machine-info: No such file or directory
```

Set all with `hostnamectl`

```
hostnamectl set-hostname 'Server222'
```

checking

```
# hostnamectl
   Static hostname: server222
   Pretty hostname: Server222
         Icon name: computer-vm
           Chassis: vm
        Machine ID: ef3e5618f3854f9e8f279e42f3f310d9
           Boot ID: 7d5b180711004778aae7e6179a05ad05
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-327.28.3.el7.x86_64
      Architecture: x86-64
```

```
# hostname
server222
# cat /etc/hostname 
server222
# cat /etc/machine-info
PRETTY_HOSTNAME=Server222
```

modify `/etc/hosts`

```
# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 server222
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
```

## See also

- [yum](/yum.html)