---
layout: page
title: Headless Chrome
---

## headless chrome {#headless}

[https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md)

[https://developers.google.com/web/updates/2017/04/headless-chrome](https://developers.google.com/web/updates/2017/04/headless-chrome)

### install headless chrome on centos 7

```
/etc/yum.repos.d/google-chrome.repo
```

```
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```

```sh
yum info google-chrome-stable
yum install google-chrome-stable
```

```
[root@server222 yum.repos.d]# google-chrome --headless --hide-scrollbars --remote-debugging-port=9222 --disable-gpu
Trace/breakpoint trap
[root@server222 yum.repos.d]# [0100/000000.302671:ERROR:broker_posix.cc(41)] Invalid node channel message
```

[https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c15](https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c15)

```
yum install mesa-libOSMesa-devel gnu-free-sans-fonts
```

### run headless chrome

```
$ google-chrome \
  --headless \
  --disable-gpu \
  --remote-debugging-port=9222 \
  https://www.chromestatus.com
```

### travis-ci

[https://github.com/travis-ci/travis-ci/issues/7650#issuecomment-306909354](https://github.com/travis-ci/travis-ci/issues/7650#issuecomment-306909354)

### allow remote host to access 9222 (default port)

on the machine which is running headless chrome, run command bellow

```
ifconfig # get headless machine's IP, example 1.2.3.4
ssh -L 0.0.0.0:9223:localhost:9222 localhost -N # input password for user on headless machine
```

on remote host access http://1.2.3.4:9223

## FAQ

```
$ google-chrome --headless --hide-scrollbars --remote-debugging-port=9222 --disable-gpu

[0831/162756.001979:ERROR:gl_implementation.cc(246)] Failed to load /opt/google/chrome/libosmesa.so: /opt/google/chrome/libosmesa.so: cannot open shared object file: No such file or directory
[0831/162756.002793:ERROR:gpu_child_thread.cc(264)] Exiting GPU process due to errors during initialization
[0831/162756.032619:ERROR:gl_implementation.cc(246)] Failed to load /opt/google/chrome/libosmesa.so: /opt/google/chrome/libosmesa.so: cannot open shared object file: No such file or directory
[0831/162756.033427:ERROR:gpu_child_thread.cc(264)] Exiting GPU process due to errors during initialization
```

- [https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c18](https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c18)
- [https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c15](https://bugs.chromium.org/p/chromium/issues/detail?id=695212#c15)

for ubuntu 16.04

```
sudo apt install libosmesa6-dev
sudo ln -s /usr/lib/x86_64-linux-gnu/libOSMesa.so /opt/google/chrome/libosmesa.so
```
for centos 7 (not tested)

```
sudo yum install mesa-libOSMesa-devel
ln -s /usr/lib64/libOSMesa.so.8 /opt/google/chrome/libosmesa.so
```

[https://medium.com/@dschnr/using-headless-chrome-as-an-automated-screenshot-tool-4b07dffba79a](https://medium.com/@dschnr/using-headless-chrome-as-an-automated-screenshot-tool-4b07dffba79a)

## See also

- [puppeteer](/puppeteer.html)

## References

- chrome-remote-interface examples [xxd3vin/chrome-remote-interface-examples](https://github.com/xxd3vin/chrome-remote-interface-examples)