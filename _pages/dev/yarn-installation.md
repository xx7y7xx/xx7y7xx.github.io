---
layout: page
permalink: /dev/yarn-installation.html
title: yarn installation
categories: [development, nodejs]
---

First, install [nodejs](/nodejs)

## Debian/Ubuntu Linux

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

## CentOS / Fedora / RHEL

```
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
sudo yum install yarn
```

## macOS

```
$ brew install yarn
```

upgrade

```
brew upgrade yarn
```

### uninstall

Check how you installed yarn (by homebrew or npm)

```
$ brew ls yarn
/usr/local/Cellar/yarn/1.21.1/bin/yarn
/usr/local/Cellar/yarn/1.21.1/bin/yarnpkg
/usr/local/Cellar/yarn/1.21.1/libexec/bin/ (5 files)
/usr/local/Cellar/yarn/1.21.1/libexec/lib/ (2 files)
/usr/local/Cellar/yarn/1.21.1/libexec/package.json
```

```
$ npm ls yarn -g
npm info it worked if it ends with ok
npm info using npm@6.13.4
npm info using node@v12.14.0
/usr/local/lib
└── (empty)

npm timing npm Completed in 2067ms
npm info ok
```

If yarn is installed from Homebrew, then run this

```
$ brew uninstall yarn
Uninstalling /usr/local/Cellar/yarn/1.21.1... (14 files, 5MB)
```

## See also

- [yarn](/dev/yarn.html)
