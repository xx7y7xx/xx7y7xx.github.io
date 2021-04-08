---
layout: page
title: Linux
---

## 目录

- [如何使用svn](svn)

## tools

### command line

- disk
  - [ncdu](https://dev.yorhel.nl/ncdu/scr)

### gui

- ...

## xclip over ssh

### remote

    yum install xclip xauth

### client

    ssh -X 192.168.2.21

save to clipboard:

    echo "101" | xclip -i

get from clipboard:

any GUI apps, use mouse wheel click.

## wget通过https下载文件报错

错误现象

    [chenyang@glue ~]$ wget  'https://raw.githubusercontent.com/sp-chenyang/xxutils/master/newticket.py?12440' -O /tmp/xxdebug2.py
    --2014-11-28 11:34:55--  https://raw.githubusercontent.com/sp-chenyang/xxutils/master/newticket.py?12440
    Resolving raw.githubusercontent.com... 103.245.222.133
    Connecting to raw.githubusercontent.com|103.245.222.133|:443... connected.
    ERROR: certificate common name “www.github.com” doesn’t match requested host name “raw.githubusercontent.com”.
    To connect to raw.githubusercontent.com insecurely, use ‘--no-check-certificate’.

但是通过curl下载就没有问题，google了一下，可能是不同的发行版，不同的wget的有差异，也有可能是ssl的依赖差异，暂时不查了 ，通过curl来下载吧。

[https://github.com/Hexxeh/rpi-update/issues/65](https://github.com/Hexxeh/rpi-update/issues/65)

## kickstart

```%include``` not work

See this http://docs.oracle.com/cd/E37670_01/E41137/html/ch03s01.html#idm47635948085408

```xxx.ks``` file are not on host local file system. So you should point with a URL.

    %include http://192.168.1.3/kickstart/create_user.ks

## gnuplot

Plotting GPU(NVidia) temperature with gnuplot

Logging gpu temp with crond/perl

    $ cat /etc/cron.d/gpu 
    # check gpu temp
    * * * * * root /opt/gpu.pl
    * * * * * root /opt/gpu.sh

    $ cat /opt/gpu.pl

{% highlight perl %}
#!/usr/bin/perl
use strict;

[...]

my @nvidia_smi = `/usr/bin/nvidia-smi -q -d TEMPERATURE`;
my $max=0;

foreach my $line (@nvidia_smi)
{
  if( $line =~ /^\s+GPU\ Current\ Temp\s+:\s*(\d+)\s*C$/ )
  {
    if( $max < $1)
    {
       $max = 0 + $1;
    }
  }
}

# time format: May-08-21:08:07
my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my @time = localtime(time);
my $sec = $time[0];
my $min = $time[1];
my $hour = $time[2];
my $mday = $time[3];
my $mon = $time[4];
my $log_file = "/var/log/gpu.log";
open(my $fd, ">>", $log_file);
print $fd "$months[$mon]-$mday-$hour:$min:$sec $max\n";

exit(0);
{% endhighlight %}

gnu plot script file. (orignal file copy from https://securfox.wordpress.com/2009/09/02/plotting-cpu-temperature-with-gnuplot/ )

    $ cat /opt/gpu.gp 
    set terminal png size 1024,768
    set xdata time
    # eg. May-08-21:02:03
    set timefmt "%b-%d-%H:%M:%S"
    set output "/var/log/gpu.png"
    # time range must be in same format as data file
    set xrange ["May-08-21:35:00":"May-08-21:45:00"]
    set yrange [0:100]
    set grid
    set xlabel "Date-Time"
    set ylabel "°C"
    set title "CPU temperature"
    set key left box
    plot "/var/log/gpu.log" using 1:2 index 0 title "aldebaran" with lines

## Create a local mirror repo of Centos

    rsync -avzH --delete --exclude "i386" --exclude "*DVD*" --exclude "*CD*"  --exclude "*.iso"  rsync://mirrors.yun-idc.com/centos/7.1.1503/ /home/www/html/centos/7.1.1503

## Jenkins

Jenkins Multi configuration job: Skip build step if slave is offline

Using [Elastic axis](https://wiki.jenkins-ci.org/display/JENKINS/Elastic+Axis) plugin, and set ```Skip building on offline nodes```

## awk

- [multiple-line.awk](/demo/awk/multiple-line.awk)
- [multiple-line.txt](/demo/awk/multiple-line.txt)

## redhat 6.4

```
vim /etc/sysconfig/iptables
```

then restore from config file

```
/sbin/iptables-restore /etc/sysconfig/iptables
```

## ncdu - disk usage analyzer with an ncurses interface

```
sudo apt-get install ncdu
sudo yum install ncdu
```

## Defining a variable with or without export

```
 ~  foo="foo"
 ~  export bar="bar"
 ~  echo $foo
foo
 ~  echo $bar
bar
 ~  bash
chenyang@chenyang-pc:~ $ echo $foo

chenyang@chenyang-pc:~ $ echo $bar
bar
```

## unzip解压缩乱码

```
unzip -O cp936 中文.zip
```

## md5sum

```
 ~  echo -n "STRING" | md5sum
63b588d5559f64f89a416e656880b949  -
 ~  echo -n "STRING" | md5sum | cut -f1 -d' '
63b588d5559f64f89a416e656880b949
```

[https://www.linuxquestions.org/questions/linux-general-1/create-md5-hash-from-string-128322/#post4274458](https://www.linuxquestions.org/questions/linux-general-1/create-md5-hash-from-string-128322/#post4274458)