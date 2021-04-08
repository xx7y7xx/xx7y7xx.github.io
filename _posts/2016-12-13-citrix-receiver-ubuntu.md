---
layout: post
title: Install Citrix Receiver on Ubuntu
---

![](/attachments/citrix/ubuntu-citrix.jpg)

## Installation

Download from official website.

## Fix SSL error

> An SSL connection to the server could not be established because the server's certificate could not be trusted.

[http://discussions.citrix.com/topic/373839-cannot-access-server-because-of-ssl-connection/](http://discussions.citrix.com/topic/373839-cannot-access-server-because-of-ssl-connection/)

[https://help.ubuntu.com/community/CitrixICAClientHowTo](https://help.ubuntu.com/community/CitrixICAClientHowTo)

How to fix:

```
sudo ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts/
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts/
```