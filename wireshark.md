---
layout: page
title: wireshark
---

```
dpkg: error processing package libwireshark-data (--configure):
 package libwireshark-data is not ready for configuration
 cannot configure (current status 'half-installed')
Errors were encountered while processing:
 libwireshark-data
E: Sub-process /usr/bin/dpkg returned an error code (1)
Failed to perform requested operation on package.  Trying to recover:
```

```
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt-get update
sudo apt-get install wireshark
```

run wireshark, error

```
Couldn't run /usr/bin/dumpcap in child process: Permission denied
```

```
chenyang@chenyang-pc:~/Downloads$ ls -l /usr/bin/dumpcap 
-rwxr-xr-- 1 root wireshark 88144 Jun 13 00:53 /usr/bin/dumpcap
chenyang@chenyang-pc:~/Downloads$ /usr/bin/dumpcap 
bash: /usr/bin/dumpcap: Permission denied
```

```
sudo usermod -a -G wireshark chenyang
```

logout and login again, run wireshark

## ref

- http://askubuntu.com/a/618336
- http://unix.stackexchange.com/q/55722