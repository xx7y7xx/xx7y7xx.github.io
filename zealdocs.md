---
layout: page
title: zealdocs
---

## Installation on Ubuntu 16.04

```
$ sudo add-apt-repository ppa:zeal-developers/ppa
$ sudo apt-get update
$ sudo apt-get install zeal
```

```
chenyang@chenyang-pc:~/source/ssc-grid (master)$ zeal 
QxtGlobalShortcut failed to register: Meta+Z
```

```
chenyang@chenyang-pc:~/source/ssc-grid (master)$ sudo apt-get remove appmenu-qt5
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  appmenu-qt5
0 upgraded, 0 newly installed, 1 to remove and 21 not upgraded.
After this operation, 383 kB disk space will be freed.
Do you want to continue? [Y/n] 
(Reading database ... 328329 files and directories currently installed.)
Removing appmenu-qt5 (0.3.0+16.04.20170216-0ubuntu1) ...
```