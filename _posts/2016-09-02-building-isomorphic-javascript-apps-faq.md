---
layout: post
title: Building Isomorphic JavaScript Apps FAQ
---

## Module not found: Error: Cannot resolve module 'fs'

```
ERROR in ./~/bufferutil/~/bindings/bindings.js
Module not found: Error: Cannot resolve module 'fs' in /home/chenyang/source/yyssc-chat/node_modules/bufferutil/node_modules/bindings
 @ ./~/bufferutil/~/bindings/bindings.js 6:9-22
```

```
ERROR in ./~/ws/lib/WebSocketServer.js
Module not found: Error: Cannot resolve module 'tls' in /home/chenyang/source/yyssc-chat/node_modules/ws/lib
 @ ./~/ws/lib/WebSocketServer.js 15:10-24
```

https://github.com/webpack/react-starter/issues/3#issuecomment-53395089

```diff
--- /tmp/git-meld.Zq0E0I/staging_area/webpack.config.dev.js
+++ /tmp/git-meld.Zq0E0I/working_dir/webpack.config.dev.js
@@ -50,5 +50,8 @@
         loaders: ['style', 'raw']
       }
     ]
+  },
+  node: {
+    fs: 'empty'
   }
 };
```

## ReferenceError: WebSocket is not defined

`engine.io-client/lib/transports/websocket.js`

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