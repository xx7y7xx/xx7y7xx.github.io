---
layout: page
title: Drupal
---

## 在basic page中如何加载模块

使用```module_load_include```函数

比如
{% highlight php %}
<?php
module_load_include('inc', 'dblog', 'dblog.admin');
{% endhighlight %}