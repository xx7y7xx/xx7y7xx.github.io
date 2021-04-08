---
layout: page
title: IE
---

## debug

[https://www.debugbar.com/](https://www.debugbar.com/)

## 浏览器兼容问题

比如IE11不支持`Array.prototype.find()`

```
npm i core-js -S
```

```js
import 'core-js/fn/array/find';
```