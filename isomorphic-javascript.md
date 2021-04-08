---
layout: page
title: Isomorphic Javascript
---

## boilerplate

https://github.com/mz026/universal-redux-template

## check env

```
typeof window === 'object' && ...
```

```js
var BrowserWebSocket = global.WebSocket || global.MozWebSocket;

var WebSocket = BrowserWebSocket;
if (!WebSocket && typeof window === 'undefined') {
  try {
    // We are not going to run WebSocket client on server side.
    //WebSocket = require('ws');
    WebSocket = {
      on: function () {},
      emit: function () {}
    };
  } catch (e) { }
}
```