---
layout: page
title: UglifyJS
---

## IE8 support

By default

Input

```js
{"default":""}
```

Ouput

```js
{default:""}
```

Uglify 2.7.5 change the default value of `--screw-ie8` from `false` to `true` [https://github.com/mishoo/UglifyJS2/pull/1179](https://github.com/mishoo/UglifyJS2/pull/1179)

For webpack

```diff
diff --git a/build/webpack.prod.config.js b/build/webpack.prod.config.js
index 4d47954..a966101 100644
--- a/build/webpack.prod.config.js
+++ b/build/webpack.prod.config.js
@@ -50,10 +50,15 @@ module.exports = merge(baseConf, {
         }),
         new webpack.optimize.UglifyJsPlugin({
             mangle: { // 排除不想要压缩的对象名称
-                except: ['$super', '$', 'exports', 'require', 'module', '_']
+                except: ['$super', '$', 'exports', 'require', 'module', '_'],
+                screw_ie8: false
             },
             compress: {
-                warnings: false
+                warnings: false,
+                screw_ie8: false
+            },
+            output: {
+                screw_ie8: false
             }
         }),
         new webpack.NoErrorsPlugin(),
@@ -74,4 +79,4 @@ module.exports = merge(baseConf, {
             { from : 'node_modules/html5shiv/dist/html5shiv.min.js' , to: 'lib/html5shiv.min.js'}
         ])
     ]
-})
\ No newline at end of file
+})
```