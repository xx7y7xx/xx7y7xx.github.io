---
layout: page
permalink: /dev/yarn.html
title: yarn
categories: [development, nodejs]
---

## Proxy

[http://www.jhipster.tech/configuring-a-corporate-proxy/](http://www.jhipster.tech/configuring-a-corporate-proxy/)

When you already had a HTTP proxy at localhost:8087, then set it in yarn.

```
$ yarn config set proxy http://localhost:1087
$ yarn config set https-proxy http://localhost:1087
```

Check existing proxy.

```
$ yarn config get proxy
http://localhost:1087
$ yarn config get https-proxy
http://localhost:1087
```

Clear existing proxy.

```
$ yarn config delete proxy
$ yarn config delete https-proxy
```

## FAQ

If still see this error after deleting proxy.

```
error An unexpected error occurred: "https://registry.npmjs.org/@db-man%2fgithub: tunneling socket could not be established, cause=connect ECONNREFUSED 127.0.0.1:1087".
```

Beside yarn, there is also a npm config for proxy.

```
$ npm config delete proxy
$ npm config delete https-proxy
```

## common commands

list packages installed globally

```
yarn global list
yarn global list create-react-app
```

show verbose print

```
yarn add antd --verbose
```

## See also

- [yarn installation](/dev/yarn-installation.html)
- [npmjs](/dev/npmjs.html)
- [npm vs yarn](/dev/npm-vs-yarn.html)
