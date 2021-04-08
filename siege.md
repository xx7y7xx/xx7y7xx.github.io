---
layout: page
title: siege
---

```
chenyang@chenyang-pc:~ $ siege --concurrent=50 --reps=100 http://m.yzb.yyssc.org/
** SIEGE 3.0.8
** Preparing 50 concurrent users for battle.
The server is now under siege..      done.

Transactions:		        5000 hits
Availability:		      100.00 %
Elapsed time:		       85.79 secs
Data transferred:	       59.49 MB
Response time:		        0.23 secs
Transaction rate:	       58.28 trans/sec
Throughput:		        0.69 MB/sec
Concurrency:		       13.46
Successful transactions:        5000
Failed transactions:	           0
Longest transaction:	        1.39
Shortest transaction:	        0.02
 
FILE: /var/log/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.
[error] unable to create log file: /var/log/siege.log: Permission denied
```

## See also

- [ab](/ab.html)

## References

- [https://kalamuna.atlassian.net/wiki/display/KALA/Testing+With+Apache+Benchmark+and+Siege](https://kalamuna.atlassian.net/wiki/display/KALA/Testing+With+Apache+Benchmark+and+Siege)