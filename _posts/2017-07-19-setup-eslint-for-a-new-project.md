---
layout: post
title: Setup eslint for a new project
---

## eslint for Node.js (server side) env

env
- node.js
- koajs

```
npm i eslint -D
```

### A simple config example

Copy a eslint config file from [https://github.com/koajs/examples](https://github.com/koajs/examples/blob/master/.eslintrc.yml)

```yaml
env:
  mocha: true
extends: standard
plugins:
  - standard
  - promise
rules:
  arrow-parens: 0
  eqeqeq: 0
  no-return-assign: 0 # fails for arrow functions
  semi: [2, always]
  space-before-function-paren: [2, never]
  yoda: 0
  arrow-spacing: 2
  dot-location: [2, "property"]
```

### `extends` section

for `extends` config

```yml
extends: standard
```

you should install

```
npm i eslint-config-standard -D
```

also deps

```
npm i eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node -D
```

### `plugins` section

for `plugins` config

```
plugins:
  - standard
  - promise
```

you should install

```
npm i eslint-plugin-standard -D
npm i eslint-plugin-promise -D
```