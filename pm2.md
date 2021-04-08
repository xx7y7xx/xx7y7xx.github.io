---
layout: page
title: PM2
---

## start

```
pm2 start server.js
# OR
pm2 start app.json
```

## project config sample file

https://gist.github.com/xxd3vin/6f6d3aa253e91b25460a511a68d17e93

## upgrade node v6 to v8

restart node service

```
# pm2 restart mfc
```

see errors

```
>>>> In-memory PM2 is out-of-date, do:
>>>> $ pm2 update
```

restart pm2 daemon

```
# pm2 update
```

restart node service

> Use --update-env to update environment variables


```
# pm2 restart mfc
```

## To list all running processes

```
$ pm2 ls
┌──────┬────┬──────┬────────┬───┬──────┬───────────┐
│ Name │ id │ mode │ status │ ↺ │ cpu  │ memory    │
├──────┼────┼──────┼────────┼───┼──────┼───────────┤
│ www  │ 0  │ fork │ online │ 0 │ 0.1% │ 53.5 MB   │
└──────┴────┴──────┴────────┴───┴──────┴───────────┘
 Use `pm2 show <id|name>` to get more details about an app
 ```
 
 ## References
 
 * [https://pm2.keymetrics.io/docs/usage/process-management/](https://pm2.keymetrics.io/docs/usage/process-management/)