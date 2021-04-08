---
layout: page
title: Nuxt.js
---

## Examples

[https://github.com/xxd3vin/nuxt-examples](https://github.com/xxd3vin/nuxt-examples)

## Nuxt API application structure

[https://github.com/nuxt/nuxt.js/issues/120](https://github.com/nuxt/nuxt.js/issues/120)

```
api/
  middleware/
    auth.js
  routes/
    posts/
      _id.js
    posts.js
  modules/
    sessions.js // app.use(module.exports)
    compression.js
    i18n.js
  api.config.js
  bootstrap.js // called before listening the application (return a promise)
  app.js // extend app
```

## less preprocessor

```
npm i less-loader less -D
```

index.vue

```vue
<style lang='less'>
@base: #f938ab;
.box {
  color: saturate(@base, 5%);
}
</style>
```

## boilerplate

- [https://github.com/clarkdo/hare](https://github.com/clarkdo/hare)