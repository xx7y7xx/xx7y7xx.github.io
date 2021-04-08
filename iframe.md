---
layout: page
title: iframe
---

## iframe cache

抛开服务器端缓存，在本地，chrome会对iframe中的静态页进行缓存

从devtools的network看来，虽然状态码显示的是200而不是304，但是size列显示的是`(from disk cache)`，而不是文件的大小。

如下例子，有两个html，使用`index.html`中带有iframe，嵌入`iframe.html`

index.html

```
<iframe src="index.html?7"></iframe>
```

iframe.html

```
<!-- 7 -->
```

刷新index.html页面，iframe中的内容被正确加载

```
Name            Method   Status   Size
iframe.html?7   GET      200      1.2KB
```

修改iframe.html

```
<!-- 8 -->
```

刷新index.html页面

```
Name            Method   Status   Size
iframe.html?7   GET      200      (from disk cache)
```

iframe内容仍然显示7

修改index.html，修改querystring

```
<iframe src="index.html?8"></iframe>
```

刷新index.html页面

```
Name            Method   Status   Size
iframe.html?8   GET      200      1.2KB
```

iframe内容正常显示为8

解决方案：

1. 使用Chrome右键菜单中的“reload frame”，既然提供这个功能应该就是说明“reload”功能不会刷新iframe中的内容吧，我猜测。
2. 给iframe.html