---
layout: page
title: Log.io
---

## install on centos 7

Note: log.io project is not maintained, on node.js v6+ install log.io will see some error [https://github.com/NarrativeScience/Log.io/issues/189](https://github.com/NarrativeScience/Log.io/issues/189)

install [node.js](/nodejs.html)

```
sudo npm install -g log.io --user "root"
```

some logs need 

## setup

```
log.io-server &
```

```
vim ~/.log.io/harvester.conf
```

```js
var today = new Date();
var date = today.toISOString().substring(0, 10);

exports.config = {
  nodeName: "application_server",
  logStreams: {
    access: [
      "/usr/src/apache-tomcat-8.0.36/logs/localhost_access_log." + date + ".txt"
    ],
    catalina: [
      "/usr/src/apache-tomcat-8.0.36/logs/catalina." + date + ".out"
    ]
  },
  server: {
    host: '0.0.0.0',
    port: 28777
  }
}
```

```
log.io-harvester &
```