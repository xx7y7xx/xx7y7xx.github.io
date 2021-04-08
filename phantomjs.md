---
layout: page
title: PhantomJS
---

## Important note

PhantomJS is [dying](https://groups.google.com/forum/#!topic/phantomjs/9aI5d-LDuNE)

PhantomJS is lacking of so many features for mordern web browser, you may want to try [Headless Chrome](/headless-chrome.html).

## How to Install PhantomJS on Ubuntu 16.04 (for development)

[http://phantomjs.org/download.html](http://phantomjs.org/download.html)

```
tar xvjf ~/Downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C ~/opt/
```

```
ln -s ~/opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs ~/bin/
```

```
vim ~/.bashrc
```

```
PATH=$PATH:$HOME/bin
```

open a new terminal

```
$ phantomjs -v
2.1.1
```

## centos 7

```
sudo yum install fontconfig -y
```

same as ubuntu 16.04

## example projects

- [https://github.com/xxd3vin/login-take-snapshot](https://github.com/xxd3vin/login-take-snapshot)

## See also

- [Headless Chrome](/headless-chrome.html)

## References

- [https://www.vultr.com/docs/how-to-install-phantomjs-on-ubuntu-16-04](https://www.vultr.com/docs/how-to-install-phantomjs-on-ubuntu-16-04)