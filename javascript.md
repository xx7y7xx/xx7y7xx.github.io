---
layout: page
title: JavaScript
---

## es2015 static class properties, es2016 property initializer syntax

[https://babeljs.io/docs/plugins/transform-class-properties/#example](https://babeljs.io/docs/plugins/transform-class-properties/#example)

## ES2016 Property initializer syntax, ES2015 Static class properties

```js
class Bork {
  // ES2016 Property initializer syntax
  instanceProperty = "bork";
  boundFunction = () => {
    return this.instanceProperty;
  }

  // ES2015 Static class properties
  static staticProperty = "babelIsCool";
  static staticFunction = function() {
    return Bork.staticProperty;
  }
}

let myBork = new Bork;

//Property initializers are not on the prototype.
console.log(myBork.prototype.boundFunction); // > undefined

//Bound functions are bound to the class instance.
console.log(myBork.boundFunction.call(undefined)); // > "bork"

//Static function exists on the class.
console.log(Bork.staticFunction()); // > "babelIsCool"
```

## class

### Prototype methods

```js
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  
  get area() {
    return this.calcArea();
  }

  calcArea() {
    return this.height * this.width;
  }
}

const square = new Rectangle(10, 10);

console.log(square.area);
```

### Static methods

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  static distance(a, b) {
    const dx = a.x - b.x;
    const dy = a.y - b.y;

    return Math.sqrt(dx*dx + dy*dy);
  }
}

const p1 = new Point(5, 5);
const p2 = new Point(10, 10);

console.log(Point.distance(p1, p2));
```

[babel repl](https://babeljs.io/repl/#?babili=false&evaluate=true&lineWrap=false&presets=es2015%2Cstage-0&targets=&browsers=&builtIns=false&debug=false&code=class%20A%20%7B%0A%20%20constructor()%20%7B%0A%20%20%20%20this.foo%3D'bar'%3B%0A%20%20%7D%0A%20%20prototypeMethod()%20%7B%0A%20%20%20%20%0A%20%20%7D%0A%20%20b%20%3D%20()%20%3D%3E%20%7B%0A%20%20%20%20%0A%20%20%7D%0A%20%20c%20%3D%201%3B%0A%20%20static%20staticMethod()%20%7B%0A%20%20%20%20%0A%20%20%7D%0A%7D%0A%0AA.z%20%3D%20()%20%3D%3E%20%7B%0A%20%20%0A%7D%0A%0Avar%20instance%20%3D%20new%20A()%3B%0A%0Aconsole.log(A.staticMethod)%3B%20%2F%2F%20%3E%20Function%0Aconsole.log(A.prototypeMethod)%3B%20%2F%2F%20%3E%20undefined%0Aconsole.log(instance.staticMethod)%3B%20%2F%2F%20%3E%20undefined%0Aconsole.log(instance.prototypeMethod)%3B%20%2F%2F%20%3E%20Function)

## literal notation

```js
var o = {a: 'foo', b: 42, c: {}};
```

## safari

[How do you disable viewport zooming on Mobile Safari?](https://stackoverflow.com/a/4389976)

```
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
```

## js libs

### WYSIWYG editor

- [https://github.com/quilljs/quill/](https://github.com/quilljs/quill/) [https://github.com/zenoamaro/react-quill](https://github.com/zenoamaro/react-quill)
- [https://github.com/facebook/draft-js](https://github.com/facebook/draft-js)

## JavaScript Features Test Cases

[https://github.com/tc39/test262](https://github.com/tc39/test262)

[https://github.com/tc39/test262/blob/master/test/built-ins/Array/length/15.4.5.1-3.d-1.js](https://github.com/tc39/test262/blob/master/test/built-ins/Array/length/15.4.5.1-3.d-1.js)

