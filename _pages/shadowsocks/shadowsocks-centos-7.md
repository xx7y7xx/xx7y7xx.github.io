---
layout: page
title: Shadowsocks installation on CentOS 7
permalink: /shadowsocks/shadowsocks-centos-7.html
---

## Installation steps

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
# systemctl enable shadowsocks-libev
# systemctl start shadowsocks-libev
# systemctl status shadowsocks-libev
```

## common commands

```
# systemctl restart shadowsocks-libev     # Restart ss server
# journalctl -u shadowsocks-libev.service # Check log
```

### see server log

```
# journalctl | grep ss-server
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: UDP relay enabled
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: initializing ciphers... chacha20-ietf-poly1305
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: tcp server listening at 0.0.0.0:8388
Jun 06 11:07:41 brave-bliss-2.localdomain ss-server[3450]: 2019-06-06 11:07:41 INFO: udp server listening at 0.0.0.0:8388
```

another way

```
# journalctl -u shadowsocks-libev.service
-- Logs begin at Tue 2021-10-26 10:32:27 EDT, end at Tue 2021-10-26 10:41:24 EDT. --
Oct 26 10:33:03 brave-bliss-2.localdomain systemd[1]: Started Shadowsocks-libev Default Server Service.
Oct 26 10:33:03 brave-bliss-2.localdomain ss-server[3461]: 2021-10-26 10:33:03 INFO: UDP relay enabled
Oct 26 10:33:03 brave-bliss-2.localdomain ss-server[3461]: 2021-10-26 10:33:03 INFO: initializing ciphers... chacha20
Oct 26 10:33:03 brave-bliss-2.localdomain ss-server[3461]: 2021-10-26 10:33:03 INFO: tcp server listening at 0.0.0.0:
Oct 26 10:33:03 brave-bliss-2.localdomain ss-server[3461]: 2021-10-26 10:33:03 INFO: udp server listening at 0.0.0.0:
```
