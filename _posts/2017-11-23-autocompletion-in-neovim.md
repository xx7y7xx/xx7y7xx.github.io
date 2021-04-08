---
layout: post
title: autocompletion in neovim
---

## prepare

```
npm install -g tern
```

## install plugins

`~/.config/nvim/init.vim`

```
" asynchronous keyword completion system
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" tern_for_vim is a Vim plugin that provides Tern-based JavaScript editing support.
" And Tern is a stand-alone code-analysis engine for JavaScript.
" DEPENDENCY:
" - https://www.npmjs.com/package/tern need to global install
"   ```
"   npm install -g tern
"   ```
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
```

## config plugins

`~/.config/nvim/init.vim`

```
"===============================================================================
" Plugin: deoplete.nvim
" https://github.com/Shougo/deoplete.nvim
"===============================================================================

" WHY 通过调用函数的方式，无法启用自动补全功能，但是如果在vim里面再次source
" init.vim的话，则会出现关键字推荐的下拉菜单。
" 如果使用全局变量的方式来启动，则没有问题，这是为什么呢？
"call deoplete#enable()
let g:deoplete#enable_at_startup = 1

" How do you actually choose from the autocomplete options effectively? https://github.com/Shougo/deoplete.nvim/issues/302
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"===============================================================================
" Omni completion - Omni completion provides smart autocompletion for programs.
" http://vimdoc.sourceforge.net/htmldoc/version7.html
" http://vim.wikia.com/wiki/Omni_completion
"===============================================================================

"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"===============================================================================
" Plugin: tern_for_vim
" https://github.com/ternjs/tern_for_vim
" https://github.com/ternjs/tern
"===============================================================================

if exists('g:plugs["tern_for_vim"]')
  " Enable excellent keyboard shortcuts
  let g:tern_map_keys=1
  " Display argument type hints when the cursor is left over a function
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
```

## See also

- [/neovim.html]
- [/2017/11/17/install-neovim.html]

## References

- [https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/](https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/)
- [https://donniewest.com/setting-up-vim-for-javascript-development]