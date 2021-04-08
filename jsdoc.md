---
title: jsdoc
---

```
sudo npm install -g jsdoc
```

## types

https://github.com/google/closure-compiler/wiki/Types-in-the-Closure-Type-System

## Examples

http://nagyv.github.io/estisia-wall/models.js.html

## Common use

类

```js
/**
 * 数据模型
 * @class
 * @augments Events
 * @param {Object} options
 */
```

类 成员属性

```js
/** @member {Function} */
```

类 成员方法

```js
/**
 * 追加多行
 * @function addRows
 * @memberof DataTable.prototype
 * @param {Function} rows
 */
```

在描述中引用其他类型，并创建连接，点击链接直接跳转到类型定义

```js
类型为{@link HashMap}
```

Promise, and the type of resolved value

```
/**
 * @return {Promise<Dog>}
 */
```

## Support for curried functions

Refs: [https://github.com/jsdoc3/jsdoc/issues/1286#issuecomment-341911947](https://github.com/jsdoc3/jsdoc/issues/1286#issuecomment-341911947)

```js
/**
 * @param {string} fieldName
 * @returns {(event: Event) => void}
 */
const generateInputUpdateHandler = (fieldName) => (event) =>
  this.setState({ [fieldName]: event.target.value });

render(
  <div>
    Name: <Input onChange={generateInputUpdateHandler("name")} />
    Email: <Input onChange={generateInputUpdateHandler("email")} />
  </div>
);
```
