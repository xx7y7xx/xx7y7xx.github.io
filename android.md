---
layout: page
title: Android
---

## Accessing a node service on my local machine from Android emulator

[https://stackoverflow.com/a/9515414](https://stackoverflow.com/a/9515414)

http://10.0.2.2:3000

## Android Projects

- [https://github.com/xx7y7xx/SimpleWebView](https://github.com/xx7y7xx/SimpleWebView)

## Demo code

- [https://github.com/GoogleChrome/chromium-webview-samples/tree/master/webrtc-example](https://github.com/GoogleChrome/chromium-webview-samples/tree/master/webrtc-example)

## Android Studio

gradle本来只支持http/https proxy，配置方法

```
systemProp.https.proxyPort=8080
systemProp.http.proxyHost=127.0.0.1
systemProp.https.proxyHost=127.0.0.1
systemProp.http.proxyPort=8080
```

但是如果本地只有socks proxy，则需要进行如下配置

配置gradle通过socks代理访问网络（下载依赖包），比如shadowsocks提供的代理，原文见：[https://discuss.gradle.org/t/how-can-i-set-gradle-proxy-to-socks/15508](https://discuss.gradle.org/t/how-can-i-set-gradle-proxy-to-socks/15508)

修改`gradle.properties`文件，如果之前设置过http/https proxy，则注释掉

然后添加

```
org.gradle.jvmargs=-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080
```

## inspect HTTP requests made by android

1. open android studio
2. open `chrome://inspect/#devices`