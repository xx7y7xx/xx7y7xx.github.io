---
layout: page
title: weinre
---

# weinre

(1) 安装node.js npm 以及weinre

    sudo apt-get install node.js
    sudo apt-get install npm
    sudo npm -g install weinre

(2) 启动

    /usr/bin/nodejs /usr/local/bin/weinre --boundHost 192.168.2.220

(3) 在html代码中添加

{% highlight html %}
<script src="http://192.168.2.220:8080/target/target-script-min.js#d3vin"></script>
{% endhighlight %}

(4) 在PC上打开网页，这就是远程调试界面了。

    http://192.168.2.220:8080/target/target-script-min.js#d3vin

(5) 在手机上打开html文件

(6) 在PC上刷新刚才的远程调试界面，就可以在target中看到已经连接的手机中打开的网页了。

(7) 更进一步，可以使用配置文件

    $ cat ~/.weinre/server.properties 
    boundHost:    -all-
    httpPort:     8080
    #reuseAddr:    true
    #readTimeout:  1
    #deathTimeout: 5

(n) 参考

- [Install Weinre on Ubuntu](http://pat-schmitz.de/patschwork/?p=330)
- [weinre - Home](http://people.apache.org/~pmuellr/weinre-docs/latest/)