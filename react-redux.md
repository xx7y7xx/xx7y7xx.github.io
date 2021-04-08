---
layout: page
title: react-redux
---

## Pages(Containers)

```
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { withRouter } from 'react-router'
import { connect } from 'react-redux'
import { compose } from 'redux'

const propTypes = {
  // Passing from react-router
  match: PropTypes.object.isRequired,
  location: PropTypes.object.isRequired,
  history: PropTypes.object.isRequired,
}

const defaultProps = {}

export class Books extends Component {
  render () {
    return (
      <div>Page content</div>
    )
  }
}

Books.propTypes = propTypes
Books.defaultProps = defaultProps

const mapStateToProps = state => ({
  books: getBooksFromSelectors(state)
})

const mapStateToDispatch = dispatch => ({
  // getBooks: bindActionCreators(getBooks, dispatch)
})

export default compose(
  withRouter,
  connect(
    mapStateToProps,
    mapStateToDispatch
  )
)(Books)
```

## Unit testing

Source: [https://github.com/airbnb/enzyme/issues/1002#issuecomment-421535999](https://github.com/airbnb/enzyme/issues/1002#issuecomment-421535999)

### Case 1

```
const wrapper = shallow(
  <ConnectedComponent />,
  { context: { store } }
).dive();

const wrapper = shallow(
  <Provider store={store}>
    <ConnectedComponent />
  </Provider>
).dive({ context: { store } }).dive();

const wrapper = shallow(
  <ConnectedComponent store={store} />,
).dive();
```

### Case 2

```
import React, { Component } from 'react'
import { Provider } from 'react-redux'
import UserListPage from 'src/UserListPage.jsx'
import configureStore from 'src/configureStore.js'

const state = {
  userManagement: {
    user: {
      loading: false,
      data: []
    }
  }
}
const store = configureStore(state)

export default class App extends Component {
  render () {
    return (
      <Provider store={store}>
        <UserListPage />
      </Provider>
    )
  }
}
```

`src/configureStore.js`
```
import { applyMiddleware, compose, createStore } from 'redux'
import thunkMiddleware from 'redux-thunk'

import monitorReducersEnhancer from './enhancers/monitorReducers'
import loggerMiddleware from './middleware/logger'
import rootReducer from './reducers'

export default function configureStore(preloadedState) {
  const middlewares = [loggerMiddleware, thunkMiddleware]
  const middlewareEnhancer = applyMiddleware(...middlewares)

  const enhancers = [middlewareEnhancer, monitorReducersEnhancer]
  const composedEnhancers = compose(...enhancers)

  const store = createStore(rootReducer, preloadedState, composedEnhancers)

  return store
}
```

## redux with react ref

The widget connected to a redux state

```
export class Widget extends Component {
}
...
export default connect(
  mapStateToProps,
  mapDispatchToProps,
  mergeProps,
  {
    withRef: true
  }
)(Widget)
```

The parent of widget

```
export class Parent extends Component {
  constructor (props) {
    super(props)
    this.widget = React.createRef()
  }
  handleFinish = () => {
    // clear is a public method in `Widget`
    this.widget.current.getWrappedInstance().clear()
  }
  render () {
    return (
        <PoiTaskWidget
          ref={this.widget}
          onFinish={this.handleFinish}
        />
    )
  }
}
```

## See also

- [Redux](/redux.html)