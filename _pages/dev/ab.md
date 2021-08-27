---
layout: page
title: ab (apache bench)
permalink: /dev/ab.html
---

## apache bench(ab)

Install

```
apt-get install apache2-utils
```

Start

```
chenyang@chenyang:~$ ab -n 100 -c 10 http://www.wware.org/
This is ApacheBench, Version 2.3 <$Revision: 1528965 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking www.wware.org (be patient).....done


Server Software:        nginx
Server Hostname:        www.wware.org
Server Port:            80

Document Path:          /
Document Length:        33795 bytes

Concurrency Level:      10
Time taken for tests:   3.869 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      3404800 bytes
HTML transferred:       3379500 bytes
Requests per second:    25.84 [#/sec] (mean)
Time per request:       386.941 [ms] (mean)
Time per request:       38.694 [ms] (mean, across all concurrent requests)
Transfer rate:          859.30 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       59  130 220.7     79    1100
Processing:   146  220  65.4    202     504
Waiting:       82  113  22.3    109     199
Total:        205  350 227.7    279    1319

Percentage of the requests served within a certain time (ms)
  50%    279
  66%    321
  75%    346
  80%    358
  90%    433
  95%   1216
  98%   1309
  99%   1319
 100%   1319 (longest request)
```

## See also

- [siege](https://github.com/JoeDog/siege)
- [siege](/siege.html)

## References

- [https://kalamuna.atlassian.net/wiki/display/KALA/Testing+With+Apache+Benchmark+and+Siege](https://kalamuna.atlassian.net/wiki/display/KALA/Testing+With+Apache+Benchmark+and+Siege)
