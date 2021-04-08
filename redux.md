---
layout: page
title: Redux
---

## Dev tools

- [https://github.com/zalmoxisus/redux-devtools-extension](https://github.com/zalmoxisus/redux-devtools-extension)
- [https://github.com/gaearon/redux-devtools](https://github.com/gaearon/redux-devtools)

## Examples

- [https://github.com/erikras/react-redux-universal-hot-example](https://github.com/erikras/react-redux-universal-hot-example)

## 官网例子

### Real World

[http://redux.js.org/docs/introduction/Examples.html#real-world](http://redux.js.org/docs/introduction/Examples.html#real-world)

组件结构图:

![](https://docs.google.com/drawings/d/1-QkTgSSqYf8aNTCKNHza0b5YqgWtnD97JV1ziDQd1kA/pub?w=960&h=720)

## 实际案例

前后端分离 - [https://www.docstub.com/](https://www.docstub.com/)

## Redux module concept

- [https://github.com/erikras/ducks-modular-redux](https://github.com/erikras/ducks-modular-redux)

## Action

遵循Flux Standard Action(FSA)

- `type`: Required. A string or Symbol indicating the action type.
- `payload`: Optional. Any value or object containing data related to the action.
- `error`: Optional. A boolean that, when true, indicates that the payload is an Error object.
- `meta`: Optional. Any value or object containing data that isn’t part of the payload.

```json
{
    type: 'CONST',
    meta: {
        // Everything in 'meta' will *only* handled by middleware
    },
    payload: {
        // Payload contains all data for use within a reducer
    },
    error: '' // An optional error parameter
}
```

使用https://www.npmjs.com/package/redux-actions 可以节省一些代码工作

## Term

### payload

参照[payload是什么](/2016/10/28/what-is-payload.html)

## How to chain async actions

[https://github.com/reactjs/redux/issues/1676#issuecomment-215413478](https://github.com/reactjs/redux/issues/1676#issuecomment-215413478)

## See also

- [React](react)