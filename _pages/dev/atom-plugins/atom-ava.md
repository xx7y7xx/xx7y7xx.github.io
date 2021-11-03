---
layout: page
title: atom-ava
permalink: /dev/atom-plugins/atom-ava.html
---

## Features

- Snippets
- Run tests directly in the editor

## Dependencies

The `atom-ava` will call `ava` command directly[^1], so that means you have to install `ava` globally.

```
npm i ava -g
```

## Snippets

For example, inputing `import-ava` with a <kbd>Tab ↹</kbd> key will generate code

```
import test from 'ava';
```

## Snippets

Check the snippets defined at [here][avajs-snippets]

[avajs-snippets]: https://github.com/avajs/atom-ava/tree/master/snippets "avajs snippets"

{:target="\_blank"}

## External links

- [https://github.com/avajs/atom-ava](https://github.com/avajs/atom-ava){:target="\_blank"}
- [https://atom.io/packages/ava](https://atom.io/packages/ava){:target="\_blank"}
- [https://github.com/avajs/atom-ava/issues/19](https://github.com/avajs/atom-ava/issues/19){:target="\_blank"}

## References

[^1]: [Prefer local ava installation #19](https://github.com/avajs/atom-ava/issues/19#issuecomment-344003998){:target="\_blank"}
