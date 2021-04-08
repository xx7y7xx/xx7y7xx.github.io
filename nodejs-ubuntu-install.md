---
layout: page
title: Node.js Ubuntu Installation
---

## Install on Ubuntu 16.04

### Method 1 : nodesource

#### Installation

[https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

Node.js v6:

```
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
```

配置npm源

```
npm config set registry https://registry.npm.taobao.org
npm info underscore
```

Set log level

```
npm config set loglevel warn
npm config set loglevel info
```

Upgrade npm

```
sudo npm install -g npm
```

#### Upgrade

##### upgrade nodejs (minor version, from 6.1 to 6.2)

Just like a fresh new installation.

```
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Note for upgrading Node.js:

Sometimes new version of Node.js is shipping with a new version of V8, existing native addons will need to be recompiled or runtime errors will occur when trying to load them. Use [`npm rebuild`](https://docs.npmjs.com/cli/rebuild) or simply remove your `node_modules` dir and `npm install` from scratch.

```
npm rebuild
```

##### upgrade nodejs (major version, from 6.x to 8.x)

Just like a fresh new installation.

```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g npm
```

More details in blog posts: [Upgrade node.js from v6 to v8](/2017/07/19/upgrade-node-from-v6-to-v8.html)

#### How to remove Node.js

How to remove Node.js [http://askubuntu.com/questions/629315/how-to-remove-nodejs-from-nodesource-com](http://askubuntu.com/questions/629315/how-to-remove-nodejs-from-nodesource-com)

```
sudo apt-get purge nodejs
sudo rm /etc/apt/sources.list.d/nodesource.list
```

```
sudo apt-key list
```

```
pub   4096R/68576280 2014-06-13
uid                  NodeSource <gpg@nodesource.com>
sub   4096R/AA01DA2C 2014-06-13
```

```
sudo apt-key del 68576280
```

### Method 2 : Linux Binaries (x86/x64)

```
tar xvf node-v6.9.2-linux-x64.tar.xz
mv node-v6.9.2-linux-x64 /opt/
rm /usr/local/bin/node
ln -s /opt/node-v6.9.2-linux-x64/bin/node  /usr/local/bin/node
#ln -s ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
npm install -g npm
```