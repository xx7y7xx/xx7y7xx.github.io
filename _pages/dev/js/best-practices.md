---
layout: page
title: Javascript best practice
permalink: /dev/js/best-practices.html
---

## Weird import chain

Some bad import chain will cause error when testing with Jest which by default runs in `jsdom` env which is not a real browser envionment.

```
at node_modules/react-bmapgl/baiduTongji.js:7:7
at Object.<anonymous> (node_modules/react-bmapgl/baiduTongji.js:8:3)
at Object.<anonymous> (node_modules/react-bmapgl/index.js:9:1)
at Object.<anonymous> (src/BaiduMap.jsx:4:1)
at Object.<anonymous> (src/helpers.js:1:1)
at Object.<anonymous> (src/helpers.test.js:1:1)
```

```js
// helpers.test.js
import { convert } from "./helpers.js";
test("convert should return proper value", () => {
  expect(convert()).toEqual([]);
});
```

```js
// helpers.js
import { KEY } from "./BaiduMap.jsx";
export const convert = () => {};
```

```js
// BaiduMap.jsx
import { Map } from "react-bmapgl";
export const KEY = "foobar2000";
```

```js
// node_modules/react-bmapgl/baiduTongji.js
(function () {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b97569d26a525941d8d163729d284198";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
```

In `helpers.test.js` we really don't want to do a UI test, but only want to test `convert`.
But because this bad import chain, we import `react-bmapgl` indirectly.
And unfortunately there is a bug in `react-bmapgl` source code which calls `parentNode` before checking existing of `s`. (`react-bmapgl` assumes the envionment already is a browser)

Solution is moving `KEY` from `BaiduMap.jsx` to another `contants.js` file.

## See also

- [https://github.com/xx7y7xx/examples/tree/main/nodejs/js-api-tests](https://github.com/xx7y7xx/examples/tree/main/nodejs/js-api-tests)
