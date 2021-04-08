---
layout: page
title: react-ga
---

see errors "ReactGA.initialize must be called first or GoogleAnalytics should be loaded manually"

```
 PASS  src/index.test.js
  ● Console

    console.warn node_modules/react-ga/dist/react-ga.js:110
      [react-ga] ReactGA.initialize must be called first or GoogleAnalytics should be loaded manually
    console.warn node_modules/react-ga/dist/react-ga.js:110
      [react-ga] ReactGA.initialize must be called first or GoogleAnalytics should be loaded manually
    console.warn node_modules/react-ga/dist/react-ga.js:110
      [react-ga] ReactGA.initialize must be called first or GoogleAnalytics should be loaded manually

 PASS  src/pages.test.js
```

modify `index.test.js` file, add a `react-ga` mock

```
jest.mock('react-ga')
```

## `event` method

```
ReactGA.event({
  category: 'React Component',
  label: 'UserTable',
  action: 'componentDidMount'
})
```
