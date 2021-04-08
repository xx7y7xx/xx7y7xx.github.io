---
layout: page
title: Node.js CentOS Installation
---

## CentOS 7.x

### Install node@6.x from EPEL (nodejs version too low)

```
sudo yum install epel-release
sudo yum install nodejs
```

```
$ node -v
v6.16.0
```

How to remove

```
sudo yum remove nodejs
```

### Install latest stable from nodesource

```
$ sudo yum install -y gcc-c++ make
$ curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
```

```
$ node -v
v10.16.0
```

## RedHat 7.x

### installation node@6.x

```
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
```

```
# rpm -qf /etc/yum.repos.d/nodesource-el.repo 
nodesource-release-el7-1.noarch
```

```
yum -y install nodejs
yum -y install gcc-c++ make  # optional
```

### installation node@8.x

```
curl -sL https://rpm.nodesource.com/setup_8.x | bash -
yum -y install nodejs
yum -y install gcc-c++ make  # optional
```

### upgrade from node@6.x to node@8.x

```
[root@yy238 ~]# node -v
v6.10.3
[root@yy238 ~]# npm -v
3.10.10
```

```
[root@yy238 ~]# cat /etc/yum.repos.d/nodesource-el.repo 
[nodesource]
name=Node.js Packages for Enterprise Linux 7 - $basearch
baseurl=https://rpm.nodesource.com/pub_6.x/el/7/$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL

[nodesource-source]
name=Node.js for Enterprise Linux 7 - $basearch - Source
baseurl=https://rpm.nodesource.com/pub_6.x/el/7/SRPMS
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL
gpgcheck=1
```

```
sudo yum remove nodesource-release
sudo yum clean all && sudo yum check-update
curl -sL https://rpm.nodesource.com/setup_8.x | bash -
sudo yum install -y nodejs
```

```
[root@yzb-centos-08 chenyang]# node -v
v8.2.1
[root@yzb-centos-08 chenyang]# npm -v
5.3.0
```

`yum remove nodesource` will make sure this bug not happen [https://github.com/nodesource/distributions/issues/421#issuecomment-318560799](https://github.com/nodesource/distributions/issues/421#issuecomment-318560799) (`nodesource-el.repo` and `nodesource-el7.repo`)

#### FAQ

> upgrade nodejs from v6 to v8 "Repository nodesource is listed more than once in the configuration"

when run this command:

```
# sudo yum install -y nodejs
Loaded plugins: fastestmirror
Repository nodesource is listed more than once in the configuration
Repository nodesource-source is listed more than once in the configuration
```

check the env

```
# ll /etc/yum.repos.d/nodesource*
-rw-r--r-- 1 root root 472 May 31 02:34 /etc/yum.repos.d/nodesource-el7.repo
-rw-r--r-- 1 root root 472 Apr 27  2016 /etc/yum.repos.d/nodesource-el.repo
```

`nodesource-el.repo` was installed with rpm (https://rpm.nodesource.com/pub_6.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm) at previous version (for example nodejs v6.x)

run this command to show package name.

```
# rpm -qf /etc/yum.repos.d/nodesource-el.repo 
file /etc/yum.repos.d/nodesource-el.repo is not owned by any package
# rpm -qf /etc/yum.repos.d/nodesource-el7.repo 
nodesource-release-el7-1.noarch
```

`nodesource-el7.repo` was created by rpm when you run `curl -sL https://rpm.nodesource.com/setup_8.x | bash -`, and rpm is `https://rpm.nodesource.com/pub_8.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm`

here is the solution

```
sudo yum remove nodesource-release
```

```
# ll /etc/yum.repos.d/nodesource*
-rw-r--r-- 1 root root 472 Apr 27  2016 /etc/yum.repos.d/nodesource-el.repo
```

```
rm -rf /etc/yum.repos.d/nodesource-el.repo
```

```
curl -sL https://rpm.nodesource.com/setup_8.x | bash -
yum clean all
yum install -y nodejs
```

remove with `sudo yum remove nodesource-release`, then `/etc/yum.repos.d/nodesource-el.repo` will be removed.

