---
layout: post
title: "The following modules couldn't be hot updated"
---

```
[HMR] The following modules couldn't be hot updated: (Full reload needed)
This is usually because the modules which have changed (and their parents) do not know how to hot reload themselves. See http://webpack.github.io/docs/hot-module-replacement-with-webpack.html for more details.
[HMR]  - ./src/containers/BaoZhangRenPage.js
```

## Method 1

[https://github.com/glenjamin/webpack-hot-middleware/issues/43#issuecomment-155697146](https://github.com/glenjamin/webpack-hot-middleware/issues/43#issuecomment-155697146)

Add this,

```js
ReactDom.render(
  ...
);

if (module.hot) {
  module.hot.accept();
}
```

to `src/MyExpBillPortlet.js`,

if webpack config `webpack.config.js` is:

```js
module.exports = {
...
  entry: {
    'MyExpBillPortlet': [
      'webpack-hot-middleware/client',
      './src/MyExpBillPortlet'
    ]
  }
...
```

## Method 2

Add `react-hmre` preset to `.babelrc`

```
{
  "presets": ["react", "es2015", "stage-0"],
  "env": {
    "development": {
      "presets": ["react-hmre"]
    }
  }
}
```

```
npm install babel-preset-react-hmre --save-dev
```
