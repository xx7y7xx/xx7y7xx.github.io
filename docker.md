---
layout: page
title: docker
---

## operation

```
# docker ps # list containers
# systemctl restart docker # restart docker on centos 7
```

## install docker ( Docker Community Edition (Docker CE) ) on ubuntu 16.04

[https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)

```
sudo apt-get update
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
```

```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that the key fingerprint is `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`

```
sudo apt-key fingerprint 0EBFCD88
```

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

```
sudo apt-get update
sudo apt-get install docker-ce
```

## install docker on CentOS 7

[https://docs.docker.com/engine/installation/linux/docker-ce/centos/](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)

中国大陆用户请注意，可以使用清华大学的镜像：

[https://yq.aliyun.com/articles/110806](https://yq.aliyun.com/articles/110806)

```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

will create `/etc/yum.repos.d/docker-ce.repo`

```
sudo yum makecache fast
```

select a version to install

```
sudo yum list docker-ce.x86_64  --showduplicates | sort -r
 * updates: mirrors.aliyun.com
Loading mirror speeds from cached hostfile
Loaded plugins: fastestmirror
 * extras: mirrors.aliyun.com
 * epel: mirrors.aliyun.com
docker-ce.x86_64            17.06.0.ce-1.el7.centos             docker-ce-stable
docker-ce.x86_64            17.03.2.ce-1.el7.centos             docker-ce-stable
docker-ce.x86_64            17.03.1.ce-1.el7.centos             docker-ce-stable
docker-ce.x86_64            17.03.0.ce-1.el7.centos             docker-ce-stable
 * base: mirrors.aliyun.com
Available Packages
```

```
sudo yum install -y docker-ce-17.06.0.ce-1.el7.centos
```

Verify that the fingerprint is correct, and if so, accept the key. The fingerprint should match `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`.

```
Retrieving key from https://download.docker.com/linux/centos/gpg
Importing GPG key 0x621E9F35:
 Userid     : "Docker Release (CE rpm) <docker@docker.com>"
 Fingerprint: 060a 61c5 1b55 8a7f 742b 77aa c52f eb6b 621e 9f35
 From       : https://download.docker.com/linux/centos/gpg
Is this ok [y/N]: y
```

```
sudo systemctl start docker
```

```
sudo docker run hello-world
```
