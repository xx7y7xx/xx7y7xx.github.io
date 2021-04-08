---
title: aliyun
---

## centos

backup

```
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup
mv /etc/yum.repos.d/epel-testing.repo /etc/yum.repos.d/epel-testing.repo.backup
```

epel(RHEL 7)

```
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
```

http://mirrors.aliyun.com/help/epel

## OSS

在Linux下使用OSSBrowser

[https://bbs.aliyun.com/simple/?t95321.html](https://bbs.aliyun.com/simple/?t95321.html)

帐号：请填写您的 Access Key ID   （即原Access ID） 

密码：请填写您的 Access Key Secret （即原Access KEY） 

在控制台能找到获取access key的地方

勾选“指定域名”：在OSS》Bucket属性》域名管理》OSS外网域名，比如`bjbus.oss-cn-beijing.aliyuncs.com`，则填写`oss-cn-beijing.aliyuncs.com`，这是该bucket所在的数据中心（Region）对应的OSS域名（Endpoint）。（[OSS开通Region和Endpoint对照表](https://help.aliyun.com/document_detail/31837.html?spm=5176.2020520105.147.4.X9ObqF)）
