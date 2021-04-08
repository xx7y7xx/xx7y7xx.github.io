---
layout: post
title: "react-dock的<Dock>组件遮挡住了react-bootstrap的<Modal>组件"
---

在项目开发中，遇到了react-dock的`<Dock>`组件遮挡住了react-bootstrap的`<Modal>`组件的问题，如下是解决方案。

## 现象

![](/attchments/react/screenshot_20170510_003.jpg)

![](/attchments/react/screenshot_20170517_003.jpg)

## 原因

根节点

```
<div style="position: fixed; width: 0px; height: 0px; top: 0px; left: 0px; z-index: 99999999;">
```

默认值为`99999999`

```
  static defaultProps = {
    position: 'left',
    zIndex: 99999999,
    fluid: true,
    defaultSize: 0.3,
    dimMode: 'opaque',
    duration: 200
  }
```

但是

```
<div role="dialog" tabindex="-1" class="fade in modal">
```

```
.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1050;
    display: none;
    overflow: hidden;
    -webkit-overflow-scrolling: touch;
    outline: 0;
}
```

所以需要通过修改react-dock的`zIndex`参数来设置比`1050`小的值，或者通过css提高modal的`z-index`