---
layout: page
title: apt
---

## How to check Debian/Ubuntu Linux package version using apt-get/aptitude command

[https://www.cyberciti.biz/faq/debian-ubuntu-linux-apt-get-aptitude-show-package-version-command/](https://www.cyberciti.biz/faq/debian-ubuntu-linux-apt-get-aptitude-show-package-version-command/)

For example, before I install zsh package I would like to know what version of zsh I would get on my system, run:

```
chenyang@chenyang-pc:~ $ apt-cache policy zsh
zsh:
  Installed: (none)
  Candidate: 5.1.1-1ubuntu2
  Version table:
     5.1.1-1ubuntu2 500
        500 http://cn.archive.ubuntu.com/ubuntu xenial/main amd64 Packages
```

```
chenyang@chenyang-pc:~ $ apt list zsh
Listing... Done
zsh/xenial 5.1.1-1ubuntu2 amd64
```