---
layout: page
title: retejs
permalink: /dev/retejs.html
---

## Control


```js
export default class CodeBoxControl extends Rete.Control {
  static component = (props) => {
    return <div>test1</div>
  }
  // DON'T use `render` function, it will override the original render function
  // render () {
  //   return <div>test2</div>
  // }
}
```

## Remove all nodes and connections

```js
editor.clear();
```

## Control

### How to get node in control

Node is the parent of control.

```js
class InputControl extends Rete.Control {
  constructor(emitter, key) {
    // not ready
    console.log(this.parent); // null
  }
  
  handleChange(val) {
    console.log(this.parent); // Node {name:"",id:1}
  }
}
```

### How to get data and save data in control

```js
class InputControl extends Rete.Control {
  handleChange(val) {
    // this.key is the current control key
    console.log('old val:', this.getData(this.key)); // old val: 1
    this.setData(this.key, 2); // new val: 2
  }
}
```
