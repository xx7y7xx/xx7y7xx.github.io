---
layout: page
title: node-mysql2
---

```
node-mysql2
```

Using in nwjs, there is error, when calling `PromisePool.prototype.getConnection` (node_modules/mysql2/promise.js)

```
d.ClientHandshake is not a constructor
```

solution [https://stackoverflow.com/questions/53524510/mysql2-typeerror-f-clienthandshake-is-not-a-constructor](https://stackoverflow.com/questions/53524510/mysql2-typeerror-f-clienthandshake-is-not-a-constructor)

```
vim node_modules/nw-react-scripts/config/webpack.config.prod.js
```

```
module.exports = {
  ...
  optimization: {
    minimize: false, // Add this to disable minification
    minimizer: [
      ...
    ]
...
```