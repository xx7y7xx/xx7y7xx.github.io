---
layout: page
title: HTTP
---

## HTTP message

- Request line, such as `GET /logo.gif HTTP/1.1` or Status line, such as `HTTP/1.1 200 OK`
- Headers
- An empty line
- Optional HTTP message body data, such as `Hello world!`

```
HTTP/1.1 200 OK
Date: Sun, 10 Oct 2010 23:26:07 GMT
Server: Apache/2.2.8 (Ubuntu) mod_ssl/2.2.8 OpenSSL/0.9.8g
Last-Modified: Sun, 26 Sep 2010 22:04:35 GMT
ETag: "45b6-834-49130cc1182c0"
Accept-Ranges: bytes
Content-Length: 13
Connection: close
Content-Type: text/html

Hello world!
```