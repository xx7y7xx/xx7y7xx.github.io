---
layout: page
title: DHCP Server
---

## CentOS

server config

/etc/dhcp/dhcpd.conf

    subnet 192.168.2.0 netmask 255.255.255.0 {
            option routers          192.168.2.1;
            option subnet-mask      255.255.255.0;
            option domain-name-servers 192.168.1.3,202.106.0.20;
            next-server     192.168.1.3;
            filename        "pxelinux.0";
            range dynamic-bootp 192.168.2.30 192.168.2.170;
            option time-offset      -18000; # Eastern Standard Time
            option time-servers 192.168.1.3;
            default-lease-time 86400;
            max-lease-time 86400;
    
    }
