---
layout: post
title: "TypeError: Cannot read property '_location' of null"
---

## Error

When `yarn test`

```jsx
it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    div
  );
  ReactDOM.unmountComponentAtNode(div);
});
```

Error message

```
 PASS  src/redux/modules/repos.test.js
 PASS  src/App.test.js

Test Suites: 2 passed, 2 total
Tests:       2 passed, 2 total
Snapshots:   0 total
Time:        1.319s
Ran all test suites related to changed files.

Watch Usage
 › Press a to run all tests.
 › Press p to filter by a filename regex pattern.
 › Press t to filter by a test name regex pattern.
 › Press q to quit watch mode.
 › Press Enter to trigger a test run.
/Users/chenyang/source/xxd3vin/redux-observable-demos/node_modules/jsdom/lib/jsdom/browser/Window.js:148
      return idlUtils.wrapperForImpl(idlUtils.implForWrapper(window._document)._location);
                                                                              ^

TypeError: Cannot read property '_location' of null
    at Window.get location [as location] (/Users/chenyang/source/xxd3vin/redux-observable-demos/node_modules/jsdom/lib/jsdom/browser/Window.js:148:79)
    at Timeout.callback [as _onTimeout] (/Users/chenyang/source/xxd3vin/redux-observable-demos/node_modules/jsdom/lib/jsdom/browser/Window.js:525:41)
    at ontimeout (timers.js:471:11)
    at tryOnTimeout (timers.js:306:5)
    at Timer.listOnTimeout (timers.js:266:5)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```

This is because I use `axios` in Redux

```js
export const reposEpic = action$ =>
  action$.ofType(LOAD)
    .mergeMap((action) => {
      return axios.get(`https://api.github.com/users/${action.payload.name}/repos?${Math.random()}`)
    })
    .map(loadSuccess)
```

## Solution

Delay the end of testing.

```js
it('renders without crashing', (done) => {
  const div = document.createElement('div');
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    div
  );
  ReactDOM.unmountComponentAtNode(div);
  setTimeout(() => {
    done();
  }, 3000)
});
```

## References

- [https://github.com/jsdom/jsdom/issues/2121](https://github.com/jsdom/jsdom/issues/2121)