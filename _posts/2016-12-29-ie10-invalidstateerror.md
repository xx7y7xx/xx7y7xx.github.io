---
layout: post
title: IE10 InvalidStateError
---

```js
var xhr = new XMLHttpRequest();
xhr.withCredentials = true; // Remove this line to solve problem
```

## References

- [https://github.com/enyo/dropzone/issues/179](https://github.com/enyo/dropzone/issues/179)