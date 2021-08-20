---
layout: post
title: 'create-react-app unittest failed: "TypeError: Cannot read property \'parentNode\' of undefined"'
---

In one of my create-react-app I saw this error message when running `yarn test`.

```
    TypeError: Cannot read property 'parentNode' of undefined

      1 | import React from "react";
    > 2 | import { Map, Marker } from "react-bmapgl";
      3 | ^

      at node_modules/react-bmapgl/baiduTongji.js:7:7
      at Object.<anonymous> (node_modules/react-bmapgl/baiduTongji.js:8:3)
      at Object.<anonymous> (node_modules/react-bmapgl/index.js:9:1)
      at Object.<anonymous> (src/Application/BaiduMap.jsx:4:1)
      at Object.<anonymous> (src/Application/helpers.js:1:1)
      at Object.<anonymous> (src/Application/helpers.test.js:1:1)
```

The error indicates my source codes are using this file: `node_modules/react-bmapgl/baiduTongji.js`. File content is:

```js
// node_modules/react-bmapgl/baiduTongji.js
"use strict";
window._hmt = window._hmt || [];
(function () {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b97569d26a525941d8d163729d284198";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
```

I am using Baidu Map in my [Photo Map](https://github.com/photo-map/photo-map.github.io) project, `BaiduMap.jsx` is something like:

```js
// BaiduMap.jsx
import React from "react";
import { Map, Marker } from "react-bmapgl"; // this import will call `node_modules/react-bmapgl/baiduTongji.js`
export const KEY = "foo";
class BaiduMap extends React.Component {
  render() {
    return (
      <div>
        <h1>Baidu Map:</h1>
        <Map>
          <Marker position={{ lng: 116.402544, lat: 39.928216 }} />
        </Map>
      </div>
    );
  }
}
```

Then one `helpers.js` try to import `KEY` in `BaiduMap.jsx`

```js
// helpers.js
import { KEY } from "BaiduMap.jsx";
export const convert = () => {};
```

At last I try to do some unittests in `helpers.test.js`

```js
// helpers.test.js
import { convert } from "./helpers.js";
test("convert should return proper value", () => {
  expect(convert()).toEqual([]);
});
```

After checking the document of create-react-app [https://create-react-app.dev/docs/running-tests/](https://create-react-app.dev/docs/running-tests/),
I found the root cause: This is a `react-bmapgl` code running in a create-react-app project. Even the Jest runs in `jsdom` env, but because there is no `<script>` in DOM, so the following code in `react-bmapgl` runs failed.

I know this is a fault of `react-bmapgl` which should not run some analytics code when import this module. But I also should not test my map component in `helper.test.js`.

So the workaround would be that I try to avoid directly/indirectly importing `BaiduMap.jsx` file in `helper.test.js` or other test files.

So I move the `KEY` out of `Baidu.jsx` to a `constants.js` file.

```js
// constants.js
export const KEY = "foo";
```

So my `helpers.test.js` will not import `react-bmapgl`, then problem solved.

But then I have another idea: how about mock a `<script>` tag to bypass this issue of `react-bmapgl`.

So I changed `node_modules/react-bmapgl/baiduTongji.js` file, add something like below to create a `<script>` tag in `<body>`.

```js
document.body.appendChild(document.createElement("script"));
```

But then I have another error and harder to resolve.

```
    TypeError: Cannot read property 'save' of null

      1 | import React from "react";
    > 2 | import { Map, Marker } from "react-bmapgl";
      3 | ^

      at jg (node_modules/mapvgl/dist/mapvgl.min.js:54:503)
      at node_modules/mapvgl/dist/mapvgl.min.js:577:343
      at node_modules/mapvgl/dist/mapvgl.min.js:3:72
      at Object.<anonymous> (node_modules/mapvgl/dist/mapvgl.min.js:3:175)
      at Object.<anonymous> (node_modules/react-bmapgl/Layer/MapvglView.js:11:16)
      at Object.<anonymous> (node_modules/react-bmapgl/index.js:40:20)
      at Object.<anonymous> (src/Application/BaiduMap.jsx:3:1)
      at Object.<anonymous> (src/Application/helpers.test.js:2:1)

  console.error
    Error: Not implemented: HTMLCanvasElement.prototype.getContext (without installing the canvas npm package)
        at module.exports (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/jsdom/lib/jsdom/browser/not-implemented.js:9:17)
        at HTMLCanvasElementImpl.getContext (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/jsdom/lib/jsdom/living/nodes/HTMLCanvasElement-impl.js:42:5)
        at HTMLCanvasElement.getContext (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/jsdom/lib/jsdom/living/generated/HTMLCanvasElement.js:131:58)
        at ig (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/mapvgl/dist/mapvgl.min.js:54:349)
        at jg (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/mapvgl/dist/mapvgl.min.js:54:477)
        at /Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/mapvgl/dist/mapvgl.min.js:577:343
        at /Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/mapvgl/dist/mapvgl.min.js:3:72
        at Object.<anonymous> (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/mapvgl/dist/mapvgl.min.js:3:175)
        at Runtime._execModule (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/jest-runtime/build/index.js:1299:24)
        at Runtime._loadModule (/Users/foobar2000/source/github/photo-map/photo-map.github.io/node_modules/jest-runtime/build/index.js:898:12) undefined

      at VirtualConsole.on.e (node_modules/jsdom/lib/jsdom/virtual-console.js:29:45)
      at module.exports (node_modules/jsdom/lib/jsdom/browser/not-implemented.js:12:26)
      at HTMLCanvasElementImpl.getContext (node_modules/jsdom/lib/jsdom/living/nodes/HTMLCanvasElement-impl.js:42:5)
      at HTMLCanvasElement.getContext (node_modules/jsdom/lib/jsdom/living/generated/HTMLCanvasElement.js:131:58)
      at ig (node_modules/mapvgl/dist/mapvgl.min.js:54:349)
      at jg (node_modules/mapvgl/dist/mapvgl.min.js:54:477)
```

So let's go back to check the Jest document again: [https://create-react-app.dev/docs/running-tests/](https://create-react-app.dev/docs/running-tests/)
So the correct way is not test your code with BMapGL in Jest, but use a separate tool for browser end-to-end tests.

Final solution is changing project unittest source to avoid importing source code which importing `react-bmapgl` because we only want to do unittest, not a UI test.

## See also

- [/dev/bmapgl/create-react-app.html](/dev/bmapgl/create-react-app.html)
