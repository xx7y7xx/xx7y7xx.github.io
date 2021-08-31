---
layout: page
title: NodeJS
published: true
permalink: /dev/nodejs/nodejs.html
---

## TOC

- Node.js installation
  - [macOS](/dev/nodejs/nodejs-macos-install.html)
  - [Windows](/dev/nodejs/nodejs-windows-install.html)
  - [Ubuntu](/dev/nodejs/nodejs-ubuntu-install.html)
  - [CentOS](/dev/nodejs/nodejs-centos-install.html)

## Common module list

```
require("Module ID")
```

| Module ID | API                                |
| --------- | ---------------------------------- |
| request   | https://github.com/request/request |

## Old API

https://nodejs.org/docs/v0.10.33/api/index.html

## term

- multithread
- event loop

## nodejs 和 Java 等后端通讯的方案

- zeromq

## nodejs 市场使用情况

[https://w3techs.com/technologies/details/ws-nodejs/all/all](https://w3techs.com/technologies/details/ws-nodejs/all/all)

## 适用领域

场景 1：快速构建 demo，在演示后，如果原型确定下来，再将 node 中的一部分使用 Java 等后端语言改写，或者完全使用 Java 等其他语言改写。

场景 2：将渲染层从前端转移到后端，这样做是缓存友好以及 SEO 友好的。

场景 3：构建微服务，比如为移动端添加一个新的服务。

## image processing

[http://sharp.dimens.io/en/latest/performance/#results](http://sharp.dimens.io/en/latest/performance/#results)

- https://github.com/oliver-moran/jimp
- https://github.com/aheckmann/gm
- https://github.com/lovell/sharp
- https://github.com/ImageMagick/ImageMagick

## export

Exports an anonymous function

```
// lib.js
module.exports = function () {
  return 'lib';
}

// app.js
const lib = require('./lib.js');
lib() === 'lib'; // true
```

## ES features

[https://node.green/](https://node.green/)

- Map nodejs version to ECMAScript features
- Map nodejs version to V8 version

Other website: [https://kangax.github.io/compat-table/es6/](https://kangax.github.io/compat-table/es6/)

## V8 version

The V8 version included in Node can be printed out with

```
$ node -p process.versions.v8
6.1.534.42
```

## CMS

- [https://github.com/keystonejs/keystone](https://github.com/keystonejs/keystone)
- [https://github.com/strapi/strapi/](https://github.com/strapi/strapi/)
