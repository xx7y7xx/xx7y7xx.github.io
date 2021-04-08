---
layout: page
title: NGINX
---

## Install and setup NGINX on CentOS 7

```
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum install nginx
systemctl status nginx
systemctl restart nginx
systemctl status nginx
systemctl enable nginx
```

default main config

```
/etc/nginx/nginx.conf
```

create www dir

```
[chenyang@iZ25xkf099kZ ~]$ sudo mkdir -p /var/www/xx.yy.com
```

Grant Permissions

```
[chenyang@iZ25xkf099kZ ~]$ sudo chown nginx:nginx /var/www/ -R
sudo chmod -R 755 /var/www
```

Create New Server Block Files

```
sudo mkdir /etc/nginx/sites-available
sudo mkdir /etc/nginx/sites-enabled
```

```
sudo vim /etc/nginx/nginx.conf
```

Add these lines to the end of the http {} block:

```
include /etc/nginx/sites-enabled/*.conf;
server_names_hash_bucket_size 64;
```

Enable the New Server Block Files

```
sudo ln -s /etc/nginx/sites-available/xx.yy.com.conf /etc/nginx/sites-enabled/xx.yy.com.conf
```

restart nginx

```
sudo systemctl restart nginx
```

## Install and setup NGINX on Ubuntu 16.04 x86_64

```
sudo apt-get update
sudo apt-get install nginx
systemctl status nginx
```

## CORS

```
#
# Wide-open CORS config for nginx
#
location / {
     if ($request_method = 'OPTIONS') {
        add_header 'Access-Control-Allow-Origin' '*';
        #
        # Om nom nom cookies
        #
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        #
        # Custom headers and headers various browsers *should* be OK with but aren't
        #
        add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
        #
        # Tell client that this pre-flight info is valid for 20 days
        #
        add_header 'Access-Control-Max-Age' 1728000;
        add_header 'Content-Type' 'text/plain charset=UTF-8';
        add_header 'Content-Length' 0;
        return 204;
     }
     if ($request_method = 'POST') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
     }
     if ($request_method = 'GET') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
     }
}
```

## gzip compress

```
gzip  on;
gzip_types text/plain text/html text/css application/json application/javascript application/x-javascript text/javascript text/xml application/xml application/rss+xml application/atom+xml application/rdf+xml;
```

[http://stackoverflow.com/questions/5131916/how-to-deflate-js-file-in-nginx#5132440](http://stackoverflow.com/questions/5131916/how-to-deflate-js-file-in-nginx#5132440)

[http://nginx.org/en/docs/http/ngx_http_gzip_module.html#gzip_types](http://nginx.org/en/docs/http/ngx_http_gzip_module.html#gzip_types)

## websocket(socket.io) proxy

[https://gist.github.com/xxd3vin/ca57fbc0ff7ba07ee45b72e50b47d372](https://gist.github.com/xxd3vin/ca57fbc0ff7ba07ee45b72e50b47d372)

## ref

- [https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-on-centos-7)
- [https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04)