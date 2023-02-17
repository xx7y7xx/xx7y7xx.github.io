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

## How to get node in control

Node is the parent of control.

```
export default class InputControl extends Rete.Control {
  constructor(emitter, key) {
    // not ready
    console.log(this.parent); // null
  }
  
  handleChange(val) {
    console.log(this.parent); // Node {name:"",id:1}
  }
}
```
