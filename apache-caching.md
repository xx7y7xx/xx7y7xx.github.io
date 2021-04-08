---
layout: page
title: Apache caching
---

`sites-available/share.yyssc.org.conf`

```
<VirtualHost *:80>
#...
    # Client caching with mod_expires
    <IfModule mod_expires.c>
        ExpiresActive On
        ExpiresByType image/gif A3600
    </IfModule>
#...
</VirtualHost>
```

- [http://httpd.apache.org/docs/2.0/mod/mod_expires.html](http://httpd.apache.org/docs/2.0/mod/mod_expires.html)
- [https://stackoverflow.com/a/7699524](https://stackoverflow.com/a/7699524)
- [https://github.com/ficloud/172.20.4.222/blob/master/etc/httpd/sites-available/share.yyssc.org.conf](https://github.com/ficloud/172.20.4.222/blob/master/etc/httpd/sites-available/share.yyssc.org.conf)