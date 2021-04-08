---
layout: post
title: "Jenkins flood HDD with DNS Errors"
---

```
[root@iZ25xkf099kZ jenkins]# ll -h /var/log/jenkins/
total 2.1G
-rw-r--r-- 1 jenkins jenkins  25K Nov  8 20:48 jenkins.log
-rw-r--r-- 1 jenkins jenkins 2.1G Oct 15 03:15 jenkins.log-20161015
-rw-r--r-- 1 jenkins jenkins 472K Oct 16 03:23 jenkins.log-20161016
```

`jenkins.log-20161015`

```
        question:      [DNSQuestion@667355315 type: TYPE_IGNORE index 0, class: CLASS_UNKNOWN index 0, name: ]
        question:      [DNSQuestion@2081174571 type: TYPE_IGNORE index 0, class: CLASS_UNKNOWN index 0, name: ]
        question:      [DNSQuestion@1737621126 type: TYPE_IGNORE index 0, class: CLASS_UNKNOWN index 0, name: ]
        question:      [DNSQuestion@568149129 type: TYPE_IGNORE index 0, class: CLASS_UNKNOWN index 0, name: ]
        question:      [DNSQuestion@1170116541 type: TYPE_IGNORE index 0, class: CLASS_UNKNOWN index 0, name: ]
```

Jenkins issue tracker: [https://issues.jenkins-ci.org/browse/JENKINS-29490](https://issues.jenkins-ci.org/browse/JENKINS-29490)

Solution is [http://stackoverflow.com/a/31750218/4685522](http://stackoverflow.com/a/31750218/4685522)

For CentOS, Jenkins default config file is

```
/etc/sysconfig/jenkins
```

```
## Type:        string
## Default: "false"
## ServiceRestart: jenkins
#
# Whether to skip potentially long-running chown at the
# $JENKINS_HOME location. Do not enable this, "true", unless
# you know what you're doing. See JENKINS-23273.
#
#JENKINS_INSTALL_SKIP_CHOWN="false"

## Type: string
## Default:     "-Djava.awt.headless=true"
## ServiceRestart: jenkins
#
# Options to pass to java when running Jenkins.
#
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true"
```

```
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Dhudson.DNSMultiCast.disabled=true "
```