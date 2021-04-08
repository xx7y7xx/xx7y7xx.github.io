---
layout: page
title: Flow
---

## install

### setup babel compiler

```
npm install --save-dev babel-cli babel-preset-flow
```

modify `.babelrc`

```json
{
  "presets": ["flow"]
}
```

### setup flow

```
npm install --save-dev flow-bin
```

add to npm script

```json
{
  "scripts": {
    "flow": "flow"
  }
}
```

create flow config file

```
npm run flow init
```

check for the first time

```
npm run flow
```

### check selected files

```
// @flow
```

OR

```
/* @flow */
```

in `*.js`

OR

run `flow check --all`

## config file

`.flowconfig`

```
[ignore]
.*/node_modules/.*

[include]

[libs]
flow-typed

[options]
# https://wietse.loves.engineering/using-flowtype-with-decorators-in-react-af4fe69e66d6
esproposal.decorators=ignore

[lints]
```

## References

- [https://flow.org/en/docs/frameworks/react/](https://flow.org/en/docs/frameworks/react/)
- [https://wietse.loves.engineering/using-flowtype-with-decorators-in-react-af4fe69e66d6](https://wietse.loves.engineering/using-flowtype-with-decorators-in-react-af4fe69e66d6)