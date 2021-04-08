---
layout: page
---
如果网站禁用了右键菜单，如何恢复

打开console，输入

```
document.oncontextmenu=null
document.onselectstart=null
```

## 参考

[Re-Enable Right-Click When Web Pages Turn It Off](http://www.tech-recipes.com/rx/501/re-enable-right-click-when-web-pages-turn-it-off/)