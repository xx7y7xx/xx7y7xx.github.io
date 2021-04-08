---
layout: post
title: install nodejs on redhat 6.4
---


```
[root@uf201102372 ~]# curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
[root@uf201102372 ~]# echo $?
0
[root@uf201102372 ~]# curl --location https://rpm.nodesource.com/setup_4.x | bash -

curl: (35) SSL connect error
```

http://serverfault.com/questions/606135/curl-35-ssl-connect-error

```
[root@uf201102372 ~]# yum update nss

```

```
[root@uf201102372 ~]# curl --location https://rpm.nodesource.com/setup_4.x | bash -
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13428  100 13428    0     0   6138      0  0:00:02  0:00:02 --:--:-- 67140

## Installing the NodeSource Node.js v4.x LTS Argon repo...

```

```
[root@uf201102372 ~]# yum -y install nodejs

```