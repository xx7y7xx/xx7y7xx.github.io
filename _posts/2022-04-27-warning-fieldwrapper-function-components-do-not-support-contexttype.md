---
layout: post
title: "Warning: Foo: Function components do not support contextType."
---

Error:

```
Warning: Foo: Function components do not support contextType.
```

Code:

```js
import React, { useContext } from "react";
import FooContext from "./FooContext";
export default function Foo(props) {
  const { foo } = useContext(FooContext);
  return <div>{foo}</div>;
}
Foo.contextType = FooContext;
```

Solution:

Remove `Foo.contextType = FooContext;` when using `useContext`.

## References

- Other possible solution: https://stackoverflow.com/questions/54466449/function-components-do-not-support-contexttype
