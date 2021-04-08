---
layout: page
title: mongodb installation
---

## install on ubuntu 16.04 with apt

### install

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
```

log: `/var/log/mongodb/mongod.log`

```
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] MongoDB starting : pid=9358 port=27017 dbpath=/var/lib/mongodb 64-bit host=chenyang-pc
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] db version v3.2.8
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] git version: ed70e33130c977bda0024c125b56d159573dbaf0
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] OpenSSL version: OpenSSL 1.0.2g-fips  1 Mar 2016
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] allocator: tcmalloc
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] modules: none
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] build environment:
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten]     distmod: ubuntu1604
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten]     distarch: x86_64
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten]     target_arch: x86_64
2016-08-06T15:50:47.210+0800 I CONTROL  [initandlisten] options: { config: "/etc/mongod.conf", net: { bindIp: "127.0.0.1", port: 27017 }, storage: { dbPath: "/var/lib/mongodb", journal: { enabled: true } }, systemLog: { destination: "file", logAppend: true, path: "/var/log/mongodb/mongod.log", quiet: true } }
2016-08-06T15:50:47.229+0800 I STORAGE  [initandlisten] wiredtiger_open config: create,cache_size=8G,session_max=20000,eviction=(threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,archive=true,path=journal,compressor=snappy),file_manager=(close_idle_time=100000),checkpoint=(wait=60,log_size=2GB),statistics_log=(wait=0),
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
2016-08-06T15:50:47.366+0800 I FTDC     [initandlisten] Initializing full-time diagnostic data capture with directory '/var/lib/mongodb/diagnostic.data'
2016-08-06T15:50:47.366+0800 I NETWORK  [HostnameCanonicalizationWorker] Starting hostname canonicalization worker
2016-08-06T15:50:47.395+0800 I NETWORK  [initandlisten] waiting for connections on port 27017
```

config file: `/etc/mongod.conf`

data files: `/var/lib/mongodb`

log files: `/var/log/mongodb`

### operations

```
sudo service mongod start
sudo service mongod stop
sudo service mongod restart
```

## install on centos 7

### version 3.2

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
service mongod start
sudo chkconfig mongod on
```

### versio 3.4

[https://docs.mongodb.com/master/tutorial/install-mongodb-on-red-hat/](https://docs.mongodb.com/master/tutorial/install-mongodb-on-red-hat/)

create `/etc/yum.repos.d/mongodb-org-3.4.repo`

```
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```

```
sudo yum install -y mongodb-org
sudo service mongod start
sudo chkconfig mongod on # centos 6
sudo systemctl enable mongod.service # centos 7
```

## FAQ

如果下载速度太慢了，可以尝试国内源[https://mirror.tuna.tsinghua.edu.cn/help/mongodb/](https://mirror.tuna.tsinghua.edu.cn/help/mongodb/)

## References

- install on ubuntu [https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/?_ga=1.99395229.2086652299.1470468883](https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/?_ga=1.99395229.2086652299.1470468883)
- Install MongoDB Community Edition on Windows [http://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows](http://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows)