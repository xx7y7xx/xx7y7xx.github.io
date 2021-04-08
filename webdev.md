---
layout: page
title: Web Development
---

## 手机版浏览器调试方法

[weinre](/weinre.html)

## 低版本android上无法显示cmyk色彩空间的图片

比如[这张图](attachments/android-low-version-cant-show-cmyk/cmyk.jpg)，使用android低版本打开的时候就无法显示（显示为空白页）。

首先使用GIMP打开该图片查看的时候并没有意识到这是一张CMYK图，这是因为GIMP本身并不支持CMYK，见[这里](http://askubuntu.com/questions/243389/why-doesnt-gimp-support-cmyk)。

根据这里的一个[bug描述](https://code.google.com/p/skia/issues/detail?id=69#c16)，这是因为android上[skia](http://en.wikipedia.org/wiki/Skia_Graphics_Engine)的一个bug引发的问题。

并且给出了转换成RGB的方法：

    /usr/bin/convert cmyk.jpg -colorspace RGB rgb.jpg

转换之后就可以[正常显示](attachments/android-low-version-cant-show-cmyk/rgb.jpg)了。

## 浏览器兼容性检查

- caniuse.com
- Modernizr

## js错误收集

The List
bugsense.com
jslogger.com
qbaka.com
muscula.com
errorception.com
exceptionhub.com
bugsnag.com
exceptional.io
airbrake.io
getsentry.com

Other:
github.com/Offbeatmammal/jsErrLog - open source
github.com/occ/TraceKit - most comprehensive stacktrace library

来源：

https://plus.google.com/+PaulIrish/posts/12BVL5exFJn

drupal也有相应的module，可以安装来直接使用：https://www.drupal.org/project/jserrorlog

## testing

### xenu

测试坏链


## xxs in PHP

{% highlight php %}
<?php
header('Access-Control-Allow-Origin: http://www.xuanran001.com');
header('Content-Type: application/json');
print_r($_POST);
?>
{% endhighlight %}

## critical render path

![](http://image.slidesharecdn.com/vladzelinschi-optimizingthecriticalrenderingpath-141120132037-conversion-gate01/95/vlad-zelinschi-optimizing-the-critical-rendering-path-16-638.jpg?cb=1416512613)

[http://www.slideshare.net/codecampiasi/vlad-zelinschi-optimizing-the-critical-rendering-path](http://www.slideshare.net/codecampiasi/vlad-zelinschi-optimizing-the-critical-rendering-path)

[https://developers.google.com/web/fundamentals/performance/critical-rendering-path/analyzing-crp?hl=en](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/analyzing-crp?hl=en)

## nginx 415错误的原因

因为nginx在假定http request的类型是A，但是其实客户端发起的类型是B。

比如一个现实情况：

nginx配置接受所有post请求都作文件上传处理


    location ^~ /post/ {
      if ($request_method = POST) {
    [...]
        upload_resumable on;

        upload_set_form_field $upload_field_name.name "$upload_file_name";
        upload_set_form_field $upload_field_name.content_type "$upload_content_type";
        upload_set_form_field $upload_field_name.path "$upload_tmp_path";
        upload_aggregate_form_field $upload_field_name.size "$upload_file_size";
    [...]


那么nginx是期待http request的类型为multipart/formdata，而不是x-www-...格式。

所以如果使用js发送ajax，那么需要注意一下了，否则就是415错误。

## 测试静态网站的工具

    python -m SimpleHTTPServer

## 常用工具/网站

- http://www.layoutit.com/ 做布局，并能生成html代码。

## web frontend development tech stack

- http client
  - [axios](https://github.com/mzabriskie/axios)
  - [fetch](https://github.com/github/fetch)
  - [superagent](https://github.com/visionmedia/superagent)