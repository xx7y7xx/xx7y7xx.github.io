---
layout: page
title: Programming
---
##  php

最简单的php template技术

[http://jungels.net/articles/php-templates.html](http://jungels.net/articles/php-templates.html)

使用如下形式：

```
<?php
$foo = "bar";
echo <<<DOT
This is $foo.
DOT;
?>
```


## drupal

drupal 主题乱了的解决办法

错误信息：

```
Warning: file_put_contents(temporary://fileDo16vg): failed to open stream: "DrupalTemporaryStreamWrapper::stream_open" call failed 在 file_unmanaged_save_data() (行 1933 在 /var/www/html/web/includes/file.inc).
```

貌似打开http://ip/admin/config/media/file-system 就好了。

## git

将master中的代码合并到branch中

```
git checkout -b develop
```

...make some changes...

...notice master has been updated...

...commit changes to develop...

```
git checkout master
git pull
```

...bring those changes back into develop...

```
git checkout develop
git rebase master
```

## IoC (Inversion of Control)

