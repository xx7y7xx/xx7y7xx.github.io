---
layout: post
title: "Error: Not implemented: navigation (except hash changes)"
---

## Error message

Here is the detail error messages, you could see the unittesting is passed, but there is an console error message.

```
 PASS  src/foo.test.js
  ● Console

    console.error node_modules/jsdom/lib/jsdom/virtual-console.js:29
      Error: Not implemented: navigation (except hash changes)
          at module.exports (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/browser/not-implemented.js:9:17)
          at navigateFetch (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/living/window/navigation.js:74:3)
          at exports.navigate (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/living/window/navigation.js:52:3)
          at LocationImpl._locationObjectNavigate (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/living/window/Location-impl.js:29:5)
          at LocationImpl.replace (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/living/window/Location-impl.js:225:10)
          at Location.replace (/Users/chenyang/source/test-repo/node_modules/jsdom/lib/jsdom/living/generated/Location.js:124:25)
          at login (/Users/chenyang/source/test-repo/src/index.js:129:21)
          at /Users/chenyang/source/test-repo/src/foo.js:130:94
          at <anonymous>
          at process._tickCallback (internal/process/next_tick.js:188:7) undefined
```

Here is the source code which introduces this error message.

```
window.location.replace('/login')
```

## Solution A[^1]

When you want to do redirection in the business logic code,
please use `assign()` and `replace()`, instead of `href = '...'`.

```
// not use `window.location.href = url;`
window.location.assign(url);
window.location.replace(url);
```

And in the source code of unittesting,
please mock the `assign()` and `replace()` method.

```
sinon.stub(window.location, 'assign');
sinon.stub(window.location, 'replace');
expect(window.location.assign).to.have.been.calledWith(url);
```

Or, there is another way to mock `assign()` and `replace()` method.

```
window.location.replace = jest.fn()
window.location.assign = jest.fn()
```

At last, here is the full unittesting source code.

```
it('will redirect with a bad route', () => {
    window.location.assign = jest.fn();
    const redirection = shallow(<Redirection />, {
      context: {
        router: {
          location: {
            pathname: '/wubbalubbadubdub',
          },
        },
      },
    });
    expect(window.location.assign).toBeCalledWith(`${CONFIG.APP_LEGACY_ROOT}`);
  });
```

### Read more

You could see, there is two way to change url (redict to another page):

```
// Method (1): Assign the path to `href` property
window.location.href = '/new-page';
// Method (2): Call `assign()` method with the path string param
window.location.assign('/new-page');
```

Here is an article which will tell the difference:

[https://stackoverflow.com/questions/10302905/location-href-property-vs-location-assign-method](https://stackoverflow.com/questions/10302905/location-href-property-vs-location-assign-method)

And here is the performance comparasion: [https://jsperf.com/location-href-vs-location-assign](https://jsperf.com/location-href-vs-location-assign)

## Solution B

[https://github.com/facebook/jest/issues/890#issuecomment-209698782](https://github.com/facebook/jest/issues/890#issuecomment-209698782)

In test code:

```
Object.defineProperty(window.location, 'href', {
  writable: true,
  value: 'some url'
});
```

Be careful this solution is not OK in Jest 22.0.1 and 22.0.6 (maybe not OK after Jest 22.\*)

Try to define `window.location.href` at `config/jest/setupFiles/index.js` file, as:

```
Object.defineProperty(window.location, 'href', {
  writable: true,
  value: 'some url'
});
```

```
 FAIL  src/foo.test.js
  ● Test suite failed to run

    TypeError: Cannot redefine property: href
        at Function.defineProperty (<anonymous>)

      15 | }
      16 |
    > 17 | Object.defineProperty(window.location, 'href', {
      18 |   writable: true,
      19 |   value: 'some url',
      20 | })

      at Object.<anonymous> (config/jest/setupFiles/index.js:17:8)
```

## Some packages could resolve this issue

[https://github.com/simon360/jest-environment-jsdom-global](https://github.com/simon360/jest-environment-jsdom-global)

## Relative issues

- [Error: Not implemented: navigation](https://github.com/jsdom/jsdom/issues/2112)
- [Unable to change window.location using Object.defineProperty](https://github.com/facebook/jest/issues/5124)
- [window.location.href can't be changed in tests.](https://github.com/facebook/jest/issues/890)

## References

[^1]: [https://github.com/jsdom/jsdom/issues/2112#issuecomment-361195043](https://github.com/jsdom/jsdom/issues/2112#issuecomment-361195043)
