---
layout: page
title: yum
---

## Show package version with yum info

[https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/sec-Displaying_Package_Information.html](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/sec-Displaying_Package_Information.html)

```
[root@yzb-centos-08 ~]# yum info jenkins
Loaded plugins: fastestmirror
Determining fastest mirrors
 * base: mirrors.tuna.tsinghua.edu.cn
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: mirrors.sohu.com
 * updates: mirrors.aliyun.com
Installed Packages
Name        : jenkins
Arch        : noarch
Version     : 2.60.1
Release     : 1.1
Size        : 67 M
Repo        : installed
From repo   : jenkins
Summary     : Jenkins Automation Server
URL         : http://jenkins.io/
License     : MIT/X License, GPL/CDDL, ASL2
Description : Jenkins is an open source automation server which enables developers around the world to reliably automate  their development lifecycle processes of all
            : kinds, including build, document, test, package, stage, deployment, static analysis and many more.
            : 
            : Jenkins is being widely used in areas of Continuos Integration, Continuous Delivery, DevOps, and other areas. And it is not only about software, the same
            : automation techniques can be applied in other areas like Hardware Engineering, Embedded Systems, BioTech, etc.
            : 
            : For information see https://jenkins.io
            : 
            : 
            : Authors:
            : --------
            :     Kohsuke Kawaguchi <kk@kohsuke.org>

Available Packages
Name        : jenkins
Arch        : noarch
Version     : 2.60.2
Release     : 1.1
Size        : 67 M
Repo        : jenkins
Summary     : Jenkins Automation Server
URL         : http://jenkins.io/
License     : MIT/X License, GPL/CDDL, ASL2
Description : Jenkins is an open source automation server which enables developers around the world to reliably automate  their development lifecycle processes of all
            : kinds, including build, document, test, package, stage, deployment, static analysis and many more.
            : 
            : Jenkins is being widely used in areas of Continuos Integration, Continuous Delivery, DevOps, and other areas. And it is not only about software, the same
            : automation techniques can be applied in other areas like Hardware Engineering, Embedded Systems, BioTech, etc.
            : 
            : For information see https://jenkins.io
            : 
            : 
            : Authors:
            : --------
            :     Kohsuke Kawaguchi <kk@kohsuke.org>
```