---
layout: post
title: Make RAM disk on Ubuntu
---

```
sudo mkdir -p /media/source
sudo mount -t tmpfs -o size=2048M tmpfs /media/source/
```

```
df -h /media/source/
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           2.0G     0  2.0G   0% /media/source
```

## How fast

`/dev/sdb1` is a SSD

```
$ sudo hdparm -Tt /dev/sdb1 

/dev/sdb1:
 Timing cached reads:   12562 MB in  2.00 seconds = 6283.40 MB/sec
 Timing buffered disk reads: 712 MB in  3.00 seconds = 237.18 MB/sec
```

```
$ sudo hdparm -Tt /dev/ram0

/dev/ram0:
 Timing cached reads:   16236 MB in  2.00 seconds = 8123.15 MB/sec
 Timing buffered disk reads:  64 MB in  0.02 seconds = 3537.67 MB/sec
```

## Dynamically increase its size

```
/bin/mount -t tmpfs -o size=4G,remount tmpfs /tmp
```

## References

- [http://askubuntu.com/a/152871](http://askubuntu.com/a/152871)
- [https://www.e2enetworks.com/linux-in-memory-filesystems-tmpfs-vs-ramdisk/](https://www.e2enetworks.com/linux-in-memory-filesystems-tmpfs-vs-ramdisk/)