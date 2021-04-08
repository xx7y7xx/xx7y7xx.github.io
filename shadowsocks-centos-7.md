---
layout: page
title: Shadowsocks installation on CentOS 7
---

```
yum install epel-release -y
# yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel -y
cd /etc/yum.repos.d/
wget https://copr.fedoraproject.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
yum update
yum install shadowsocks-libev
```

```
# vim /etc/shadowsocks-libev.json
```


```
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"barfoo!",
    "timeout":60,
    "method":"chacha20-ietf-poly1305"
}
```

```
systemctl enable shadowsocks-libev
systemctl start shadowsocks-libev
systemctl status shadowsocks-libev
```

see server log

```
# journalctl | grep ss-server
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: UDP relay enabled
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: initializing ciphers... chacha20-ietf-poly1305
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: tcp server listening at 0.0.0.0:8388
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: udp server listening at 0.0.0.0:8388
```