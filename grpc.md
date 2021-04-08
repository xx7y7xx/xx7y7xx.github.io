---
layout: page
title: gRPC
---

## Check server connection

Use `nc` in macOS.

```
$ nc -vz 192.168.1.2 8087
found 0 associations
found 1 connections:
     1:	flags=82<CONNECTED,PREFERRED>
	outif utun1
	src 192.168.1.100 port 51249
	dst 192.168.1.2 port 50051
	rank info not available
	TCP aux info available

Connection to 192.168.1.2 port 50051 [tcp/*] succeeded!
```

Or `brew install telnet` first, then

```
$ telnet 192.168.1.2 50051
Trying 192.168.1.2...
Connected to 192.168.1.2
Escape character is '^]'.
@^]
telnet> quit
Connection closed.
```

## Benchmarking

[https://ghz.sh/](https://ghz.sh/)
