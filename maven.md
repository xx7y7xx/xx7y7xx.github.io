---
layout: page
title: Maven
---

## Install maven

Download it from https://maven.apache.org/download.cgi

unzip to `~/opt`

Add two lines to `/etc/environment`

```
export M2_HOME=/home/chenyang/opt/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin
```

Check installation, `source` it or reboot the box.

```
$ source /etc/environment 
$ mvn -version
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-11T00:41:47+08:00)
Maven home: /home/chenyang/opt/apache-maven-3.3.9
Java version: 1.7.0_80, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-7-oracle/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "4.4.0-34-generic", arch: "amd64", family: "unix"
```