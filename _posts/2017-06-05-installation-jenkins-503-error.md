---
layout: post
title: installation jenkins 503 error
---

Access ip:8080, show:

```
HTTP ERROR: 503

Problem accessing /. Reason:

    Service Unavailable
Powered by Jetty://
```

logs:

```
WARNING: Failed startup of context w.@59234f41{/,file:/var/cache/jenkins/war/,STARTING}{/var/cache/jenkins/war}
java.lang.reflect.InvocationTargetException
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
...
Caused by: java.lang.UnsupportedClassVersionError: jenkins/util/SystemProperties : Unsupported major.minor version 52.0
        at java.lang.ClassLoader.defineClass1(Native Method)
        at java.lang.ClassLoader.defineClass(ClassLoader.java:803)
```

jdk version

```
[root@yzb-centos-08 chenyang]# java -version
java version "1.7.0_141"
OpenJDK Runtime Environment (rhel-2.6.10.1.el7_3-x86_64 u141-b02)
OpenJDK 64-Bit Server VM (build 24.141-b02, mixed mode)
```

jdk version is too low [https://jenkins.io/doc/upgrade-guide/2.60/](https://jenkins.io/doc/upgrade-guide/2.60/)

> Jenkins 2.60.1 is the first LTS release to require Java 8.

update jdk

```
[chenyang@yzb-centos-08 ~]$ sudo yum install java-1.8.0-openjdk
```

```
[chenyang@yzb-centos-08 ~]$ java -version
openjdk version "1.8.0_131"
OpenJDK Runtime Environment (build 1.8.0_131-b12)
OpenJDK 64-Bit Server VM (build 25.131-b12, mixed mode)
```

restart jenkins

```
 sudo service jenkins restart
```