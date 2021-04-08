---
layout: post
title: "CIFS VFS: cifs_mount failed w/return code = -13"
---

```
$ cat /etc/fstab
//10.10.71.101/e$ /home/chenyang/Mount/10.10.71.101_e cifs rw,username=administrator,password=123456,file_mode=0777,dir_mode=0777,uid=chenyang,gid=chenyang        0 0
```

```
$ sudo mount -a
[sudo] password for chenyang: 
mount: //10.10.71.101/e$ is write-protected, mounting read-only
mount: cannot mount //10.10.71.101/e$ read-only
```

```
$ dmesg | tail
...
[770432.980240] CIFS VFS: Send error in SessSetup = -13
[770432.980770] CIFS VFS: cifs_mount failed w/return code = -13
...
```

[http://unix.stackexchange.com/a/139917/189029](http://unix.stackexchange.com/a/139917/189029)

Append `sec=ntlm` options, problem solved.

```
//10.10.71.101/e$ /home/chenyang/Mount/10.10.71.101_e cifs rw,username=administrator,password=123456,file_mode=0777,dir_mode=0777,uid=chenyang,gid=chenyang,sec=ntlm        0 0
```