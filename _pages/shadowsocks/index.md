---
layout: page
title: shadowsocks
permalink: /shadowsocks/index.html
---

## Common operation for server side

```
sudo ssserver -c /etc/shadowsocks.json -d start # 启动
sudo ssserver -d stop # 关闭
sudo ssserver -c /etc/shadowsocks.json -d restart # 重启
```

## Server

```
sudo apt-get install python-pip -y
pip install shadowsocks
```

```
vim /etc/shadowsocks.json
```

```
{
    "server":"0.0.0.0",
    "server_port":8388,
    "local_port":1080,
    "password": "...",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

```
# ssserver --version
Shadowsocks 2.8.2
```

启动

```
sudo ssserver -c /etc/shadowsocks.json -d start # 启动
```

查看日志

```
/var/log/shadowsocks.log
```

开机启动

```
vim /etc/rc.local
chmod +x /etc/rc.local
```

```
/usr/bin/python /usr/local/bin/ssserver -c /etc/shadowsocks.json -d start
```

### 注意

是否需要安装`python-m2crypto`？

## FAQ

服务运行 75 天之后，发现`https://ssl.gstatic.com/accounts/o/4229659068-postmessagerelay.js`这个 URL 无法访问了（忘记记录错误类型了），测试后发现是`gstatic.com`这个域名下的资源都无法访问了，所以将 shadowsocks server 服务重启了一下，然后就好了。

## Ubuntu Client

ref: https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation

PPA is for Ubuntu >= 14.04.

```
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
```

## HTTP proxy

由于 Windows 版的 shadowsocks 默认只有 socks proxy，所以需要使用[privoxy](/privoxy.html)（通过 forwarding）来支持 HTTP proxy。

## shadowrocket

- [https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8](https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8)
- [https://github.com/h2y/Shadowrocket-ADBlock-Rules](https://github.com/h2y/Shadowrocket-ADBlock-Rules)

## Issue investigation

### Check server port

- [http://tool.chinaz.com/port/](http://tool.chinaz.com/port/)
- http://port.ping.pe/

Ref: [https://www.bandwagonhost.net/1934.html](https://www.bandwagonhost.net/1934.html)

### Check server IP address

- [https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck](https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck)

## FAQ

### 服务器能 ping 通，但是浏览器访问不了 google.com

有可能是因为端口被 GFW 屏蔽了。
使用 telnet 检查是否可以连接远程端口。

```
telnet 1.2.3.4 8388
```

如果发现端口无法连接，那么换一个端口试试看。

## See also

- [privoxy](/privoxy.html)
- [Git Proxy](/git-proxy.html)
