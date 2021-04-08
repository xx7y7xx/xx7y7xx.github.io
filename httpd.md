---
layout: page
title: httpd
---

## auto index 自动显示文件夹内容

[http://httpd.apache.org/docs/2.2/mod/mod_autoindex.html#indexoptions](http://httpd.apache.org/docs/2.2/mod/mod_autoindex.html#indexoptions)

[https://webmasters.stackexchange.com/a/26230](https://webmasters.stackexchange.com/a/26230)

处理乱码

```
vim /etc/httpd/conf.d/autoindex.conf
```

添加：

```
IndexOptions Charset=UTF-8
```

```
service httpd reload
```