---
layout: page
title: MediaWiki Howtos
---

## mediawiki extension custom parser function

wiki文本

{% raw %}
```
{{#jiandanurl: tesejiaoyuzhanlanguan }}
```
{% endraw %}

输出

{% highlight html %}
<html><a href="file://192.168.2.21/share/jiandan001/prj/rdfz/tesejiaoyuzhanlanguan">tesejiaoyuzhanlanguan</a></html>
{% endhighlight %}


### 如何让output是inline的

[让output是inline][]

{% highlight php %}
<?php
//return $output;
//return array( $output, 'noparse' => true, 'isHTML' => true );
return $parser->insertStripItem( $output, $parser->mStripState );
{% endhighlight %}

### 最后完成的代码

[https://github.com/xxd3vin/mediawiki-ext/tree/master/jiandanurl](https://github.com/xxd3vin/mediawiki-ext/tree/master/jiandanurl)

### 参考

- [http://www.mediawiki.org/wiki/Manual:Parser_functions#Simple_example](http://www.mediawiki.org/wiki/Manual:Parser_functions#Simple_example)
- 返回html：[http://www.mediawiki.org/wiki/Manual:Parser_functions#Controlling_the_parsing_of_output](http://www.mediawiki.org/wiki/Manual:Parser_functions#Controlling_the_parsing_of_output)


## 如何启用mediawiki中的extension

修改www root下的`LocalSettings.php`文件

添加
{% highlight php %}
<?php
require_once "extensions/ExtensionName/ExtensionName.php";
{% endhighlight %}

比如 /var/www/html/ 是www根目录

    /var/www/html/extensions/ExtensionName/ExtensionName.php
    /var/www/html/LocalSettings.php

### 参考

- [http://www.mediawiki.org/wiki/Extensions_FAQ#How_do_I_enable_an_extension.3F](http://www.mediawiki.org/wiki/Extensions_FAQ#How_do_I_enable_an_extension.3F)

## mediawiki支持html

    sudo vim /var/www/html/wiki/LocalSettings.php

{% highlight php %}
<?php
    $wgRawHtml = true;
{% endhighlight %}

[让output是inline]: http://www.mediawiki.org/wiki/Manual:Parser_functions#Controlling_the_parsing_of_output
  "让output是inline"
