---
layout: post
title:  "Install mongodb on aliyun centos 7"
date:   2016-08-10 14:48:33 +0800
categories: mongodb
---

create `/etc/yum.repos.d/mongodb-org-3.2.repo`

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

```
[root@iZ25xkf099kZ chenyang]# service mongod status
● mongod.service - SYSV: Mongo is a scalable, document-oriented database.
   Loaded: loaded (/etc/rc.d/init.d/mongod)
   Active: inactive (dead)
     Docs: man:systemd-sysv-generator(8)
```

```
[root@iZ25xkf099kZ chenyang]# service mongod start
Starting mongod (via systemctl):                           [  OK  ]
```

```
[root@iZ25xkf099kZ chenyang]# service mongod status
● mongod.service - SYSV: Mongo is a scalable, document-oriented database.
   Loaded: loaded (/etc/rc.d/init.d/mongod)
   Active: active (running) since Wed 2016-08-10 16:30:32 CST; 2s ago
     Docs: man:systemd-sysv-generator(8)
  Process: 17095 ExecStart=/etc/rc.d/init.d/mongod start (code=exited, status=0/SUCCESS)
 Main PID: 17106 (mongod)
   CGroup: /system.slice/mongod.service
           └─17106 /usr/bin/mongod -f /etc/mongod.conf

Aug 10 16:30:32 iZ25xkf099kZ systemd[1]: Starting SYSV: Mongo is a scalable, document-oriented database....
Aug 10 16:30:32 iZ25xkf099kZ runuser[17102]: pam_unix(runuser:session): session opened for user mongod by (uid=0)
Aug 10 16:30:32 iZ25xkf099kZ mongod[17095]: Starting mongod: [  OK  ]
Aug 10 16:30:32 iZ25xkf099kZ systemd[1]: Started SYSV: Mongo is a scalable, document-oriented database..
```

```
sudo chkconfig mongod on
```

```
[root@iZ25xkf099kZ chenyang]# less /var/log/mongodb/mongod.log 
```