---
layout: post
title: "payload是什么意思"
---

参照[Payload (computing)](https://en.wikipedia.org/wiki/Payload_(computing))

可以类比HTTP请求，比如使用cURL发送一个POST请求，命令如下

```
$ curl -F 'foo=bar' https://baidu.com -v
* Rebuilt URL to: https://baidu.com/
* timeout on name lookup is not supported
*   Trying 111.13.100.91...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to baidu.com (111.13.100.91) port 443 (#0)
* ALPN, offering http/1.1
* Cipher selection: ALL:!EXPORT:!EXPORT40:!EXPORT56:!aNULL:!LOW:!RC4:@STRENGTH
* successfully set certificate verify locations:
*   CAfile: C:/Program Files/Git/mingw64/ssl/certs/ca-bundle.crt
  CApath: none
* TLSv1.2 (OUT), TLS header, Certificate Status (22):
} [5 bytes data]
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
} [512 bytes data]
* TLSv1.2 (IN), TLS handshake, Server hello (2):
{ [109 bytes data]
* TLSv1.2 (IN), TLS handshake, Certificate (11):
{ [4468 bytes data]
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
{ [333 bytes data]
* TLSv1.2 (IN), TLS handshake, Server finished (14):
{ [4 bytes data]
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
} [70 bytes data]
* TLSv1.2 (OUT), TLS change cipher, Client hello (1):
} [1 bytes data]
* TLSv1.2 (OUT), TLS handshake, Finished (20):
} [16 bytes data]
* TLSv1.2 (IN), TLS change cipher, Client hello (1):
{ [1 bytes data]
* TLSv1.2 (IN), TLS handshake, Finished (20):
{ [16 bytes data]
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*        subject: C=CN; ST=Beijing; L=Beijing; O=BeiJing Baidu Netcom Science Technology Co., Ltd; OU=service operation department; CN=baidu.com
*        start date: 2015-12-29 00:00:00 GMT
*        expire date: 2016-12-29 23:59:59 GMT
*        subjectAltName: baidu.com matched
*        issuer: C=US; O=VeriSign, Inc.; OU=VeriSign Trust Network; OU=Terms of use at https://www.verisign.com/rpa (c)10; CN=VeriSign Class 3 Secure Server CA - G3
*        SSL certificate verify ok.
} [5 bytes data]
> POST / HTTP/1.1
> Host: baidu.com
> User-Agent: curl/7.44.0
> Accept: */*
> Content-Length: 141
> Expect: 100-continue
> Content-Type: multipart/form-data; boundary=------------------------354c0925f04feb8f
>
{ [5 bytes data]
< HTTP/1.1 100 Continue
} [5 bytes data]
< HTTP/1.1 302 Moved Temporarily
< Server: bfe/1.0.8.18
< Date: Fri, 28 Oct 2016 10:51:31 GMT
< Content-Type: text/html
< Content-Length: 161
< Connection: keep-alive
< Location: https://www.baidu.com/forbiddenip/forbidden.html
< Expires: Sat, 29 Oct 2016 10:51:31 GMT
< Cache-Control: max-age=86400
< Cache-Control: private
* HTTP error before end of send, stop sending
<
{ [161 bytes data]
100   302  100   161  100   141    490    429 --:--:-- --:--:-- --:--:--   490<html>
<head><title>302 Found</title></head>
<body bgcolor="white">
<center><h1>302 Found</h1></center>
<hr><center>bfe/1.0.8.18</center>
</body>
</html>

* Closing connection 0
} [5 bytes data]
* TLSv1.2 (OUT), TLS alert, Client hello (1):
} [2 bytes data]
```

在一次HTTP请求过程中，为了满足HTTP等协议，会在真正的数据通讯中添加很多和应用层无关的数据。
比如比较高层的，会添加HTTP Header，简单列举一下上面请求中使用到的部分Header：

```
> Host: baidu.com
> User-Agent: curl/7.44.0
> Accept: */*
> Content-Length: 141
> Expect: 100-continue
```

而真正属于用户想传输的数据，也就是应用层关心的数据，只在如下部分

```
> Content-Type: multipart/form-data; boundary=------------------------354c0925f04feb8f
>
{ [5 bytes data]
```

也就是`foo=bar`这个参数。

所有对于这次通讯（HTTP请求是广义上的通讯）来说，有效负载（通讯里面的概念，也是payload直译）只是`foo=bar`。

## 扩展

多说一句为啥是5个字节。

可以使用Postman等工具来发送POST请求，可以将请求以HTTP形式呈现如下：

```
POST  HTTP/1.1
Host: baidu.com
Cache-Control: no-cache
Postman-Token: 05d0939e-3dba-fe40-d012-7cd7bd0e3f72
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW

------WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="foo"

bar
------WebKitFormBoundary7MA4YWxkTrZu0gW--
```

5个字节指的是

```
bar

```

注意`bar`后面是换行符（EOL），按照[HTTP协议](https://www.w3.org/Protocols/rfc2616/rfc2616-sec2.html#sec2.2)，也就是CR LF，刚好2个字节。

如果显示出来换行符：

```
bar\r\n
```

如果换成16进制

```
62 61 72 0D 0A
```

## See also

- [Redux](/redux.html) 在Redux中使用到了payload的概念