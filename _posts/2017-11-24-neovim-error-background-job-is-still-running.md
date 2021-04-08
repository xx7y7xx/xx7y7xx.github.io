---
layout: post
title: 'neovim "error background job is still running"'
---

when save in neovim, error message is

```
error background job is still running
```

this is a asyncrun.vim issue, [https://github.com/skywind3000/asyncrun.vim/issues/25](https://github.com/skywind3000/asyncrun.vim/issues/25)

but quit neovim will solve this problem.