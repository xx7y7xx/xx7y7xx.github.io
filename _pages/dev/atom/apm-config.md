---
layout: page
title: apm config
---

## apm config

```
$ apm config get proxy2
undefined
$ apm config get proxy
null
```

## `apm config list`

```
; cli configs
globalconfig = "/home/chenyang/.atom/.apm/.apmrc"
user-agent = "npm/3.10.10 node/v6.9.5 linux x64"
userconfig = "/home/chenyang/.atom/.apmrc"

; environment configs
node-gyp = "/opt/atom/resources/app/apm/bin/../node_modules/.bin/node-gyp"

; project config /home/chenyang/.npmrc
loglevel = "info"
registry = "https://registry.npmjs.org/"

; userconfig /home/chenyang/.atom/.apmrc
https-proxy = "http://127.0.0.1:8080/"
proxy = "http://127.0.0.1:8080/"

; globalconfig /home/chenyang/.atom/.apm/.apmrc
cache = "/home/chenyang/.atom/.apm"
progress = false

; node bin location = /opt/atom/resources/app/apm/bin/node
; cwd = /home/chenyang/.atom
; HOME = /home/chenyang/.atom/.node-gyp
; "npm config ls -l" to show all defaults.
```

## config file

```
/home/chenyang/.atom/.apm/.apmrc
```

## verbose output

```
apm install pigments --verbose
```

## Set proxy # {#set-proxy}

### Set proxy for Atom on Windows # {#set-proxy-for-atom-on-windows}

```
C:\Users\Administrator>apm config get proxy
信息: 用提供的模式无法找到文件。
系统找不到指定的文件。
null

C:\Users\Administrator>apm config set proxy "http://127.0.0.1:8118"
信息: 用提供的模式无法找到文件。
系统找不到指定的文件。

C:\Users\Administrator>apm config get proxy

信息: 用提供的模式无法找到文件。
系统找不到指定的文件。
http://127.0.0.1:8118/
```

```
C:\Users\Administrator>apm config get https-proxy
信息: 用提供的模式无法找到文件。
系统找不到指定的文件。
null

C:\Users\Administrator>apm config set https-proxy "http://127.0.0.1:8118"
信息: 用提供的模式无法找到文件。
系统找不到指定的文件。

C:\Users\Administrator>apm config get https-proxy
信息: 用提供的模式无法找到文件。
系统找不到指定的文件。
http://127.0.0.1:8118/
```

### Set proxy for Atom on Ubuntu 16.04 # {#set-proxy-for-atom-on-ubuntu-16.04}

```
$ apm config get proxy
null
$ apm config set proxy "http://127.0.0.1:8080"
$ apm config get proxy
http://127.0.0.1:8080/
$ apm config get https-proxy
null
$ apm config set https-proxy "http://127.0.0.1:8080"
$ apm config get https-proxy
http://127.0.0.1:8080/
```

reset proxy

```
apm config delete proxy
apm config delete https-proxy
```

## change registry

```
 ~  apm config get registry
https://registry.npmjs.org/
 ~  apm config set registry "https://registry.npm.taobao.org/"
 ~  apm config get registry
https://registry.npmjs.org/
```

You will see no change when `get registry`, but `.apmrc` did changed.

```
$ cat ~/.atom/.apmrc
registry=https://registry.npm.taobao.org/
```

And you could check the verbose log of `apm update` or `apm install` with `--verbose` option, and see the request URL.

```
...
REQUEST make request https://registry.npm.taobao.org/babel-core
REQUEST onRequestResponse https://registry.npm.taobao.org/babel-core 200 { date: 'Mon, 09 Oct 2017 02:44:44 GMT',
  'content-type': 'application/json; charset=utf-8',
  'content-length': '604348',
  connection: 'keep-alive',
  'x-current-requests': '1',
  etag: '"938bc-x+h1d1D0o8vWro322pZg3C3s4IA"',
  'x-readtime': '176' }
REQUEST reading response's body
REQUEST finish init function https://registry.npm.taobao.org/babel-core
...
```

## command line help

```
apm help
apm help config
```

## apm update

```
apm update -c --verbose
```
