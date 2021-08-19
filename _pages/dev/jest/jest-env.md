---
layout: page
title: Jest
permalink: /dev/jest/jest-env.html
---

## Test environment

You can select with "jsdom"(default) and "node".

How to apply this environment variable:

Method (1): Globally, in command line option

```
$ jest --env node
```

Method (2): Globally, in `package.json`

```json
{
  "jest": {
    "testEnvironment": "node"
  }
}
```

Method (3): Per files, in `*.js` (available in Jest 20.0.0+)

```js
/**
 * @jest-environment jsdom
 */

test("use jsdom in this test file", () => {
  const element = document.createElement("div");
  expect(element).not.toBeNull();
});
```

## References

- [Jest CLI Options](https://jestjs.io/docs/en/cli.html#--coverageboolean)
- [Configuring Jest](https://jestjs.io/docs/en/configuration.html)
