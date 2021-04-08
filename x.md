---
title: X
---

## sanpolo

2016-07-16

1.153服务器`/home`满了

```
[chenyang@glue trac_svn]$ df -h
Filesystem                 Size  Used Avail Use% Mounted on
/dev/mapper/vg-SystemRoot  1.7T  1.1T  510G  69% /
tmpfs                      7.8G     0  7.8G   0% /dev/shm
/dev/md0                   243M   65M  166M  28% /boot
/dev/sdc1                  3.6T  3.6T     0 100% /home/glue
/dev/sdf1                  1.8T  1.3T  410G  77% /mnt/data1
```

删除部分备份数据，需要使用脚本定期清除历史备份。

```
[root@glue trac_svn]# rm svn_2016-06-* -f
```


