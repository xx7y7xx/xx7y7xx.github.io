---
layout: post
title: setup pm2 for 10.1.78.23
---

```
[root@uf201102372 yyssc-chat]# npm install pm2 -g
```

```
[root@uf201102372 www]# cat node-app.json 
```

```json
{
  "apps": [{
    "name": "ssc30-admin-app",
    "cwd": "/var/www/ssc_web",
    "script": "app_admin.js",
    "log_date_format": "YYYY-MM-DD HH:mm Z",
    "error_file": "./log/app_admin_err.log",
    "out_file": "./log/app_admin_out.log",
    "env": {
      "PORT": "3001"
    }
  }]
}
```