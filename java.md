---
layout: page
title: java
---

## Install Oracle Java on Ubuntu 16.04

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
sudo apt-get install oracle-java8-installer
```

Note: the last one will set as default

Find the path of Java installation

```sh
$ sudo update-alternatives --config java
There is 1 choice for the alternative java (providing /usr/bin/java).

  Selection    Path                                     Priority   Status
------------------------------------------------------------
  0            /usr/lib/jvm/java-7-oracle/jre/bin/java   1         auto mode
* 1            /usr/lib/jvm/java-7-oracle/jre/bin/java   1         manual mode

Press <enter> to keep the current choice[*], or type selection number: 
```

set java env variables (e.g. `JAVA_HOME`)

```
/etc/environment

JAVA_HOME=/usr/lib/jvm/java-7-oracle
```

ref: [http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html](http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html)

## Uploading Multiple Files Example with Spring Boot

[https://github.com/hellokoding/uploadingfiles-springboot](https://github.com/hellokoding/uploadingfiles-springboot)

## See also

- [JDK](/jdk.html)