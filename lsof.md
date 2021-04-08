---
layout: page
title: lsof
---

## Who is listening on a given TCP port on Mac OS X?

[https://stackoverflow.com/a/4421674](https://stackoverflow.com/a/4421674)

```
$ lsof -n -i:8080 | grep LISTEN
COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
node      76833 chenyang   14u  IPv6 0xf3d1d8183cd4f0c3      0t0  TCP *:http-alt (LISTEN)
```

```
$ ps -p 76833
  PID TTY           TIME CMD
76833 ttys008    0:36.40 node build/dev-server.js
```

## See also

- [netstat](/netstat.html)