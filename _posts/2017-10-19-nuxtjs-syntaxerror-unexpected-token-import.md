---
layout: page
title: "Nuxt.js SyntaxError: Unexpected token import"
---

Nuxt.js + Vum

```
Nuxt.js Error:

/Users/chenyang/source/sscplatform/MFC/node_modules/vum/src/vum.js:1
(function (exports, require, module, __filename, __dirname) { import BackLink from './directives/back-link'
                                                              ^^^^^^

SyntaxError: Unexpected token import
    at createScript (vm.js:80:10)
    at Object.runInThisContext (vm.js:139:10)
    at Module._compile (module.js:588:28)
    at Object.Module._extensions..js (module.js:635:10)
    at Module.load (module.js:545:32)
    at tryModuleLoad (module.js:508:12)
    at Function.Module._load (module.js:500:3)
    at Module.require (module.js:568:17)
    at require (internal/module.js:11:18)
    at r (/Users/chenyang/source/sscplatform/MFC/node_modules/vue-server-renderer/build.js:5817:16)
    at Object.<anonymous> (webpack:/external "vum":1:0)
    at __webpack_require__ (webpack:/webpack/bootstrap 17e85949a70cc2deecdd:25:0)
    at Object.module.exports.Object.defineProperty.value (server-bundle.js:2886:62)
    at __webpack_require__ (webpack:/webpack/bootstrap 17e85949a70cc2deecdd:25:0)
    at _callee$ (.nuxt/index.js:119:16)
    at tryCatch (~/regenerator-runtime/runtime.js:65:14)
    at Generator.invoke [as _invoke] (~/regenerator-runtime/runtime.js:299:0)
    at Generator.prototype.(anonymous function) [as next] (~/regenerator-runtime/runtime.js:117:0)
    at step (~/babel-runtime/helpers/asyncToGenerator.js:17:0)
    at server-bundle.js:731:13
    at <anonymous>
```

> Nuxt's server webpack config excludes all external modules from being transpiled in the server build. 

[https://github.com/Justineo/vue-awesome/issues/7#issuecomment-322034039](https://github.com/Justineo/vue-awesome/issues/7#issuecomment-322034039)

<!-- seems good, dosent work

Disable SSR on Vum

```js
  plugins: [
    // '~plugins/vum'
    { src: '~plugins/vum', ssr: false },
  ],
```

-->

## References

- [vum-team/vum](https://github.com/vum-team/vum)