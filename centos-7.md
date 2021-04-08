---
layout: page
title: Centos 7
---

## 中文字体 # {#chinese-fonts}

在服务器上安装 headless chrome 进行自动截图，发现字体没有安装，效果如下：

![](/attachments/centos/screenshot_20170904_004.jpg)

```sh
# yum info google-noto-sans-cjk-fonts
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.bit.edu.cn
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: mirror.bit.edu.cn
 * updates: mirrors.btte.net
Available Packages
Name        : google-noto-sans-cjk-fonts
Arch        : noarch
Version     : 20141117
Release     : 5.el7
Size        : 81 M
Repo        : base/7/x86_64
Summary     : Sans CJK font
URL         : https://code.google.com/p/noto
License     : ASL 2.0
Description : Noto fonts aims to remove tofu from web by providing fonts for all
            : Unicode supported scripts. Its design goal is to achieve visual harmonization
            : between multiple scripts. Noto family supports almost all scripts available
            : in Unicode.
            :
            : Noto Sans font for CJK.
```

安装之后的效果

![](/attachments/centos/screenshot_20170904_005.jpg)

## See also

- [Ubuntu 16.04 中文字体](/development/linux/ubuntu-16.04.html#chinese-fonts)
