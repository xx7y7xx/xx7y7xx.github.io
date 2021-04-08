---
layout: post
title: install mongodb on redhat linux 6.4
---

https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/

```
vim /etc/yum.repos.d/mongodb-org-3.2.repo
```

```
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
```

```
sudo yum install -y mongodb-org
```

如果遇到这个错误，说明被墙了

```
https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/repodata/repomd.xml: [Errno 14] problem making ssl connection
Trying other mirror.
Error: Cannot retrieve repository metadata (repomd.xml) for repository: mongodb-org-3.2. Please verify its path and try again
```

可以修改`mongodb-org-3.2.repo`，将`baseurl`中的`https`换成`http`。

但是下载太慢了

```
[root@uf201102372 ~]# sudo yum install -y mongodb-org
Loaded plugins: aliases, changelog, fastestmirror, kabi, presto, refresh-packagekit, security, tmprepo, verify, versionlock
Loading support for CentOS kernel ABI
Setting up Install Process
Loading mirror speeds from cached hostfile
 * base: mirrors.btte.net
 * extras: mirrors.btte.net
 * updates: mirrors.yun-idc.com
mongodb-org-3.2                                                                                                                 | 2.5 kB     00:00     
http://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/repodata/f03a2f6bd5986b3ee8a215a7347b7b6510cf4aba-primary.sqlite.bz2: [Errno 12] Timeout on http://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/repodata/f03a2f6bd5986b3ee8a215a7347b7b6510cf4aba-primary.sqlite.bz2: (28, 'Operation too slow. Less than 1 bytes/sec transfered the last 30 seconds')
Trying other mirror.
http://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/repodata/f03a2f6bd5986b3ee8a215a7347b7b6510cf4aba-primary.sqlite.bz2: [Errno 12] Timeout on http://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/x86_64/repodata/f03a2f6bd5986b3ee8a215a7347b7b6510cf4aba-primary.sqlite.bz2: (28, 'connect() timed out!')
Trying other mirror.
Error: failure: repodata/f03a2f6bd5986b3ee8a215a7347b7b6510cf4aba-primary.sqlite.bz2 from mongodb-org-3.2: [Errno 256] No more mirrors to try.
```

换成国内的源

https://mirror.tuna.tsinghua.edu.cn/help/mongodb/

删除`/etc/yum.repos.d/mongodb-org-3.2.repo`

创建`/etc/yum.repos.d/mongodb.repo`

```
[mongodb-org]
name=MongoDB Repository
baseurl=http://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/$releasever/
gpgcheck=0
enabled=1
```

```
sudo yum makecache
```

出现404报错

```
[root@uf201102372 ~]# sudo yum makecache
Loaded plugins: aliases, changelog, fastestmirror, kabi, presto, refresh-packagekit, security, tmprepo, verify, versionlock
Loading support for CentOS kernel ABI
Loading mirror speeds from cached hostfile
 * base: mirrors.btte.net
 * extras: mirrors.btte.net
 * updates: mirrors.btte.net
base                                                                                                                            | 3.7 kB     00:00     
extras                                                                                                                          | 3.4 kB     00:00     
extras/prestodelta                                                                                                              | 1.3 kB     00:00     
extras/other_db                                                                                                                 |  51 kB     00:00     
http://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/6/repodata/repomd.xml: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
Trying other mirror.
To address this issue please refer to the below knowledge base article 

https://access.redhat.com/articles/1320623

If above article doesn't help to resolve this issue please open a ticket with Red Hat Support.

Error: Cannot retrieve repository metadata (repomd.xml) for repository: mongodb-org. Please verify its path and try again
```

真实路径应该是https://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/el6/

修改`/etc/yum.repos.d/mongodb.repo`

```
[mongodb-org]
name=MongoDB Repository
baseurl=http://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/el$releasever/
gpgcheck=0
enabled=1
```

装完之后回来继续看https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/

```
[root@uf201102372 ~]# ll /etc/mongod.conf
-rw-r--r-- 1 root root 768 Aug 17 01:47 /etc/mongod.conf
```

启动服务

```
sudo service mongod start
```

开机启动

```
sudo chkconfig mongod on
```