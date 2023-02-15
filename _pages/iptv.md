---
layout: page
title: IPTV
permalink: /iptv.html
---

## Env

* 路由器：RT-AC86U 梅林
* 北京联通 IPTV

## Config

* 内部网络(LAN)
  * IPTV
    * 启动组播路由：Yes
    * Default IGMP version：IGMP v3
    * Enable Fast Leave: YES
    * UDP 代理（Udpxy）: 23234 （这个端口跟 https://raw.githubusercontent.com/xx7y7xx/Beijing-IPTV/master/IPTV-Unicom.m3u 中的路由器端口保持一致，比如 http://192.168.50.1:23234/rtp/239.3.1.241:8000 其中 192.168.50.1 是路由器 IP，23234 是这里设置的 端口）

## Reference

* https://raw.githubusercontent.com/xx7y7xx/Beijing-IPTV/master/IPTV-Unicom.m3u
* 北京联通IPTV无线直播最简教程 - https://post.smzdm.com/p/aoxn79er/
* 最好用的北京联通、北京移动IPTV频道列表 - https://github.com/qwerttvv/Beijing-IPTV
