---
layout: page
title: netstat
---

## (Linux) Find Out Which Process Is Listening Upon a Port

```
netstat -tulpn
```

## macOS

```
$ netstat -ap tcp | grep -i "listen"
tcp46      0      0  *.radan-http           *.*                    LISTEN
tcp46      0      0  *.8090                 *.*                    LISTEN
tcp46      0      0  *.8089                 *.*                    LISTEN
tcp4       0      0  localhost.49373        *.*                    LISTEN
tcp4       0      0  *.redwood-broker       *.*                    LISTEN
tcp4       0      0  *.hbci                 *.*                    LISTEN
tcp4       0      0  localhost.domain       *.*                    LISTEN
tcp4       0      0  localhost.60808        *.*                    LISTEN
tcp4       0      0  localhost.54612        *.*                    LISTEN
tcp46      0      0  *.mysql                *.*                    LISTEN
tcp6       0      0  localhost.52698        *.*                    LISTEN
tcp6       0      0  localhost.postgresql   *.*                    LISTEN
tcp4       0      0  localhost.postgresql   *.*                    LISTEN
tcp6       0      0  localhost.6379         *.*                    LISTEN
tcp4       0      0  localhost.6379         *.*                    LISTEN
tcp46      0      0  *.50883                *.*                    LISTEN
tcp46      0      0  *.60644                *.*                    LISTEN
tcp4       0      0  localhost.9234         *.*                    LISTEN
tcp4       0      0  localhost.63342        *.*                    LISTEN
tcp4       0      0  localhost.6942         *.*                    LISTEN
tcp4       0      0  localhost.62722        *.*                    LISTEN
tcp4       0      0  localhost.60012        *.*                    LISTEN
tcp4       0      0  localhost.60014        *.*                    LISTEN
tcp4       0      0  localhost.60010        *.*                    LISTEN
tcp6       0      0  *.61500                *.*                    LISTEN
tcp4       0      0  *.61500                *.*                    LISTEN
tcp4       0      0  localhost.29754        *.*                    LISTEN
tcp4       0      0  localhost.29834        *.*                    LISTEN
```

```
$ sudo lsof -PiTCP -sTCP:LISTEN
COMMAND     PID           USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
_pnagentd    68           root    5u  IPv4 0x5f8e6ab20097d389      0t0  TCP localhost:29754 (LISTEN)
_iscod       77           root    3u  IPv4 0x5f8e6ab20097ca01      0t0  TCP localhost:29834 (LISTEN)
_artstora   267           root    3u  IPv4 0x5f8e6ab20097dd11      0t0  TCP *:61500 (LISTEN)
_artstora   267           root    4u  IPv6 0x5f8e6ab200fb9a29      0t0  TCP *:61500 (LISTEN)
_cumbrell   396           root   48u  IPv4 0x5f8e6ab205564d11      0t0  TCP localhost:62722 (LISTEN)
_ciseagen   418           root   40u  IPv4 0x5f8e6ab205372389      0t0  TCP localhost:60010 (LISTEN)
_ciseagen   418           root   49u  IPv4 0x5f8e6ab20538fd11      0t0  TCP localhost:60014 (LISTEN)
_ciseagen   418           root   57u  IPv4 0x5f8e6ab205478389      0t0  TCP localhost:60012 (LISTEN)
pycharm    5577 d3vin.yangchen  169u  IPv4 0x5f8e6ab20529b079      0t0  TCP localhost:6942 (LISTEN)
pycharm    5577 d3vin.yangchen  239u  IPv4 0x5f8e6ab205ee6a01      0t0  TCP localhost:63342 (LISTEN)
_isco\x20  5594 d3vin.yangchen   42u  IPv4 0x5f8e6ab2157d2a01      0t0  TCP localhost:60808 (LISTEN)
Brackets   5602 d3vin.yangchen   45u  IPv4 0x5f8e6ab205e91d11      0t0  TCP localhost:9234 (LISTEN)
dbeaver    5604 d3vin.yangchen  120u  IPv6 0x5f8e6ab200fbbca9      0t0  TCP *:60644 (LISTEN)
dbeaver    5604 d3vin.yangchen  121u  IPv6 0x5f8e6ab200fbab69      0t0  TCP *:50883 (LISTEN)
redis-ser  6343 d3vin.yangchen    6u  IPv4 0x5f8e6ab205ed3a01      0t0  TCP localhost:6379 (LISTEN)
redis-ser  6343 d3vin.yangchen    7u  IPv6 0x5f8e6ab210d3b329      0t0  TCP localhost:6379 (LISTEN)
postgres   6493 d3vin.yangchen    5u  IPv4 0x5f8e6ab205fd56f1      0t0  TCP localhost:5432 (LISTEN)
postgres   6493 d3vin.yangchen    6u  IPv6 0x5f8e6ab210d3c469      0t0  TCP localhost:5432 (LISTEN)
main      16819 d3vin.yangchen   74u  IPv6 0x5f8e6ab238ac48e9      0t0  TCP *:8088 (LISTEN)
main      16819 d3vin.yangchen   87u  IPv6 0x5f8e6ab238ac5469      0t0  TCP *:8089 (LISTEN)
main      16819 d3vin.yangchen   88u  IPv6 0x5f8e6ab238ac4ea9      0t0  TCP *:8090 (LISTEN)
TextMate  20439 d3vin.yangchen   29u  IPv6 0x5f8e6ab210d3db69      0t0  TCP localhost:52698 (LISTEN)
_nscrypt- 52585         nobody   53u  IPv4 0x5f8e6ab206bc5079      0t0  TCP localhost:53 (LISTEN)
mysqld    56050         _mysql   25u  IPv6 0x5f8e6ab22a480ca9      0t0  TCP *:3306 (LISTEN)
Code\x20H 56473 d3vin.yangchen   63u  IPv4 0x5f8e6ab2163e46f1      0t0  TCP localhost:54612 (LISTEN)
node      75259 d3vin.yangchen   26u  IPv4 0x5f8e6ab228084d11      0t0  TCP *:3000 (LISTEN)
node      75259 d3vin.yangchen   27u  IPv4 0x5f8e6ab22bab3079      0t0  TCP *:3001 (LISTEN)
Brackets- 99058 d3vin.yangchen   11u  IPv4 0x5f8e6ab2054e46f1      0t0  TCP localhost:49373 (LISTEN)
```

## See also

- [lsof](/lsof.html)