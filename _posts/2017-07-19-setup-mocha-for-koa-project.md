---
layout: post
title: Setup mocha for Koa project
---

```
npm i mocha -D
```

use supertest for make HTTP assertions

```
npm i supertest -D
```

app.js

```js
const Koa = require('koa');
// const app = new Koa();
const app = module.exports = new Koa();

app.use(ctx => {
  ctx.body = 'Hello World';
});

app.listen(3000);
```

test.js

```js
var app = require('./app');
var request = require('supertest').agent(app.listen());

describe('Hello World', function() {
  it('should say "Hello World"', function(done) {
    request
      .get('/')
      .expect(200)
      .expect('Hello World', done);
  });
});
```

## FAQ

### EADDRINUSE when watching tests with mocha and supertest

1. run mocha with `--watch` option
2. change `app.js`
3. error occured

```
  1)  Uncaught error outside test suite:
     Uncaught Error: listen EADDRINUSE :::3000
      at Object.exports._errnoException (util.js:1022:11)
      at exports._exceptionWithHostPort (util.js:1045:20)
      at Server.setupListenHandle [as _listen2] (net.js:1315:14)
      at listenInCluster (net.js:1363:12)
      at Server.listen (net.js:1463:7)
      at Application.listen (node_modules/koa/lib/application.js:64:19)
      at Object.<anonymous> (app.js:29:5)
      at require (internal/module.js:11:18)
      at Object.<anonymous> (test.js:1:73)
      at require (internal/module.js:11:18)
      at Array.forEach (native)
      at StatWatcher._handle.onchange (fs.js:1454:10)
```

[how to fix](http://www.marcusoft.net/2015/10/eaddrinuse-when-watching-tests-with-mocha-and-supertest.html):

```js
// Replace this line
// app.listen(3000);
// to
if (!module.parent) app.listen(3000);
```