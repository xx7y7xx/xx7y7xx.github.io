---
title: Jenkins
layout: page
---

## Installation

### Ubuntu

OpenJDK

```
sudo apt-get install default-jre
```

Or Oracle JDK

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer -y
```

Install Jenkins

```
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update && sudo apt-get install jenkins -y
```

access http://127.0.0.1:8080

### CentOS

setup epel [aliyun](aliyun)

Install Oracle OpenJDK

```
sudo yum install java-1.7.0-openjdk -y
```

Install Jenkins

```
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
```

Start or stop the Jenkins service

```
sudo service jenkins start/stop/restart
sudo chkconfig jenkins on
```

access http://172.20.4.222:8080 (or ip:8080)

![login page](/attachments/jenkins/screenshot_20170705_001.jpg)

Change connection checking URL from Google to Baidu in `/var/lib/jenkins/updates/default.json` file.

不要预装插件，因为可能因为安装失败（墙）而导致卡在那里。

ref: [https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions)

## Failed to start service in jenkins job

As sayed in [https://wiki.jenkins-ci.org/display/JENKINS/ProcessTreeKiller](https://wiki.jenkins-ci.org/display/JENKINS/ProcessTreeKiller)

Jenkins will kill all processes spawned from this job.

To disable this feature, you can add a enviroment variable for this node

    BUILD_ID=npm

Jenkins will not kill npm process when job finished.

## add slave (glue project)

## add node(slave)

第一步，配置渲染服务器基本环境。

```
sudo su

ls /usr/java/jdk1.8.0_05/

wget http://dl.wware.org/update/jdk1.8.0_05.tar.gz -O /tmp/jdk1.8.0_05.tar.gz

mkdir /usr/java

tar zxvf /tmp/jdk1.8.0_05.tar.gz -C /usr/java

mkdir -p /root/.ssh

echo "# Jenkins slave
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAr4qEMCVYAPAgp2a6JW/7kAF86z75MLnJds0vzLAuzUWQ8Mamr0hMGDC+8V6Dde/lsByjQ6+OZIYEXoiJul83PQkqKhEW0FErN9EkHraYbg/DDcLY7/tcDwcS34LO6atPIe+vmJ2uEf/DZvny2fRGbZYgzdtSXsZM75ZRj3hxtRjUsBb5Od7WUSlUsCThA+kpGh3YcHAA/is6PDS4p4ffKZtoMjlbJVcJ1ddkBJCGCANEtxo8mS2abroiz3E4Wj+aYc48rtRZtI5yAH6zkWT6mxsLI7ZDgXVpVRJ7XAf13T+aKCzdrd47s3njfl/eV2Yq1IY86IthlJhf44YOFBZqIw== jenkins@ci" >> /root/.ssh/authorized_keys

chmod 600 /root/.ssh/authorized_keys
```

第二步，将渲染服务器添加到jenkins：

直接复制之前添加的节点的配置。

如果不是复制节点，需要自定义配置，请参考

- //name// : `192.168.0.176`
- //# of executors// : `1`
- //Remote FS root// : `/root/jenkins`
- //Launch method// : `Launch slave agents on Unix machines via SSH`
 - //Host// : `192.168.0.176`
 - //Credentials// : `root (private key of jenkins@ci)`
 - //Port// : `22`
 - //JavaPath// : `/usr/java/jdk1.8.0_05/bin/java`

参照[https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu)

## check network从google换成baidu

`/var/lib/jenkins/updates/default.json`

```
{"connectionCheckUrl":"http://www.baidu.com/"
```

参照： http://stackoverflow.com/a/36788116

## 将编译结果上传到服务器上

参照[https://wiki.jenkins-ci.org/display/JENKINS/Publish+Over](https://wiki.jenkins-ci.org/display/JENKINS/Publish+Over)

以下的例子是将Jekyll编译生成的HTML文件上传到服务器上的NGINX的www目录下。

可以通过如下几种方式上传（并执行命令）：

- Publish Over CIFS Plugin - send artifacts to a windows share
- Publish Over FTP Plugin - send artifacts to an FTP server
- Publish Over SSH Plugin - send artifacts to an SSH server (using SFTP) and/or execute commands over SSH

这三个插件都是需要单独安装的。

在“Manage Jenkins > Configure System”(http://JENKINS:8080/configure) 中找到“Publish over SSH”

1. 设置SSH key
1. 添加远端的服务器IP和port等
1. 设置Remote Directory为`/var/www/ss.xx.com`

在job中设置如下：

- Transfer Set
  - Source files: `output/**/*`
  - Remove prefix: `output`
  - Remote directory: `.`
  - Exec command: （留空）

## Plugins

- Git plugin

## FAQ

安装Jenkins时候遇到错误：

```
[chenyang@iZ25xkf099kZ ~]$ sudo yum install jenkins
Loaded plugins: langpacks
Resolving Dependencies
--> Running transaction check
---> Package jenkins.noarch 0:2.15-1.1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

============================================================================================================================================================================================================
 Package                                          Arch                                            Version                                            Repository                                        Size
============================================================================================================================================================================================================
Installing:
 jenkins                                          noarch                                          2.15-1.1                                           jenkins                                           65 M

Transaction Summary
============================================================================================================================================================================================================
Install  1 Package

Total download size: 65 M
Installed size: 66 M
Is this ok [y/d/N]: y
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
jenkins-2.15-1.1.noarch.rpm    FAILED                                          
http://pkg.jenkins.io/redhat-stable/jenkins-2.15-1.1.noarch.rpm: [Errno 14] HTTP Error 404 - Not Found                                                                    ]  0.0 B/s |    0 B  --:--:-- ETA 
Trying other mirror.


Error downloading packages:
  jenkins-2.15-1.1.noarch: [Errno 256] No more mirrors to try.
```

解决办法：

```
sudo yum clean all
```

### installtion jenkins 503 error

[installtion jenkins 503 error](/2017/06/05/installation-jenkins-503-error.html)