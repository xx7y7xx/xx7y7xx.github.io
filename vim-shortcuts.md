---
layout: page
title: Vim keyboard shortcuts
---

## built-in

## Plugins

### NERD Tree

`:NERDTree` 打开左侧面板

`?` 打开/关闭帮助

<kbd>Ctrl</kbd>-<kbd>w</kbd><kbd>w</kbd> 在左侧面板和右侧编辑器之间切换。或者使用<kbd>Ctrl</kbd>-<kbd>w</kbd>（moves between vim viewports）然后使用<kbd>&larr;</kbd>或者<kbd>&rarr;</kbd>来左右切换。

当光标落在左侧面板中某个文件上时候：

<kbd>o</kbd> 在当前标签页打开该文件

<kbd>t</kbd> 在新标签页打开该文件，光标聚焦到新打开的文件

<kbd>T</kbd> 在新标签页打开该文件，光标位置保持不变

<kbd>g</kbd><kbd>t</kbd> 跳转到下一个（右侧）的标签页

<kbd>g</kbd><kbd>T</kbd> 跳转到上一个（左侧）的标签页

<kbd>R</kbd> 刷新当前面板（比如在另外一个terminal中创建或者删除文件，但是面板不会自动刷新）

当在新的标签页打开一个文件的时候，NERD Tree不会自动打开（也就是NERD Tree不会始终显示），可以使用`:NERDTreeMirror`加载之前已经打开的面板的镜像（mirror）。介绍一下区别，如果在已经打开一个面板的情况下，使用`:NERDTree`在新的标签页又打开了一个面板，使用<kbd>R</kbd>只能刷新当前面板；如果是镜像，则刷新了一个面板，其他mirror都会跟着更新。

如果不小心在当前标签页打开了另外一个文件，可以使用<kbd>Ctrl</kbd>-<kbd>^</kbd>（相当于`:e#`）切换到之前打开的文件。

### letientai299/vim-react-snippets

(in insert mode)

- `rcx<Tab>` React component definition code block

## See also

- [Vim](/vim.html)