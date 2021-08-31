---
layout: page
title: nodejs macOS install
permalink: /dev/nodejs/nodejs-macos-install.html
---

## Method 1 - Homebrew

These installation/upgrade/uninstallation steps are follow [http://blog.teamtreehouse.com/install-node-js-npm-mac](http://blog.teamtreehouse.com/install-node-js-npm-mac)

```
$ brew install node
```

```
$ node -v
v8.1.4
$ npm -v
5.0.3
```

### Upgrade npm

```
$ npm i -g npm
```

```
$ npm -v
5.3.0
```

### Upgrade nodejs

Check if the nodejs is install from brew

```
$ brew ls node
```

Start to upgrade

```
$ brew update
$ brew upgrade node
```

### Upgrade nodejs to specific version

```
$ brew unlink node
$ brew install node@12
$ brew link node@12
```

### Uninstall

```
$ brew uninstall node
```

If failed with this error, you have to uninstall yarn first.

```
$ brew uninstall node
Error: Refusing to uninstall /usr/local/Cellar/node/13.5.0
because it is required by yarn, which is currently installed.
You can override this and force removal with:
  brew uninstall --ignore-dependencies node
```

Follow the steps in [yarn](/development/yarn.html#uninstall) to uninstall yarn first.

```
$ brew uninstall node
Uninstalling /usr/local/Cellar/node/13.5.0... (4,663 files, 59.1MB)
```

But you may find that there are multiple versions of node installed by Homebrew.

```
➜  ~ ls /usr/local/Cellar/node*
/usr/local/Cellar/node@10:
10.16.0

/usr/local/Cellar/node@12:
12.14.0
```

Follow the instruction in the [Homebrew FAQ](https://docs.brew.sh/FAQ#how-do-i-uninstall-a-formula), you have to force uninstall node.

```
$ brew uninstall --force node
```

But still can see the files

```
$ ls /usr/local/Cellar/node*
/usr/local/Cellar/node@10:
10.16.0

/usr/local/Cellar/node@12:
12.14.0
```

Follow the anwser to [brew: how to delete outdated version of package](https://apple.stackexchange.com/a/238226). I found the `node@10` or `node@12` in the result.

```
$ brew cleanup
```

It seems that both `node@10` and `node@12` is unlicked.
So I just follow the steps in [https://stackoverflow.com/a/32904423](https://stackoverflow.com/a/32904423) to remove each version of node.

```
$ brew uninstall node@10
Uninstalling /usr/local/Cellar/node@10/10.16.0... (4,159 files, 52.9MB)
$ brew uninstall node@12
Uninstalling /usr/local/Cellar/node@12/12.14.0... (4,308 files, 57.7MB)
$ ls /usr/local/Cellar/node*
zsh: no matches found: /usr/local/Cellar/node*
```

Check that the node is fullly uninstalled.

```
$ brew ls node
Error: No such keg: /usr/local/Cellar/node
```

## Method 2 - \*.pkg

[https://nodejs.org](https://nodejs.org)

`.pkg` installer

[https://nodesource.com/blog/installing-nodejs-tutorial-mac-os-x/](https://nodesource.com/blog/installing-nodejs-tutorial-mac-os-x/)

### Uninstall

[https://gist.github.com/TonyMtz/d75101d9bdf764c890ef](https://gist.github.com/TonyMtz/d75101d9bdf764c890ef)

但是需要把第一行改成

```
$ lsbom -f -l -s -pf /var/db/receipts/org.nodejs.node.pkg.bom | while read f; do sudo rm /usr/local/${f}; done
```

[https://github.com/nodejs/help/issues/35](https://github.com/nodejs/help/issues/35)

或者直接使用这个脚本：[https://gist.github.com/nicerobot/2697848](https://gist.github.com/nicerobot/2697848) 测试发现 curl 直接运行不成功，需要复制到`uninstall-node.sh`，然后在本地运行才可以。

## Method 3 - NVM

Follow the installation steps in [NVM](/nvm.html)

Be sure to uninstall the node installed by homebrew or \*.pkg file, according to this issue [https://github.com/nvm-sh/nvm/issues/1918](https://github.com/nvm-sh/nvm/issues/1918)

## See also

- [Homebrew](/development/homebrew.html)
