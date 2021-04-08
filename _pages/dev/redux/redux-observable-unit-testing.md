---
layout: page
title: redux-observable Unit testing
permalink: /dev/redux/redux-observable-unit-testing.html
---

## How to test root Epics

This is test original code.

```js
// file: epics.js
import { combineEpics } from "redux-observable";
import { fooEpic, barEpic } from "./foo.js";
export default const epics = combineEpics(fooEpic, barEpic);
```

This is the Unit tesing

```js
import { ActionsObservable } from "redux-observable";
import rootEpic from "./epics.js";
describe("Root epics", () => {
  it("should create proper epics", () => {
    const action$ = ActionsObservable.of({});
    expect(rootEpic(action$, null, {})).toMatchSnapshot();
  });
});
```

## References

- [https://redux-observable.js.org/docs/recipes/WritingTests.html](https://redux-observable.js.org/docs/recipes/WritingTests.html)
