---
layout: post
titile: 从百度下载的firefox会自动安装插件，而且也删除不掉
---

在百度搜索firefox，第一个是百度自己提供的安装程序，安装上之后默认有一堆插件，从插件管理器中选择删除，重启之后又被自动安装上了。

经过在安装目录下搜索插件名称关键字，找到了在如下目录下。

```
C:\Program Files\Mozilla Firefox\distribution\myextensions
```

关闭firefox

删除目录

启动firefox，检查是否还有，如果还存在插件，再次重启应该就没有了。