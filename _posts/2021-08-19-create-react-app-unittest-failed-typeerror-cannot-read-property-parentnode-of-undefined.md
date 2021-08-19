---
layout: post
title: 'create-react-app unittest failed: "TypeError: Cannot read property 'parentNode' of undefined"'
---

See this error message when running `yarn test`.

```
$ react-scripts test
FAIL src/Application/MenuDrawer/helpers.test.js
  ● Test suite failed to run

    TypeError: Cannot read property 'parentNode' of undefined

      1 | import React from "react";
    > 2 | import { Map, Marker } from "react-bmapgl";
      3 | ^

      at node_modules/react-bmapgl/baiduTongji.js:7:7
      at Object.<anonymous> (node_modules/react-bmapgl/baiduTongji.js:8:3)
      at Object.<anonymous> (node_modules/react-bmapgl/index.js:9:1)
      at Object.<anonymous> (src/Application/Map/BaiduMap/index.jsx:4:1)
      at Object.<anonymous> (src/Application/Map/index.jsx:18:1)
      at Object.<anonymous> (src/Application/Map/AMap/index.jsx:6:1)
      at Object.<anonymous> (src/Application/MenuDrawer/FolderList.jsx:6:1)
      at Object.<anonymous> (src/Application/MenuDrawer/helpers.js:1:1)
      at Object.<anonymous> (src/Application/MenuDrawer/helpers.test.js:1:1)

PASS src/Application/utils/utils.test.js

Test Suites: 1 failed, 1 skipped, 1 passed, 2 of 3 total
Tests:       1 skipped, 1 passed, 2 total
Snapshots:   0 total
Time:        3.751 s
Ran all test suites.
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
Error: Process completed with exit code 1.
```

The error indicates my source codes are using this file: `node_modules/react-bmapgl/baiduTongji.js`. File content is:

```js
"use strict";
window._hmt = window._hmt || [];
(function () {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b97569d26a525941d8d163729d284198";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
```

I am using Baidu Map in my [Photo Map](https://github.com/photo-map/photo-map.github.io) project, `BaiduMap/index.jsx` is something like:

```js
import React from "react";
import { Map, Marker } from "react-bmapgl"; // this import will call `node_modules/react-bmapgl/baiduTongji.js`
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

After checking the document of create-react-app [https://create-react-app.dev/docs/running-tests/](https://create-react-app.dev/docs/running-tests/),
I found the root cause is that tests always run in a Node environment and not in a real browser. So there is no `<script>` tag.

I know this is fault of `react-bmapgl` which should not run some analytics code when import this module. But I also don't want to test my map component in `helper.test.js`.

So the workaround would be that I try to avoid importing `BaiduMap/index.jsx` file in `helper.test.js` or other test files.
