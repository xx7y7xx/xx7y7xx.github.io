---
layout: page
title: eslint
---

## install eslint for empty project

```
npm init
npm install eslint --save-dev
./node_modules/.bin/eslint --init
```

> ? How would you like to configure ESLint? Use a popular style guide
> ? Which style guide do you want to follow? Airbnb
> ? Do you use React? No
> ? What format do you want your config file to be in? JSON

## Ignore global vars

### in dir

`.eslintrc`

```json
{
  "globals": {
    "React": false,
    "ReactDOM": false
  }
}
```

### in file

```js
/* global $ */
```

To specify globals using a comment inside of your JavaScript file, use the following format:

```
/* global var1, var2 */
```

This defines two global variables, `var1` and `var2`. If you want to optionally specify that these global variables should never be written to (only read), then you can set each with a false flag:

```
/* global var1:false, var2:false */
```

## Disable rules

### in current line

disable special rules in current line

```js
import { AppContainer } from 'react-hot-loader'; // eslint-disable-line import/no-extraneous-dependencies
```

disable special rules in next line

```js
// eslint-disable-next-line import/no-extraneous-dependencies
import { AppContainer } from 'react-hot-loader';
```

### in current file

To disable rule warnings in an entire file, put a `/* eslint-disable */` block comment at the top of the file:

```js
/* eslint-disable no-alert, on-console */

alert('foo');
```

Disable all rules in current file:

```js
/* eslint-disable */
```

### in dir

`.eslintrc`

```json
{
  "rules": {
    "no-alert": 0,
    "no-console": 0
  }
}
```

## 'react-hot-loader' should be listed in the project's dependencies, not devDependencies. (import/no-extraneous-dependencies)


[http://ithelp.ithome.com.tw/articles/10185739](http://ithelp.ithome.com.tw/articles/10185739)

## phantomjs

example project [https://github.com/xx7y7xx/login-take-snapshot](https://github.com/xx7y7xx/login-take-snapshot)

```json
{
    "extends": "airbnb-base",
    "plugins": [
      "import"
    ],
    "env": {
        "phantomjs": true
    },
    "settings": {
        "import/core-modules": [
            "webpage"
        ]
    }
}
```

## See also

- [Setup eslint for a new project](/2017/07/19/setup-eslint-for-a-new-project.html)