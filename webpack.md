---
layout: page
title: Webpack
---

## Debugging is broken in development mode when using cheap-module-eval-source-map

Open Chrome DevTools to (Javascript) view source code, but saw this:

```js
undefined


/** WEBPACK FOOTER **
 ** 
 **/
```

or

```js
undefined


// WEBPACK FOOTER //
// 
```

[https://github.com/coryhouse/react-slingshot/issues/255#issuecomment-244240534](https://github.com/coryhouse/react-slingshot/issues/255#issuecomment-244240534)

Add `EvalSourceMapDevToolPlugin` to `webpack.config.js`

```js
module.exports = {
  ...
  plugins: [
    ...
    new webpack.EvalSourceMapDevToolPlugin()
  ],
  ...
};
```

## Hot Module Replacement (HMR)

[https://webpack.github.io/docs/hot-module-replacement.html](https://webpack.github.io/docs/hot-module-replacement.html)

### Bad example

Module A requires module B, and B requires C.

<pre>
------------
| Module A |  ( with `module.hot.accept()` )
------------
   |   ------------
   `-- | Module B |
       ------------
          |   ------------
          `-- | Module C |  ( Modified/Updated )
              ------------
</pre>

Module B can't handle the update. so both Module B and Module C became outdated.

### Good example

Module A requires module B, and B requires C.

<pre>
------------
| Module A |  ( with `module.hot.accept('module_c')` )
------------
   |   ------------
   `-- | Module B |
       ------------
          |   ------------
          `-- | Module C |  ( Modified/Updated )
              ------------
</pre>

Module A can handle the update of Module C. so both Module B and Module C became outdated.

## IE8 support

See also [UglifyJS](/uglifyjs.html#ie8-support)

## webpack.optimize.UglifyJsPlugin

```
  plugins: [
    ...
    new webpack.optimize.UglifyJsPlugin({
      include: /\.min\.js$/,
      minimize: true,
      compress: {
        warnings: false
      }
    }),
    ...
  ]
```

https://webpack.js.org/guides/migrating/#uglifyjsplugin-minimize-loaders

> `UglifyJsPlugin` no longer switches loaders into minimize mode. The `minimize: true` setting needs to be passed via loader options in the long-term. See loader documentation for relevant options.

## devtool build time compare

```diff
--- <devtool: 'cheap-module-eval-source-map'>
+++ <devtool: 'source-map'>
@@ -12,8 +12,8 @@
 ==>    Listening on port 4001. Open up http://127.0.0.1:4001/ in your browser.
 Happy[jsx]: All set; signaling webpack to proceed.
 webpack building...
-webpack built c435bc5f575775db1241 in 12446ms
+webpack built 67e0ec8ec9a71557d0bc in 14745ms
 webpack building...
-webpack built 255ec77ddea77c615c8f in 2979ms
+webpack built 44791f1cd437fded15d7 in 4340ms
 webpack building...
-webpack built 77cda347c632437d87f9 in 1826ms
+webpack built 2bdccf86ed67871c8c02 in 3503ms
```

Operation steps:

1. Initial building time: 12446ms
2. Remove one line code: 2979ms
3. Ctrl+Z to append new line: 1826ms

## async/await with webpack+babel

- [https://gist.github.com/thejmazz/067295d9fb8b22c77be0](https://gist.github.com/thejmazz/067295d9fb8b22c77be0)

## production

### source map

`webpack.production.config.js`

```js
module.exports = {
    // source mapping in production mode
    devtool: 'source-map',
...
    plugins: [
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: JSON.stringify(process.env.NODE_ENV || 'production'),
            }
        }),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false,
            },
            sourceMap: true,
        }),
```

explicit set `sourceMap: true` to generate source map : [https://github.com/webpack/webpack/issues/2704](https://github.com/webpack/webpack/issues/2704)

### code split

demo project: [https://github.com/brotzky/code-splitting-react-webpack](https://github.com/brotzky/code-splitting-react-webpack)

forked project with more features : https://github.com/brotzky/code-splitting-react-webpack


## magic comment

[https://medium.com/faceyspacey/how-to-use-webpacks-new-magic-comment-feature-with-react-universal-component-ssr-a38fd3e296a](https://medium.com/faceyspacey/how-to-use-webpacks-new-magic-comment-feature-with-react-universal-component-ssr-a38fd3e296a)

[https://webpack.js.org/api/module-methods/#import-](https://webpack.js.org/api/module-methods/#import-)

`webpackChunkName` will set the chunk name

```js
                System.import(/* webpackChunkName: "about" */ '../components/About')
                  .then(loadRoute(cb))
                  .catch(errorLoading);
```

## webpack 2

[webpack2 doesn't support IE8](https://github.com/webpack/webpack/issues/3070#issuecomment-260362472)