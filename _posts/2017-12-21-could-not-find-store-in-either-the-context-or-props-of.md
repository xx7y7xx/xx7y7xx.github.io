---
layout: post
title: "Invariant Violation: Could not find \"store\" in either the context or props of \"Connect(Users)\". Either wrap the root component in a <Provider>, or explicitly pass \"store\" as a prop to \"Connect(Users)\"."
---

Test failed message:

```
 FAIL  src/App.test.jsx (5.639s)
  ● renders without crashing

    Invariant Violation: Could not find "store" in either the context or props of "Connect(Users)". Either wrap the root component in a <Provider>, or explicitly pass "store" as a prop to "Connect(Users)".

      at invariant (node_modules/invariant/invariant.js:42:15)
      at new Connect (node_modules/react-redux/lib/components/connectAdvanced.js:134:33)
      at constructClassInstance (node_modules/react-dom/cjs/react-dom.development.js:6342:20)
      at updateClassComponent (node_modules/react-dom/cjs/react-dom.development.js:7868:9)
      at beginWork (node_modules/react-dom/cjs/react-dom.development.js:8253:16)
      at performUnitOfWork (node_modules/react-dom/cjs/react-dom.development.js:10244:16)
      at workLoop (node_modules/react-dom/cjs/react-dom.development.js:10308:26)
      at HTMLUnknownElement.callCallback (node_modules/react-dom/cjs/react-dom.development.js:540:14)
      at Object.invokeGuardedCallbackDev (node_modules/react-dom/cjs/react-dom.development.js:579:16)
      at invokeGuardedCallback (node_modules/react-dom/cjs/react-dom.development.js:436:27)
      at renderRoot (node_modules/react-dom/cjs/react-dom.development.js:10386:7)
      at performWorkOnRoot (node_modules/react-dom/cjs/react-dom.development.js:11000:24)
      at performWork (node_modules/react-dom/cjs/react-dom.development.js:10952:7)
      at requestWork (node_modules/react-dom/cjs/react-dom.development.js:10861:7)
      at scheduleWorkImpl (node_modules/react-dom/cjs/react-dom.development.js:10744:11)
      at scheduleWork (node_modules/react-dom/cjs/react-dom.development.js:10706:12)
      at scheduleTopLevelUpdate (node_modules/react-dom/cjs/react-dom.development.js:11177:5)
      at Object.updateContainer (node_modules/react-dom/cjs/react-dom.development.js:11215:7)
      at node_modules/react-dom/cjs/react-dom.development.js:15232:19
      at Object.unbatchedUpdates (node_modules/react-dom/cjs/react-dom.development.js:11086:12)
      at renderSubtreeIntoContainer (node_modules/react-dom/cjs/react-dom.development.js:15231:17)
      at Object.render (node_modules/react-dom/cjs/react-dom.development.js:15296:12)
      at Object.<anonymous> (src/App.test.jsx:7:12)
          at new Promise (<anonymous>)
      at Promise.resolve.then.el (node_modules/p-map/index.js:46:16)
          at <anonymous>
      at process._tickCallback (internal/process/next_tick.js:188:7)

  ✕ renders without crashing (36ms)
```

The test source code:

```js
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import App from './App'

it('render', () => {
  const div = document.createElement('div')
  ReactDOM.render(<App />, div)
})
```

Import redux store will solve this problem

```js
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import { Provider } from 'react-redux'

import App from './App'
import configureStore from './configureStore'

const store = configureStore({})
it('render', () => {
  const div = document.createElement('div')
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    div,
  )
})
```