---
layout: post
title: "NPM Unexpected end of JSON input while parsing near"
---

```
npm install --registry=https://registry.npm.taobao.org
```

```
npm http fetch GET 304 https://registry.npm.taobao.org/array-uniq 315ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/longest 311ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/is-arrayish 326ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/capture-stack-trace 308ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/randomatic 328ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/path-key 150ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/spdx-license-ids 4082ms (from cache)
npm http fetch GET 304 https://registry.npm.taobao.org/node-libs-browser 256ms (from cache)
npm ERR! Unexpected end of JSON input while parsing near '...283ffcbf29","size":54'

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/chenyang/.npm/_logs/2017-09-26T04_21_13_536Z-debug.log
npm info lifecycle ssc30-admin@0.2.0~install: Failed to exec install script
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! ssc30-admin@0.2.0 install: `npm i --registry=https://registry.npm.taobao.org`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the ssc30-admin@0.2.0 install script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
npm WARN Local package.json exists, but node_modules missing, did you mean to install?

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/chenyang/.npm/_logs/2017-09-26T04_21_13_558Z-debug.log
```

```
npm install --registry=https://registry.npm.taobao.org --loglevel=silly
```

Modify `/usr/lib/node_modules/npm/node_modules/pacote/node_modules/make-fetch-happen/node_modules/node-fetch-npm/node_modules/json-parse-better-errors/index.js` to show the bad json text.

```js
  try {
    return JSON.parse(txt, reviver)
  } catch (e) {
    console.log(txt); // add this for debug
    ...
  }
```

```
npm sill pacote range manifest for ssc-refer@^0.1.27 fetched in 17ms
npm sill resolveWithNewModule ssc-refer@0.1.37 checking installable status
npm sill pacote range manifest for style-loader@^0.12.3 fetched in 17ms
npm sill resolveWithNewModule style-loader@0.12.4 checking installable status
npm sill pacote range manifest for url-loader@^0.5.6 fetched in 16ms
npm sill resolveWithNewModule url-loader@0.5.9 checking installable status
npm http fetch GET 304 https://registry.npm.taobao.org/node-libs-browser 60ms (from cache)
{"name":"node-libs-browser","modified":"2017-03-27T16:38:29.000Z","dist-tags":{"0.x-latest":"0.7.0","latest":"2.0.0"},"versions":{"0.1.0":{"name":"node-libs-browser","version":"0.1.0","dependencies":{"console-browserify":"0.1.6","vm-browserify":"0.0.1","crypto-browserify":"0.2.1","http-browserify":"0.1.6","buffer-browserify":"0.0.4","zlib-browserify":"0.0.1"},"devDependencies":{"mocha":"1.8.x","should":"1.1.x","chai":"1.5.x","mocha-loader":"0.5.x","json-loader":"0.5.x"},"directories":{},"dist":{"shasum":"f283a8bbd690605ea7bd950eee843dce0f3cac4a","size":99549,"noattachment":false,"tarball":"http://registry.npm.taobao.org/node-libs-browser/download/node-libs-browser-0.1.0.tgz"},"_hasShrinkwrap":false,"publish_time":1361788323272},"0.1.2":{"name":"node-libs-browser","version":"0.1.2","dependencies":{"console-browserify":"0.1.6","vm-browserify":"0.0.1","crypto-browserify":"0.2.1","http-browserify":"0.1.6","buffer-browserify":"0.0.4","zlib-browserify":"0.0.1"},"devDependencies":{"mocha":"1.8.x","should":"1.1.x","chai":"1.5.x","mocha-loader":"0.5.x","json-loader":"0.5.x"},"directories":{},"dist":{"shasum":"f9347dbfdecd36bdbebccb4f898310283ffcbf29","size":54
npm sill fetchPackageMetaData error for node-libs-browser@^0.5.2 Unexpected end of JSON input while parsing near '...283ffcbf29","size":54'
npm verb stack SyntaxError: Unexpected end of JSON input while parsing near '...283ffcbf29","size":54'
npm verb stack     at JSON.parse (<anonymous>)
npm verb stack     at parseJson (/usr/lib/node_modules/npm/node_modules/pacote/node_modules/make-fetch-happen/node_modules/node-fetch-npm/node_modules/json-parse-better-errors/index.js:7:17)
npm verb stack     at consumeBody.call.then.buffer (/usr/lib/node_modules/npm/node_modules/pacote/node_modules/make-fetch-happen/node_modules/node-fetch-npm/src/body.js:96:50)
npm verb stack     at <anonymous>
npm verb stack     at process._tickCallback (internal/process/next_tick.js:188:7)
npm verb cwd /home/chenyang/source/react-redux-app
npm verb Linux 4.4.0-96-generic
npm verb argv "/usr/bin/nodejs" "/usr/bin/npm" "i" "--registry=https://registry.npm.taobao.org" "--loglevel=silly"
npm verb node v8.2.1
npm verb npm  v5.4.2
npm ERR! Unexpected end of JSON input while parsing near '...283ffcbf29","size":54'
npm verb exit [ 1, true ]

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/chenyang/.npm/_logs/2017-09-26T04_28_11_261Z-debug.log
npm info lifecycle ssc30-admin@0.2.0~install: Failed to exec install script
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! ssc30-admin@0.2.0 install: `npm i --registry=https://registry.npm.taobao.org --loglevel=silly`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the ssc30-admin@0.2.0 install script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
npm WARN Local package.json exists, but node_modules missing, did you mean to install?

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/chenyang/.npm/_logs/2017-09-26T04_28_11_290Z-debug.log
```

```
npm cache clean --force
```
