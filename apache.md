---
layout: page
title: apache
---

## operations

```
sudo apachectl restart
```

### centos 7

```
sudo systemctl reload httpd.service
```

## Apache Virtual Hosts

### init virtual hosts config

```
sudo mkdir /etc/httpd/sites-available
sudo mkdir /etc/httpd/sites-enabled
sudo mkdir /var/www/ssc-grid.yyssc.org/public_html -p
```

```
sudo vim /etc/httpd/conf/httpd.conf
```

Add this line to the end of the file:

```
IncludeOptional sites-enabled/*.conf
```

add default vhost

```
sudo vim /etc/httpd/sites-available/yyssc.org.conf
```

```
<VirtualHost *:80>

    ServerName yyssc.org
    ServerAlias www.yyssc.org
    DocumentRoot /var/www/yyssc.org/public_html
    ErrorLog /var/www/yyssc.org/error.log
    CustomLog /var/www/yyssc.org/requests.log combined
    Options +Indexes
</VirtualHost>
```

```
sudo ln -s /etc/httpd/sites-available/yyssc.org.conf /etc/httpd/sites-enabled/yyssc.org.conf
```

```
sudo apachectl restart
```

### Append vhost for static HTML page

```
sudo vim /etc/httpd/sites-available/ssc-grid.yyssc.org.conf
```

```
<VirtualHost *:80>

    ServerName ssc-grid.yyssc.org
    DocumentRoot /var/www/ssc-grid.yyssc.org/public_html
    ErrorLog /var/www/ssc-grid.yyssc.org/error.log
    CustomLog /var/www/ssc-grid.yyssc.org/requests.log combined
    Options +Indexes
</VirtualHost>
```

```
sudo ln -s /etc/httpd/sites-available/ssc-grid.yyssc.org.conf /etc/httpd/sites-enabled/ssc-grid.yyssc.org.conf
```

```
sudo apachectl restart
sudo systemctl reload httpd.service # centos 7
```

### Append vhost for node.js backend

```
sudo vim /etc/httpd/sites-available/api.yyssc.org.conf
```

```
<VirtualHost *:80>
    ServerName api.yyssc.org
    # Enable reverse proxy for node.js backend server
    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:3009/
    ProxyPassReverse / http://127.0.0.1:3009/
</VirtualHost>
```

```
sudo ln -s /etc/httpd/sites-available/api.yyssc.org.conf /etc/httpd/sites-enabled/api.yyssc.org.conf
```

```
sudo apachectl restart
sudo systemctl reload httpd.service # centos 7
```

### create new vhost for node.js backend with websocket(socket.io) enabled

```
sudo vim /etc/httpd/sites-available/m.yzb.yyssc.org.conf
```

```
<VirtualHost *:80>
    ServerName m.yzb.yyssc.org

    # Enable reverse proxy for node.js and socket.io backend server
    RewriteEngine On
    RewriteCond %{HTTP:Upgrade} =websocket [NC]
    RewriteRule /(.*)           ws://localhost:3000/$1 [P,L]
    RewriteCond %{HTTP:Upgrade} !=websocket [NC]
    RewriteRule /(.*)           http://localhost:3000/$1 [P,L]

    ProxyPassReverse / http://localhost:3000/
</VirtualHost>
```

```
sudo ln -s /etc/httpd/sites-available/m.yzb.yyssc.org.conf /etc/httpd/sites-enabled/m.yzb.yyssc.org.conf
```

```
sudo apachectl restart
sudo systemctl reload httpd.service # centos 7
```

see this anwser on stackoverflow [https://stackoverflow.com/a/35141086](https://stackoverflow.com/a/35141086)

### Append vhost for jenkins backend

```
sudo vim /etc/httpd/sites-available/ci.yyssc.org.conf
```

```
<VirtualHost *:80>
    ServerName ci.yyssc.org
    # Enable reverse proxy for node.js backend server
    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/
</VirtualHost>
```

```
sudo ln -s /etc/httpd/sites-available/api.yyssc.org.conf /etc/httpd/sites-enabled/api.yyssc.org.conf
```

```
sudo apachectl restart
sudo systemctl reload httpd.service # centos 7
```

## auto index 目录浏览功能

`mod_autoindex`

### auto index使用utf8显示中文

```
vim /etc/httpd/conf.d/autoindex.conf
```

```
IndexOptions FancyIndexing HTMLTable VersionSort Charset=UTF-8
```

[IndexOptions.Charset](https://httpd.apache.org/docs/2.4/mod/mod_autoindex.html#indexoptions.charset)

### Showing long file names in Apache directory listings ( 显示长文件名 )

```
vim /etc/httpd/conf.d/autoindex.conf
```

```
IndexOptions FancyIndexing HTMLTable VersionSort NameWidth=*
```

[IndexOptions.NameWidth](https://httpd.apache.org/docs/2.4/mod/mod_autoindex.html#indexoptions.namewidth)

## enable gzip compress

To enable, use Apache Module `mod_deflate`

```
Description:	Compress content before it is delivered to the client
Status:	Extension
Module Identifier:	deflate_module
Source File:	mod_deflate.c
```

check whether `mod_deflate` is enabled

```
[root@yzb-centos-08 chenyang]# httpd -M|grep deflate_module
 deflate_module (shared)
```

```
[root@yzb-centos-08 httpd]# grep "deflate_module" * -R
conf.modules.d/00-base.conf:LoadModule deflate_module modules/mod_deflate.so
```

create new config file

```
vim /etc/httpd/conf.d/gzip.conf
```

```
<IfModule mod_deflate.c>
  SetOutputFilter DEFLATE
  # Compress HTML, CSS, JavaScript, Text, XML and fonts
  AddOutputFilterByType DEFLATE application/javascript
  AddOutputFilterByType DEFLATE application/rss+xml
  AddOutputFilterByType DEFLATE application/vnd.ms-fontobject
  AddOutputFilterByType DEFLATE application/x-font
  AddOutputFilterByType DEFLATE application/x-font-opentype
  AddOutputFilterByType DEFLATE application/x-font-otf
  AddOutputFilterByType DEFLATE application/x-font-truetype
  AddOutputFilterByType DEFLATE application/x-font-ttf
  AddOutputFilterByType DEFLATE application/x-javascript
  AddOutputFilterByType DEFLATE application/xhtml+xml
  AddOutputFilterByType DEFLATE application/xml
  AddOutputFilterByType DEFLATE font/opentype
  AddOutputFilterByType DEFLATE font/otf
  AddOutputFilterByType DEFLATE font/ttf
  AddOutputFilterByType DEFLATE image/svg+xml
  AddOutputFilterByType DEFLATE image/x-icon
  AddOutputFilterByType DEFLATE text/css
  AddOutputFilterByType DEFLATE text/html
  AddOutputFilterByType DEFLATE text/javascript
  AddOutputFilterByType DEFLATE text/plain
  AddOutputFilterByType DEFLATE text/xml

  # Remove browser bugs (only needed for really old browsers)
  BrowserMatch ^Mozilla/4 gzip-only-text/html
  BrowserMatch ^Mozilla/4\.0[678] no-gzip
  BrowserMatch \bMSIE !no-gzip !gzip-only-text/html
  Header append Vary User-Agent
</IfModule>
```

[http://httpd.apache.org/docs/current/mod/mod_deflate.html](http://httpd.apache.org/docs/current/mod/mod_deflate.html)

## How To Use Apache as a Reverse Proxy with mod_proxy on CentOS 7

The command output will list all enabled Apache modules. The four lines you're looking for are the aforementioned module names:

```
[root@yzb-centos-08 httpd]# httpd -M|grep proxy_module
 proxy_module (shared)
[root@yzb-centos-08 httpd]# httpd -M|grep lbmethod_byrequests_module
 lbmethod_byrequests_module (shared)
[root@yzb-centos-08 httpd]# httpd -M|grep proxy_balancer_module
 proxy_balancer_module (shared)
[root@yzb-centos-08 httpd]# httpd -M|grep proxy_http_module
 proxy_http_module (shared)
```

```
<VirtualHost *:80>

    # ...

    # Enable reverse proxy for Java backend server
    ProxyPreserveHost On
    ProxyPass /ficloud http://172.20.4.220:8080/ficloud
    ProxyPassReverse /ficloud http://172.20.4.220:8080/ficloud
</VirtualHost>
```

[https://www.digitalocean.com/community/tutorials/how-to-use-apache-as-a-reverse-proxy-with-mod_proxy-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-use-apache-as-a-reverse-proxy-with-mod_proxy-on-centos-7)

## FAQ

### Underscore in virtualhost servername or serveralias cause 400 error

[https://bugzilla.redhat.com/show_bug.cgi?id=1410130](https://bugzilla.redhat.com/show_bug.cgi?id=1410130)

rename `fc_storybook.yyssc.org` to `fc-storybook.yyssc.org`

## See also

- [Apache Caching](/apache-caching.html)

## References

- [https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7)