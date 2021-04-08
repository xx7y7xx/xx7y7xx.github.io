---
layout: page
title: Mobx
---

## Boilerplate

- [https://github.com/mobxjs/mobx-react-boilerplate](https://github.com/mobxjs/mobx-react-boilerplate)

## Examples

- [https://github.com/xxd3vin/mobx-form-ajax-demo](https://github.com/xxd3vin/mobx-form-ajax-demo)

## feature

- Reaction - store发生变化时候触发操作

## Application structure

- **MobX and Flux** vs **MobX and MVC**, [https://github.com/mobxjs/react-particles-experiment](https://github.com/mobxjs/react-particles-experiment)

See also [What is your structure when using Mobx with ReactJS? | reddit](https://www.reddit.com/r/reactjs/comments/4fojit/what_is_your_structure_when_using_mobx_with/)

### example 1

as [https://stackoverflow.com/a/41066941/4685522](https://stackoverflow.com/a/41066941/4685522)

- Stores
  - Domain Stores
  - View Stores
- Models
- Services - make API calls (HTTP request)
- Components
  - Containers
  - Components

## Unit test

- [https://semaphoreci.com/community/tutorials/how-to-test-react-and-mobx-with-jest](https://semaphoreci.com/community/tutorials/how-to-test-react-and-mobx-with-jest)

## Models

比如`TableModel`, `TableRowModel`等，是对常用操作（controller?）的封装。从服务器端获取表格数据，通过

```js
const tableData = new TableModel(resObj);
```

来创建模型实例，然后通过

```js
render() {
  return (
    <SimpleTable data={tableData.toJS()} />
  );
}
```

将数据通过React渲染到UI上。

- model中数据结构应该尽量和前端UI组件一致，而不是和服务器端获取的数据结构一致。

比如[react-mobx-app](https://github.com/xxd3vin/react-mobx-app)这个例子。

## References

- [Best Practices for building large scale maintainable projects](https://mobx.js.org/best/store.html)
- A real world application [xxd3vin/react-mobx-app](https://github.com/xxd3vin/react-mobx-app)