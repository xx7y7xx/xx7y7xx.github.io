---
layout: post
title: Upgrade node.js from v6.10.3 to v8.1.4
---

Make sure node.js v6 is installed from nodesource.

## Install Node.js

Just like a fresh new installation.

List current env:

```
$ node -v
v6.10.3
$ npm -v
3.10.10
$ cat /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_6.x xenial main
deb-src https://deb.nodesource.com/node_6.x xenial main
```

Setup apt source:

```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
```

Check apt source:

```
$ cat /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_8.x xenial main
deb-src https://deb.nodesource.com/node_8.x xenial main
```

Begin to install `nodejs` package:

```
sudo apt-get install -y nodejs
```

After installtion, check version of node.js:

```
$ node -v
v8.1.4
$ npm -v
5.0.3
```

## Upgrade NPM

```
sudo npm i -g npm
```

```
$ npm -v
5.3.0
```

## Leftover

cd into node.js project and [rebuild all you native(C++) addons/packages](https://docs.npmjs.com/cli/rebuild).

```
npm rebuild
```

Note for upgrading Node.js:

Sometimes new version of Node.js is shipping with a new version of V8, existing native addons will need to be recompiled or runtime errors will occur when trying to load them. Use [`npm rebuild`](https://docs.npmjs.com/cli/rebuild) or simply remove your `node_modules` dir and `npm install` from scratch.