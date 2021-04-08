---
layout: page
title: Github flavor markdown for yaml syntax highlighting
---

## code

<pre>
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
</pre>

## view

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