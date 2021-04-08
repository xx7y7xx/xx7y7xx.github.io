---
layout: page
title: vim
---

## Leader key

Default is <kbd>\</kbd> (backslash).

Be aware that when you do press your `<leader>` key you have only 1000ms (by default) to enter the command following it. 

## Omni completion

Vim自带的自动完成 http://vim.wikia.com/wiki/Omni_completion

<kbd>Ctrl</kbd>-<kbd>x</kbd><kbd>Ctrl</kbd>-<kbd>o</kbd>

## Node.vim

[https://github.com/moll/vim-node](https://github.com/moll/vim-node)

<kbd>g</kbd><kbd>f</kbd> 打开node module文件

```
require(".")
```

<kbd>ctrl</kbd> + <kbd>^</kbd> 跳转回上一个文件。

## tern

| Shortcut | Command | Description |
|---|---|---|
| `<Leader>` <kbd>t</kbd><kbd>d</kbd> | `:TernDoc` | Documentation under cursor |
| `<Leader>` <kbd>t</kbd><kbd>b</kbd> | `:TernDocBrowse` | Browse documentation |
| `<Leader>` <kbd>t</kbd><kbd>t</kbd> | `:TernType` | Type hints |
| `<Leader>` <kbd>t</kbd><kbd>d</kbd> | `:TernDef` | Jump to definition (yes, 'td' is duplicated) |
| `<Leader>` <kbd>t</kbd><kbd>p</kbd><kbd>d</kbd> | `:TernDefPreview` | Jump to definition inside preview |
| `<Leader>` <kbd>t</kbd><kbd>s</kbd><kbd>d</kbd> | `:TernDefSplit` | Definition in new split |
| `<Leader>` <kbd>t</kbd><kbd>t</kbd><kbd>d</kbd> | `:TernDefTab` | Definition in new tab |
| `<Leader>` <kbd>t</kbd><kbd>r</kbd> | `:TernRefs` | All references under cursor |
| `<Leader>` <kbd>t</kbd><kbd>R</kbd> | `:TernRename` | Rename variable |

## Vim distribution

http://krampstudio.com/webvim/

## Copy and paste

| Command 1 | Command 2 | Command 3 | Description |
|---|---|---|---|
|       |       | `"*yy` | yank current line to `*` register which is the clipboard ( to paste ) |
| `:y+` |       |        | yank current line to paste |
|       | `"+y` | `"*y`  | yank visual area into paste buffer |
|       | `"+p` | `"*p`  | insert from paste buffer |

See [Registers](#registers) for more details.

refs:
- [How to copy selected lines to clipboard in vim - Stack Overflow](https://stackoverflow.com/a/9166363/4685522)

## save file

F2 to save

```
inoremap <F2> <c-o>:w<cr>
```

## Install plugins

`:Helptags` to update document, `:help editconfig` to show help for editconfig plugin.

### example

[https://github.com/xxd3vin/env/tree/master/.vim/bundle](https://github.com/xxd3vin/env/tree/master/.vim/bundle)

[https://github.com/xxd3vin/env/blob/master/README.md#install-new-vim-plugin](https://github.com/xxd3vin/env/blob/master/README.md#install-new-vim-plugin)

### suggest plugin list

- vue [https://github.com/posva/vim-vue](https://github.com/posva/vim-vue)

## Registers

To access a register, type `"a` before any command ( `a` is the register name ).

For example, `"*yy` will copy the current line to register `*` ( which is the clipboard ).

refs:
- [How do I use vim registers? - Stack Overflow](https://stackoverflow.com/a/1498026/4685522)

## Searching tips

### copy text and search

1. `v` to select text
2. `y` to yank to register `0`
3. `/` to search
4. `Ctrl+R` then type the register name `0`, to paste the result

### Search insensitive

When you search in vim using `/`, e.g. `/foo`, the `Foo` will not match. Because the default search is case sensitive.

By using `/\cfoo` or `/foo\c` (A `\c` escape sequence), that could match both `Foo` and `foo`.

[https://stackoverflow.com/a/2287449/4685522](https://stackoverflow.com/a/2287449/4685522)

A better solution is to use `smartcase`.

```
:set ignorecase
:set smartcase
```

If you search for something containing uppercase characters, it will do a case sensitive search; if you search for something purely lowercase, it will do a case insensitive search.

[https://stackoverflow.com/a/2288438/4685522](https://stackoverflow.com/a/2288438/4685522)

Another solution is use case insensitive by default (`:set ignorecase`), and use `\C` to make a case sensitive search.

## list all known file type

Type `:setfiletype` (with a space afterwards), then press `Ctrl-d`.

[https://vi.stackexchange.com/a/5782](https://vi.stackexchange.com/a/5782)

## find what filetype is loaded in vim

```
:set filetype?
```

[https://stackoverflow.com/a/2779390/4685522](https://stackoverflow.com/a/2779390/4685522)

## compare plugins

- Command-T v/s Ctrlp.vim v/s FuzzyFinder

## buffers, windows and tabs

[https://sanctum.geek.nz/arabesque/buffers-windows-tabs/](https://sanctum.geek.nz/arabesque/buffers-windows-tabs/)

[http://vim.wikia.com/wiki/Using_tab_pages](http://vim.wikia.com/wiki/Using_tab_pages)

Open a new tab without giving filename `:tabedit`

Open a new tab and give a filename `:tabedit foo.js`

## See also

- [Vim keyboard shortcuts](/vim-shortcuts.html)
- [neovim](/neovim.html)

## References

- http://vimawesome.com/