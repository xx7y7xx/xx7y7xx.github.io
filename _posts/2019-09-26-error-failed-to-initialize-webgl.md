---
layout: post
title: "Error: Failed to initialize WebGL"
---

The error message is

```
    Error: Failed to initialize WebGL
        at r._setupPainter (/Users/devin.chenyang/source/hello-world/node_modules/mapbox-gl/src/ui/map.js:1621:38)
        at new _setupPainter (/Users/devin.chenyang/source/hello-world/node_modules/mapbox-gl/src/ui/map.js:360:14)
        at GrabMapsFactory.GrabMaps.componentDidMount (/Users/devin.chenyang/source/hello-world/node_modules/grab-maps/src/map.tsx:303:19)
        at commitLifeCycles (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:17334:22)
        at commitAllLifeCycles (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:18736:7)
        at HTMLUnknownElement.callCallback (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:149:14)
        at invokeEventListeners (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/events/EventTarget-impl.js:193:27)
        at HTMLUnknownElementImpl._dispatch (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/events/EventTarget-impl.js:119:9)
        at HTMLUnknownElementImpl.dispatchEvent (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/events/EventTarget-impl.js:82:17)
        at HTMLUnknownElementImpl.dispatchEvent (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/nodes/HTMLElement-impl.js:30:27)
        at HTMLUnknownElement.dispatchEvent (/Users/devin.chenyang/source/hello-world/node_modules/jsdom/lib/jsdom/living/generated/EventTarget.js:157:21)
        at Object.invokeGuardedCallbackDev (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:199:16)
        at invokeGuardedCallback (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:256:31)
        at commitRoot (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:18948:7)
        at /Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20418:5
        at Object.unstable_runWithPriority (/Users/devin.chenyang/source/hello-world/node_modules/scheduler/cjs/scheduler.development.js:255:12)
        at completeRoot (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20417:13)
        at performWorkOnRoot (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20346:9)
        at performWork (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20254:7)
        at performSyncWork (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20228:3)
        at requestWork (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20097:5)
        at scheduleWork (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:19911:5)
        at scheduleRootUpdate (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20572:3)
        at updateContainerAtExpirationTime (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20600:10)
        at updateContainer (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20657:10)
        at ReactRoot.Object.<anonymous>.ReactRoot.render (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20953:3)
        at /Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:21090:14
        at unbatchedUpdates (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:20459:10)
        at legacyRenderSubtreeIntoContainer (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:21086:5)
        at Object.render (/Users/devin.chenyang/source/hello-world/node_modules/react-dom/cjs/react-dom.development.js:21155:12)
        at Object.render (/Users/devin.chenyang/source/hello-world/src/components/index.test.jsx:51:14)
        at Object.asyncJestTest (/Users/devin.chenyang/source/hello-world/node_modules/jest-jasmine2/build/jasmine_async.js:108:37)
        at resolve (/Users/devin.chenyang/source/hello-world/node_modules/jest-jasmine2/build/queue_runner.js:56:12)
        at new Promise (<anonymous>)
        at mapper (/Users/devin.chenyang/source/hello-world/node_modules/jest-jasmine2/build/queue_runner.js:43:19)
        at promise.then (/Users/devin.chenyang/source/hello-world/node_modules/jest-jasmine2/build/queue_runner.js:87:41)
        at process._tickCallback (internal/process/next_tick.js:68:7)
```

The solution is

```
yarn add -D jest-webgl-canvas-mock
```

Add to jest.config.js

```
module.exports = {
  ....
  setupFiles: [
    'jest-canvas-mock',
    'jest-webgl-canvas-mock',
    '<rootDir>/config/jest/setupFiles'
  ]
  ....
}
```