---
layout: post
title: Using Javascript to change the sub properties of HTML tag's style property
---

## Remove/Reset a sub property of style property

```html
<div id="panel" style="overflow: hidden; display: block; "></div>
```

```js
var htmlElement = document.getElementById("panel");

// Method (1): Not cross browsers
htmlElement.style.overflow = null;

// Method (2): Cross browsers
htmlElement.style.overflow = "";
```

[http://stackoverflow.com/a/21662984/4685522](http://stackoverflow.com/a/21662984/4685522)