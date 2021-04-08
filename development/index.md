---
layout: page
title: Development
---

## hudson发送邮件不支持STARTTLS

1. hudson发送邮件不支持STARTTLS，默认配置是这样的
2. 查看 [http://serverfault.com/a/144802](http://serverfault.com/a/144802)
3. 修改一下配置文件/etc/default/hudson (ubuntu)
4. java arg 添加```-Dmail.smtp.starttls.enable="true"```
5. 经过测试，发现还是不行。

## windows开发环境配置

将samba映射到本地，以管理员身份打开cmd

    mklink /d d:\workspace \\192.168.2.21\share\Personal\chenyang\workspace

## windows下记录时间戳

{% highlight bat %}
@echo off
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
echo [%ldt%] Log time. >> D:\time.log
{% endhighlight %}

## 概念

QA和QC的区别。

http://www.ithome.com.tw/voice/85554

## git常用操作

1. repo改名

    git remote set-url origin git@github.com:xxd3vin/performance.git
    git remote set-url origin git@github.com:jiandan001/cipm.git
