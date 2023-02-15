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
