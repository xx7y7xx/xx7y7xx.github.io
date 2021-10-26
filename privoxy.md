---
layout: page
title: Privoxy
---

## Privoxy config file

Looking for the default listen address, example `8118`.

```
listen-address  127.0.0.1:8118 # default
```

Then, append `forward-socks5` directive at the bottom of config file.

```
# Add by d3vin
forward-socks5   /               127.0.0.1:1080  .
debug   1    # log each request destination (and the crunch reason if Privoxy intercepted the request)
debug   4096 # Startup banner and warnings
debug   8192 # Non-fatal errors
```

## See also

- [shadowsocks](/shadowsocks/index.html)

## References

- [Privoxy](https://www.privoxy.org/)
