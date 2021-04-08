---
permalink: /dev/rematch.html
title: rematch
layout: page
---

```js
handleChange = (event) => {
  const inputValue = event.target.value
  // setValue is in the reduces of rematch
  this.props.setValue(inputValue)
  // output: true
  console.log('Will be the same:', inputValue === this.props.value)
}
```
