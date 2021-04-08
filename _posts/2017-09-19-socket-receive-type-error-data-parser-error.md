---
layout: post
title: 'socket receive: type "error", data "parser error"'
---

由于[koa-socket](https://www.npmjs.com/package/koa-socket)使用较低版本的socket.io，又引用了较低版本的engine.io-client，所以有中文乱码的问题导致poll的时候解析json报错。

```
mfc@1.0.0 /home/chenyang/source/sscplatform/MFC
├─┬ koa-socket@4.4.0
│ └─┬ socket.io@1.4.5
│   └─┬ socket.io-client@1.4.5
│     └── engine.io-client@1.6.8 
└─┬ socket.io-client@2.0.3
  └── engine.io-client@3.1.1 
```

```
_selected.vue:515 handleButtonClick
socket.io.js:6 socket.io-client: client
socket.io.js:12 Creates a new Manager for the given URL: localhost:3000
browser.js:123 socket.io-client:url protocol-less url localhost:3000 +0ms
browser.js:123 socket.io-client:url parse http://localhost:3000 +1ms
browser.js:123 socket.io-client new io instance for http://localhost:3000 +1ms
browser.js:123 socket.io-client:manager readyState closed +0ms
browser.js:123 socket.io-client:manager opening http://localhost:3000 +1ms
browser.js:123 engine.io-client:socket creating transport "polling" +1ms
browser.js:123 engine.io-client:polling polling +1ms
browser.js:123 engine.io-client:polling-xhr xhr poll +0ms
browser.js:123 engine.io-client:polling-xhr xhr open GET: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQcVX +1ms
browser.js:123 engine.io-client:polling-xhr xhr data null +1ms
browser.js:123 engine.io-client:socket setting transport polling +1ms
browser.js:123 socket.io-client:manager connect attempt will timeout after 20000 +1ms
browser.js:123 socket.io-client:manager readyState opening +1ms
index.vue:184 [xiaoyou.vue] asyncData()
browser.js:123 socket.io-client:socket emitting packet with ack id 0 +5ms
polling-xhr.js:250 XHR finished loading: GET "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQcVX".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
browser.js:123 engine.io-client:polling polling got data 97:0{"sid":"lAPlS0WHj-3Nve9zAAAC","upgrades":["websocket"],"pingInterval":25000,"pingTimeout":60000}2:40 +3s
browser.js:123 engine.io-client:socket socket receive: type "open", data "{"sid":"lAPlS0WHj-3Nve9zAAAC","upgrades":["websocket"],"pingInterval":25000,"pingTimeout":60000}" +1ms
browser.js:123 engine.io-client:socket socket open +2ms
browser.js:123 socket.io-client:manager open +0ms
browser.js:123 socket.io-client:manager cleanup +1ms
browser.js:123 socket.io-client:socket transport is open - connecting +0ms
browser.js:123 engine.io-client:socket starting upgrade probes +1ms
browser.js:123 engine.io-client:socket probing transport "websocket" +1ms
browser.js:123 engine.io-client:socket creating transport "websocket" +1ms
browser.js:123 engine.io-client:socket socket receive: type "message", data "0" +2ms
browser.js:123 socket.io-parser decoded 0 as {"type":0,"nsp":"/"} +2ms
browser.js:123 socket.io-client:manager writing packet {"type":2,"data":["last-messages"],"options":{"compress":true},"id":0,"nsp":"/"} +1ms
browser.js:123 socket.io-parser encoding packet {"type":2,"data":["last-messages"],"options":{"compress":true},"id":0,"nsp":"/"} +1ms
browser.js:123 socket.io-parser encoded {"type":2,"data":["last-messages"],"options":{"compress":true},"id":0,"nsp":"/"} as 20["last-messages"] +1ms
browser.js:123 engine.io-client:socket flushing 1 packets in socket +2ms
browser.js:123 engine.io-client:polling-xhr xhr open POST: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdBy&sid=lAPlS0WHj-3Nve9zAAAC +2ms
browser.js:123 engine.io-client:polling-xhr xhr data 20:420["last-messages"] +1ms
browser.js:123 engine.io-client:polling polling +1ms
browser.js:123 engine.io-client:polling-xhr xhr poll +2ms
browser.js:123 engine.io-client:polling-xhr xhr open GET: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdC1&sid=lAPlS0WHj-3Nve9zAAAC +1ms
browser.js:123 engine.io-client:polling-xhr xhr data null +1ms
polling-xhr.js:235 [Violation] 'readystatechange' handler took 2840ms
browser.js:123 engine.io-client:socket probe transport "websocket" opened +2ms
polling-xhr.js:250 XHR finished loading: POST "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdBy&sid=lAPlS0WHj-3Nve9zAAAC".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doWrite @ polling-xhr.js:104
(anonymous) @ polling.js:208
(anonymous) @ browser.js:325
proxy @ index.js:23
(anonymous) @ browser.js:340
(anonymous) @ browser.js:320
webpackJsonp.968.exports.encodePacket @ browser.js:119
encodeOne @ browser.js:319
eachWithIndex @ browser.js:338
map @ browser.js:345
webpackJsonp.968.exports.encodePayload @ browser.js:324
webpackJsonp.991.Polling.write @ polling.js:207
webpackJsonp.984.Transport.send @ transport.js:108
webpackJsonp.1025.Socket.flush @ socket.js:550
webpackJsonp.1025.Socket.sendPacket @ socket.js:610
webpackJsonp.1025.Socket.write.Socket.send @ socket.js:570
(anonymous) @ manager.js:423
webpackJsonp.987.Encoder.encode @ index.js:135
webpackJsonp.994.Manager.packet @ manager.js:421
webpackJsonp.996.Socket.packet @ socket.js:173
webpackJsonp.996.Socket.emitBuffered @ socket.js:345
webpackJsonp.996.Socket.onconnect @ socket.js:328
webpackJsonp.996.Socket.onpacket @ socket.js:224
(anonymous) @ index.js:21
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.994.Manager.ondecoded @ manager.js:345
(anonymous) @ index.js:21
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.987.Decoder.add @ index.js:247
webpackJsonp.994.Manager.ondata @ manager.js:335
(anonymous) @ index.js:21
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1025.Socket.onPacket @ socket.js:441
(anonymous) @ socket.js:258
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.984.Transport.onPacket @ transport.js:143
callback @ polling.js:145
webpackJsonp.968.exports.decodePayload @ browser.js:402
webpackJsonp.991.Polling.onData @ polling.js:149
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
polling-xhr.js:235 [Violation] 'readystatechange' handler took 250ms
polling-xhr.js:250 XHR finished loading: GET "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdC1&sid=lAPlS0WHj-3Nve9zAAAC".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.onData @ polling.js:158
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
browser.js:123 engine.io-client:polling polling got data 141:430[[{"date":"2017-08-10T01:29:22.966Z","text":"xxä¸­æyy"},{"date":"2017-08-10T01:29:22.966Z","text":"yyy","items":[{"name":"zzz","url":""}]}]] +500ms
browser.js:123 engine.io-client:socket socket receive: type "message", data "30[[{"date":"2017-08-10T01:29:22.966Z","text":"xx中文yy"},{"date":"2017-08-10T01:29:22.966Z","text":"yyy","items":[{"name":"zzz","url":""}" +2ms
browser.js:123 engine.io-client:socket socket receive: type "error", data "parser error" +1ms
browser.js:123 engine.io-client:socket socket error {"code":"parser error"} +2ms
browser.js:123 socket.io-client:manager error +1ms Error: server error
    at Socket.webpackJsonp.1025.Socket.onPacket (socket.js:435)
    at XHR.<anonymous> (socket.js:258)
    at XHR.webpackJsonp.967.Emitter.emit (index.js:134)
    at XHR.webpackJsonp.984.Transport.onPacket (transport.js:143)
    at callback (polling.js:145)
    at Object.webpackJsonp.968.exports.decodePayload (browser.js:414)
    at XHR.webpackJsonp.991.Polling.onData (polling.js:149)
    at Request.<anonymous> (polling-xhr.js:124)
    at Request.webpackJsonp.967.Emitter.emit (index.js:134)
    at Request.webpackJsonp.1027.Request.onData (polling-xhr.js:285)
socket.io.js:24 socket event error Error: server error
    at Socket.webpackJsonp.1025.Socket.onPacket (socket.js:435)
    at XHR.<anonymous> (socket.js:258)
    at XHR.webpackJsonp.967.Emitter.emit (index.js:134)
    at XHR.webpackJsonp.984.Transport.onPacket (transport.js:143)
    at callback (polling.js:145)
    at Object.webpackJsonp.968.exports.decodePayload (browser.js:414)
    at XHR.webpackJsonp.991.Polling.onData (polling.js:149)
    at Request.<anonymous> (polling-xhr.js:124)
    at Request.webpackJsonp.967.Emitter.emit (index.js:134)
    at Request.webpackJsonp.1027.Request.onData (polling-xhr.js:285)
browser.js:123 engine.io-client:socket socket close with reason: "transport error" +2ms
browser.js:123 engine.io-client:polling transport open - closing +1ms
browser.js:123 engine.io-client:polling writing close packet +1ms
browser.js:123 engine.io-client:polling-xhr xhr open POST: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdK3&sid=lAPlS0WHj-3Nve9zAAAC +1ms
browser.js:123 engine.io-client:polling-xhr xhr data 1:1 +2ms
browser.js:123 socket.io-client:manager onclose +1ms
browser.js:123 socket.io-client:manager cleanup +2ms
browser.js:123 socket.io-client:socket close (transport error) +1ms
browser.js:123 socket.io-client:manager will wait 962ms before reconnect attempt +2ms
browser.js:123 engine.io-client:socket probe transport "websocket" failed because of error: socket closed +2ms
polling-xhr.js:235 [Violation] 'readystatechange' handler took 269ms
polling-xhr.js:250 XHR finished loading: POST "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdK3&sid=lAPlS0WHj-3Nve9zAAAC".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doWrite @ polling-xhr.js:104
(anonymous) @ polling.js:208
(anonymous) @ browser.js:325
proxy @ index.js:23
(anonymous) @ browser.js:340
(anonymous) @ browser.js:320
webpackJsonp.968.exports.encodePacket @ browser.js:119
encodeOne @ browser.js:319
eachWithIndex @ browser.js:338
map @ browser.js:345
webpackJsonp.968.exports.encodePayload @ browser.js:324
webpackJsonp.991.Polling.write @ polling.js:207
close @ polling.js:176
webpackJsonp.991.Polling.doClose @ polling.js:181
webpackJsonp.984.Transport.close @ transport.js:92
webpackJsonp.1025.Socket.onClose @ socket.js:693
webpackJsonp.1025.Socket.onError @ socket.js:671
webpackJsonp.1025.Socket.onPacket @ socket.js:437
(anonymous) @ socket.js:258
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.984.Transport.onPacket @ transport.js:143
callback @ polling.js:145
webpackJsonp.968.exports.decodePayload @ browser.js:414
webpackJsonp.991.Polling.onData @ polling.js:149
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.onData @ polling.js:158
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
polling-xhr.js:235 [Violation] 'readystatechange' handler took 343ms
nuxt-loading.vue:36 [Violation] 'setInterval' handler took 976ms
browser.js:123 socket.io-client:manager attempting reconnect +2s
browser.js:123 socket.io-client:manager readyState closed +1ms
browser.js:123 socket.io-client:manager opening http://localhost:3000 +0ms
browser.js:123 engine.io-client:socket creating transport "polling" +1ms
browser.js:123 engine.io-client:polling polling +0ms
browser.js:123 engine.io-client:polling-xhr xhr poll +1ms
browser.js:123 engine.io-client:polling-xhr xhr open GET: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdts +1ms
browser.js:123 engine.io-client:polling-xhr xhr data null +0ms
browser.js:123 engine.io-client:socket setting transport polling +1ms
browser.js:123 socket.io-client:manager connect attempt will timeout after 20000 +2ms
polling-xhr.js:250 XHR finished loading: GET "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQdts".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
(anonymous) @ manager.js:540
setTimeout (async)
webpackJsonp.994.Manager.reconnect @ manager.js:530
webpackJsonp.994.Manager.onclose @ manager.js:505
(anonymous) @ index.js:21
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1025.Socket.onClose @ socket.js:705
webpackJsonp.1025.Socket.onError @ socket.js:671
webpackJsonp.1025.Socket.onPacket @ socket.js:437
(anonymous) @ socket.js:258
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.984.Transport.onPacket @ transport.js:143
callback @ polling.js:145
webpackJsonp.968.exports.decodePayload @ browser.js:414
webpackJsonp.991.Polling.onData @ polling.js:149
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.onData @ polling.js:158
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
browser.js:123 engine.io-client:polling polling got data 97:0{"sid":"pBhHVrAw4EmLqnAkAAAD","upgrades":["websocket"],"pingInterval":25000,"pingTimeout":60000}2:40 +1s
browser.js:123 engine.io-client:socket socket receive: type "open", data "{"sid":"pBhHVrAw4EmLqnAkAAAD","upgrades":["websocket"],"pingInterval":25000,"pingTimeout":60000}" +1ms
browser.js:123 engine.io-client:socket socket open +1ms
browser.js:123 socket.io-client:manager open +0ms
browser.js:123 socket.io-client:manager cleanup +1ms
browser.js:123 socket.io-client:socket transport is open - connecting +2ms
browser.js:123 socket.io-client:manager reconnect success +2ms
browser.js:123 engine.io-client:socket starting upgrade probes +1ms
browser.js:123 engine.io-client:socket probing transport "websocket" +1ms
browser.js:123 engine.io-client:socket creating transport "websocket" +1ms
browser.js:123 engine.io-client:socket socket receive: type "message", data "0" +2ms
browser.js:123 socket.io-parser decoded 0 as {"type":0,"nsp":"/"} +3ms
browser.js:123 engine.io-client:polling polling +1ms
browser.js:123 engine.io-client:polling-xhr xhr poll +1ms
browser.js:123 engine.io-client:polling-xhr xhr open GET: http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQeBl&sid=pBhHVrAw4EmLqnAkAAAD +0ms
browser.js:123 engine.io-client:polling-xhr xhr data null +1ms
polling-xhr.js:235 [Violation] 'readystatechange' handler took 1267ms
browser.js:123 engine.io-client:socket probe transport "websocket" opened +3ms
browser.js:123 engine.io-client:socket probe transport "websocket" pong +1ms
browser.js:123 engine.io-client:socket pausing current transport "polling" +1ms
browser.js:123 engine.io-client:polling we are currently polling - waiting to pause +0ms
polling-xhr.js:250 XHR finished loading: GET "http://localhost:3000/socket.io/?EIO=3&transport=polling&t=LwPQeBl&sid=pBhHVrAw4EmLqnAkAAAD".
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.onData @ polling.js:158
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
(anonymous) @ manager.js:540
setTimeout (async)
webpackJsonp.994.Manager.reconnect @ manager.js:530
webpackJsonp.994.Manager.onclose @ manager.js:505
(anonymous) @ index.js:21
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1025.Socket.onClose @ socket.js:705
webpackJsonp.1025.Socket.onError @ socket.js:671
webpackJsonp.1025.Socket.onPacket @ socket.js:437
(anonymous) @ socket.js:258
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.984.Transport.onPacket @ transport.js:143
callback @ polling.js:145
webpackJsonp.968.exports.decodePayload @ browser.js:414
webpackJsonp.991.Polling.onData @ polling.js:149
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.onData @ polling.js:158
(anonymous) @ polling-xhr.js:124
webpackJsonp.967.Emitter.emit @ index.js:134
webpackJsonp.1027.Request.onData @ polling-xhr.js:285
webpackJsonp.1027.Request.onLoad @ polling-xhr.js:366
xhr.onreadystatechange @ polling-xhr.js:238
XMLHttpRequest.send (async)
webpackJsonp.1027.Request.create @ polling-xhr.js:250
Request @ polling-xhr.js:163
webpackJsonp.1027.XHR.request @ polling-xhr.js:91
webpackJsonp.1027.XHR.doPoll @ polling-xhr.js:121
webpackJsonp.991.Polling.poll @ polling.js:119
webpackJsonp.991.Polling.doOpen @ polling.js:63
webpackJsonp.984.Transport.open @ transport.js:78
webpackJsonp.1025.Socket.open @ socket.js:230
Socket @ socket.js:111
Socket @ socket.js:37
webpackJsonp.994.Manager.open.Manager.connect @ manager.js:226
Manager @ manager.js:69
Manager @ manager.js:37
lookup @ index.js:60
1005 @ socket.io.js:13
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
1016 @ url.js:42
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
963 @ index.vue:9
__webpack_require__ @ bootstrap 96ea9f7811e4d01ddfd1:693
fn @ bootstrap 96ea9f7811e4d01ddfd1:114
Promise resolved (async)
_2c160ab4 @ router.js:45
(anonymous) @ client.js:35
F @ _export.js:35
(anonymous) @ client.js:29
(anonymous) @ utils.js:51
(anonymous) @ utils.js:50
flatMapComponents @ utils.js:49
loadAsyncComponents @ client.js:27
iterator @ vue-router.esm.js:1870
step @ vue-router.esm.js:1652
step @ vue-router.esm.js:1656
runQueue @ vue-router.esm.js:1660
confirmTransition @ vue-router.esm.js:1899
transitionTo @ vue-router.esm.js:1801
push @ vue-router.esm.js:2099
push @ vue-router.esm.js:2416
handleButtonClick @ _selected.vue:516
boundFn @ vue.runtime.esm.js:164
invoker @ vue.runtime.esm.js:1733
browser.js:123 engine.io-client:polling polling got data 1:6 +626ms
browser.js:123 engine.io-client:socket socket receive: type "noop", data "undefined" +1ms
browser.js:123 engine.io-client:polling pre-pause polling complete +1ms
browser.js:123 engine.io-client:polling paused +1ms
browser.js:123 engine.io-client:socket changing transport and sending upgrade packet +2ms
browser.js:123 engine.io-client:socket setting transport websocket +1ms
browser.js:123 engine.io-client:socket clearing existing transport polling +0ms
browser.js:123 engine.io-client:polling ignoring poll - transport state "paused" +1ms
polling-xhr.js:235 [Violation] 'readystatechange' handler took 533ms
browser.js:123 engine.io-client:socket writing ping packet - expecting pong within 60000ms +25s
browser.js:123 engine.io-client:socket flushing 1 packets in socket +2ms
browser.js:123 engine.io-client:socket socket receive: type "pong", data "undefined" +3ms
```

注意这里，中文部分产生了乱码

```
engine.io-client:polling polling got data 141:430[[{"date":"2017-08-10T01:29:22.966Z","text":"xxä¸­æyy"},{"date":"2017-08-10T01:29:22.966Z","text":"yyy","items":[{"name":"zzz","url":""}]}]]
engine.io-client:socket socket receive: type "message", data "30[[{"date":"2017-08-10T01:29:22.966Z","text":"xx中文yy"},{"date":"2017-08-10T01:29:22.966Z","text":"yyy","items":[{"name":"zzz","url":""}"
engine.io-client:socket socket receive: type "error", data "parser error"
engine.io-client:socket socket error {"code":"parser error"}
socket.io-client:manager error +1ms Error: server error
    at Socket.webpackJsonp.1025.Socket.onPacket (socket.js:435)
    at XHR.<anonymous> (socket.js:258)
    at XHR.webpackJsonp.967.Emitter.emit (index.js:134)
    at XHR.webpackJsonp.984.Transport.onPacket (transport.js:143)
    at callback (polling.js:145)
    at Object.webpackJsonp.968.exports.decodePayload (browser.js:414)
    at XHR.webpackJsonp.991.Polling.onData (polling.js:149)
    at Request.<anonymous> (polling-xhr.js:124)
    at Request.webpackJsonp.967.Emitter.emit (index.js:134)
    at Request.webpackJsonp.1027.Request.onData (polling-xhr.js:285)
```

所以只要把koa-socket卸载了就好了

```
npm un koa-socket -S
npm i
npm ls engine.io-client
```

```
mfc@1.0.0 /home/chenyang/source/sscplatform/MFC
└─┬ socket.io-client@2.0.3
  └── engine.io-client@3.1.1 

```