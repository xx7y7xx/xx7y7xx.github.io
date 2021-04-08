---
layout: page
title: Redis
---

## Installation

### Install Redis on Ubuntu 16.04

```
$ cd /tmp
$ curl -O http://download.redis.io/redis-stable.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1702k  100 1702k    0     0   493k      0  0:00:03  0:00:03 --:--:--  493k
 /tmp  tar xzvf redis-stable.tar.gz
 /tmp  cd redis-stable
 /tmp/redis-stable  make
 /tmp/redis-stable  make test
 /tmp/redis-stable  sudo make install
```

Configure

```
$ sudo mkdir /etc/redis
$ sudo cp /tmp/redis-stable/redis.conf /etc/redis
```

```
$ sudo vim /etc/redis/redis.conf
```

```
supervised systemd
...
dir /var/lib/redis
```

```
cat /etc/systemd/system/redis.service
```

```
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target

[Install]
WantedBy=multi-user.target
```

```
$ sudo adduser --system --group --no-create-home redis
$ sudo mkdir /var/lib/redis
$ sudo chown redis:redis /var/lib/redis
$ sudo chmod 770 /var/lib/redis
```

```
$ sudo systemctl start redis
$ sudo systemctl status redis
```

```
redis-cli ping
```

### Install Redis on centos 7

```
[root@iZ2zecte3psk7ivq1nb59cZ client]# sudo yum install redis -y
[root@iZ2zecte3psk7ivq1nb59cZ client]# sudo systemctl enable redis.service
[root@iZ2zecte3psk7ivq1nb59cZ client]# sudo systemctl start redis.service
[root@iZ2zecte3psk7ivq1nb59cZ client]# sudo systemctl status redis.service
● redis.service - Redis persistent key-value database
   Loaded: loaded (/usr/lib/systemd/system/redis.service; disabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/redis.service.d
           └─limit.conf
   Active: active (running) since Wed 2017-08-23 17:31:20 CST; 3s ago
 Main PID: 6159 (redis-server)
   Memory: 4.2M
   CGroup: /system.slice/redis.service
           └─6159 /usr/bin/redis-server 127.0.0.1:6379

Aug 23 17:31:20 iZ2zecte3psk7ivq1nb59cZ systemd[1]: Started Redis persistent key-value database.
Aug 23 17:31:20 iZ2zecte3psk7ivq1nb59cZ systemd[1]: Starting Redis persistent key-value database...
[root@iZ2zecte3psk7ivq1nb59cZ client]# redis-cli ping
PONG
[root@iZ2zecte3psk7ivq1nb59cZ client]# redis-benchmark -q -n 1000 -c 10 -P 5
PING_INLINE: 200000.00 requests per second
PING_BULK: 333333.34 requests per second
SET: 249999.98 requests per second
GET: 499999.97 requests per second
INCR: 333333.34 requests per second
LPUSH: 333333.34 requests per second
RPUSH: 333333.34 requests per second
LPOP: 249999.98 requests per second
RPOP: 249999.98 requests per second
SADD: 333333.34 requests per second
SPOP: 333333.34 requests per second
LPUSH (needed to benchmark LRANGE): 249999.98 requests per second
LRANGE_100 (first 100 elements): 62500.00 requests per second
LRANGE_300 (first 300 elements): 17543.86 requests per second
LRANGE_500 (first 450 elements): 9090.91 requests per second
LRANGE_600 (first 600 elements): 6097.56 requests per second
MSET (10 keys): 100000.00 requests per second
```

## References

- [https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04)
- [https://www.digitalocean.com/community/tutorials/how-to-configure-a-redis-cluster-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-configure-a-redis-cluster-on-centos-7)
