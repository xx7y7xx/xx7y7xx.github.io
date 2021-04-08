---
layout: post
title: "Error: Not implemented: HTMLCanvasElement.prototype.getContext (without installing the canvas npm package)"
---

Error

```
  console.error node_modules/jsdom/lib/jsdom/virtual-console.js:29
    Error: Not implemented: HTMLCanvasElement.prototype.getContext (without installing the canvas npm package)
        at module.exports (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/browser/not-implemented.js:9:17)
        at HTMLCanvasElementImpl.getContext (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/nodes/HTMLCanvasElement-impl.js:42:5)
        at HTMLCanvasElement.getContext (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/generated/HTMLCanvasElement.js:50:45)
        at r.getContext [as _setupPainter] (/Users/devin.chenyang/source/hello-world/node_modules/mapbox-gl/src/ui/map.js:1617:33)
        at new _setupPainter (/Users/devin.chenyang/source/hello-world/node_modules/mapbox-gl/src/ui/map.js:360:14)
        at GrabMapsFactory.GrabMaps.componentDidMount (/Users/devin.chenyang/source/hello-world/node_modules/grab-maps/src/map.tsx:303:19)
        at commitLifeCycles (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:17334:22)
        at commitAllLifeCycles (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:18736:7)
        at HTMLUnknownElement.callCallback (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:149:14)
        at invokeEventListeners (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/events/EventTarget-impl.js:193:27) undefined
```

According to [this](https://github.com/hustcc/jest-canvas-mock/issues/2#issuecomment-500307391){:target="_blank"} and [this](https://github.com/jsdom/jsdom/issues/1782#issuecomment-362193888){:target="blank"} solution, first install [jest-canvas-mock](https://github.com/hustcc/jest-canvas-mock){:target="_blank"} first.

```
yarn add -D jest-canvas-mock
```

Then add below config in `jest.config.js`.

```
module.exports = {
  ...
  setupFiles: [
    'jest-canvas-mock',
    '<rootDir>/config/jest/setupFiles'
  ]
  ...
}
```