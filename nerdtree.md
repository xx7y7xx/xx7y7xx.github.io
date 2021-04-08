---
layout: page
title: nerdtree
---

## tips

- `qa` - Close all files at once, and quit to console.

## Common shortcuts

[https://stackoverflow.com/a/31094402/4685522](https://stackoverflow.com/a/31094402/4685522)

- Select a file, `o` to open this file in current window
- Select a file, `s` to open this file in vertical splitting window
- Select a file, `i` to open this file in horizontal splitting window

## 遗留问题

### 在树状菜单和编辑区域切换的时候标题显示问题

当在树状菜单中时候，标题显示`NERD_tree_1`

当在编辑区域的时候，标题显示当前编辑的文件名，比如`DatePicker.js`

可以使用`Ctrl+W+W`来在两者之前进行切换

但是当如下情况的时候就会出现问题：

1. 当前focus在编辑区，使用`Ctrl+W+W`切换到树状菜单
2. tab标题变成了`NERD_tree_1`
3. 高亮显示`Dropdown.js`，然后按`t`在新的tab页打开该文件
4. 左侧的tab标题仍然是`NERD_tree_1`，右侧tab标题显示为`Dropdown.js`

期待左侧标题显示为`DatePicker.js`