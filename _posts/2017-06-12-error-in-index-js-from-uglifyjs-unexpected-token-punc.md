---
layout: page
title: "ERROR in index.js from UglifyJs Unexpected token: punc (,) [index.js:221804,9]"
---

```sh
cross-env NODE_ENV=production webpack --config webpack.homep.config.js
```

```
ERROR in ./~/css-loader!./~/postcss-loader!./~/less-loader/dist!./src/财务平台/assets/转换模板.less
Module build failed: Error: No PostCSS Config found in: /home/chenyang/source/sscplatform/FC/src/财务平台/assets
    at Error (native)
    at /home/chenyang/source/sscplatform/FC/node_modules/postcss-load-config/index.js:51:26
 @ ./src/财务平台/assets/转换模板.less 4:14-174
 @ ./src/财务平台/containers/转换模板/Index.js
 @ ./src/index.js
 @ multi babel-polyfill ./src/index

ERROR in index.js from UglifyJs
Unexpected token: punc (,) [index.js:221804,9]

ERROR in index.js from UglifyJs
Unexpected token: punc (,) [index.js:221804,9]
```

```js
module.exports = {
  Formula
};
```

```js
module.exports = {
  Formula: Formula
};
```

## References

- [https://github.com/yyssc/ssc-formula2/issues/7](https://github.com/yyssc/ssc-formula2/issues/7)