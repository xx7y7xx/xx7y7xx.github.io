---
layout: page
title: Ubuntu 16.04
---

## 中文字体 # {#chinese-fonts}

- [https://blog.gslin.org/archives/2015/07/28/5883/ubuntu-%E5%85%A7%E5%BB%BA%E7%9A%84-noto-sans-cjk/](https://blog.gslin.org/archives/2015/07/28/5883/ubuntu-%E5%85%A7%E5%BB%BA%E7%9A%84-noto-sans-cjk/)
- [https://www.facebook.com/chihchun/posts/10153545957682915](https://www.facebook.com/chihchun/posts/10153545957682915)

默认中文字体是`fonts-noto-cjk`

```sh
$ sudo apt list fonts-noto-cjk
Listing... Done
fonts-noto-cjk/xenial-updates,xenial-updates,now 1:1.004+repack2-1~ubuntu1 all [installed,automatic]
N: There is 1 additional version. Please use the '-a' switch to see it
```

Google Chrome (v60)中如果找不到对应的中文字体，比如CSS中设定为“微软雅黑”，但是系统中没有安装该字体，则默认使用`Noto Sans CJK JP Regular`

![](/attachments/ubuntu/screenshot_20170904_003.jpg)

## See also

- [Centos 7 中文字体](/centos-7.html#chinese-fonts)