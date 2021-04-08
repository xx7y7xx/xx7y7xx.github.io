---
layout: page
title: Linux NAT
---

- eth0 - 外网
- eth1 - 内网

1. 启用ip forward

```
# echo 1 > /proc/sys/net/ipv4/ip_forward
```

2. 

```
# /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# /sbin/iptables -A FORWARD -i eth0 -o eth1 -m state
   --state RELATED,ESTABLISHED -j ACCEPT
# /sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
```

要想让ip forward永久生效，请设定sysctrl
```
/etc/sysctl.conf
net.ipv4.ip_forward = 1
```


## 参考

- http://www.revsys.com/writings/quicktips/nat.html
