---
layout: page
title: neovim
---

## installation

### install neovim

mac ([https://github.com/neovim/homebrew-neovim](https://github.com/neovim/homebrew-neovim))

```
brew install neovim
```

```
➜  ~ nvim --version
NVIM v0.2.1
Build type: Release
LuaJIT 2.0.5
Compilation: /usr/local/Homebrew/Library/Homebrew/shims/super/clang -Wconversion -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -DNDEBUG -DMIN_LOG_LEVEL=3 -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wimplicit-fallthrough -Wvla -fstack-protector-strong -fdiagnostics-color=auto -DINCLUDE_GENERATED_DECLARATIONS -I/tmp/neovim-20171109-46118-9kky38/neovim-0.2.1/build/config -I/tmp/neovim-20171109-46118-9kky38/neovim-0.2.1/src -I/usr/local/include -I/usr/local/include -I/usr/local/include -I/usr/local/include -I/usr/local/include -I/usr/local/include -I/usr/local/opt/gettext/include -I/usr/include -I/tmp/neovim-20171109-46118-9kky38/neovim-0.2.1/build/src/nvim/auto -I/tmp/neovim-20171109-46118-9kky38/neovim-0.2.1/build/include
Compiled by brew@Sierra.local

Features: +acl +iconv +jemalloc +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/local/Cellar/neovim/0.2.1/share/nvim"

Run :checkhealth for more info
```

### install python client to neovim

for some plugins may using python, you should install/upgrade python in your OS.

follow the steps in [macOS#python](/macOS.html#python)

then install the python client to neovim

optionally, first check the version of neovim package

```
➜  ~ pip2 install --download /tmp -v neovim
DEPRECATION: pip install --download has been deprecated and will be removed in the future. Pip now has a download command that should be used instead.
Collecting neovim
  1 location(s) to search for versions of neovim:
  * https://pypi.python.org/simple/neovim/
  Getting page https://pypi.python.org/simple/neovim/
  Looking up "https://pypi.python.org/simple/neovim/" in the cache
  No cache entry available
  Starting new HTTPS connection (1): pypi.python.org
  "GET /simple/neovim/ HTTP/1.1" 200 3821
  Updating cache with response from "https://pypi.python.org/simple/neovim/"
  Caching b/c date exists and max-age > 0
  Analyzing links from page https://pypi.python.org/simple/neovim/
```

or use `pip2 download` command

```
pip2 download -d /tmp -v neovim|less
```

then install neovim package

```
pip2 install neovim
pip3 install neovim
```

to complete python intergration, put this in `~/.config/nvim/init.vim` config file

```
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
```

check for installation, open `nvim`

```
:CheckHealth
```

### using vim-plug to manage vim plugins

vim-plug installation

[https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
mkdir ~/.config/nvim/
```

```
vim ~/.config/nvim/init.vim
```

[https://github.com/xx7y7xx/vimrc/blob/master/init.vim](https://github.com/xx7y7xx/vimrc/blob/master/init.vim)

Cloase nvim and reopen again, run `:PlugInstall`

## upgrade

```
brew upgrade neovim
```

after upgrade neovim

```
pip2 install --upgrade neovim
pip3 install --upgrade neovim
```

##  config

```
~/.config/nvim/init.vim
```

## commands

```
:CheckHealth
```

## using vim-plug to manage vim plugins

### disable a plugin

```
Plug 'SirVer/ultisnips', { 'on': [] }
```

## check health

```
$ nvim
```

in vim, `:checkhealth` or `:CheckHealth`

```
health#nvim#check
========================================================================
## Configuration
  - OK: no issues found

## Performance
  - OK: Build type: Release

## Remote Plugins
  - OK: Up to date

## terminal
  - INFO: key_backspace (kbs) terminfo entry: key_backspace=^H
  - INFO: key_dc (kdch1) terminfo entry: key_dc=\E[3~
  - INFO: $XTERM_VERSION=''
  - INFO: $VTE_VERSION=''
  - INFO: $SSH_TTY=''

health#provider#check
========================================================================
## Clipboard (optional)
  - OK: Clipboard tool found: pbcopy

## Python 2 provider (optional)
  - INFO: Using: g:python_host_prog = "/usr/local/bin/python2"
  - INFO: Executable: /usr/local/bin/python2
  - INFO: Python2 version: 2.7.14
  - INFO: python2-neovim version: 0.2.0
  - OK: Latest python2-neovim is installed: 0.2.0

## Python 3 provider (optional)
  - INFO: Using: g:python3_host_prog = "/usr/local/bin/python3"
  - INFO: Executable: /usr/local/bin/python3
  - INFO: Python3 version: 3.6.3
  - INFO: python3-neovim version: 0.2.0
  - OK: Latest python3-neovim is installed: 0.2.0

## Ruby provider (optional)
  - INFO: Ruby: ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]
  - WARNING: Missing "neovim" gem.
    - ADVICE:
      - Run in shell: gem install neovim
      - Is the gem bin directory in $PATH? Check `gem environment`.
      - If you are using rvm/rbenv/chruby, try "rehashing".
```

## Setting up Vim for React development

[https://drivy.engineering/setting-up-vim-for-react/](https://drivy.engineering/setting-up-vim-for-react/)

- [https://github.com/pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
- [https://github.com/mxw/vim-jsx](https://github.com/mxw/vim-jsx)
- [https://github.com/justinj/vim-react-snippets](https://github.com/justinj/vim-react-snippets)
- Asynchronous Lint Engine (lint eslint) [https://github.com/w0rp/ale](https://github.com/w0rp/ale)
- [https://github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

## Searching in file content

install ack [https://beyondgrep.com/install/](https://beyondgrep.com/install/) [https://github.com/beyondgrep/ack2](https://github.com/beyondgrep/ack2)

```
$ brew install ack
```

check installation

```
➜  ~ ack --version
ack 2.20
Running under Perl 5.18.2 at /usr/bin/perl

Copyright 2005-2017 Andy Lester.

This program is free software.  You may modify or distribute it
under the terms of the Artistic License v2.0.
```

a snapshot of using ack in command line

![](/attachments/vim/ack-jietu20171215-131124.jpg)

install acl.vim [https://github.com/mileszs/ack.vim](https://github.com/mileszs/ack.vim) plugin in neovim

insert content below into `~/.config/nvim/init.vim`

```
" Ack.vim (Ack)
Plug 'mileszs/ack.vim'
```

run `nvim`

```
:PlugInstall
```

a snapshot of using ack.vim in neovim

![](/attachments/vim/Screen Shot 2017-12-15 at 1.17.10 PM.png)

How to use ack.vim with nerdtree

open a new tab

```
:tabedit
```

Search `\<Table` with ack.vim

```
:Ack \<Table
```

## See also

- [vim](/vim.html)
- [macOS#Python](/macOS.html#python)

## References

- [neovim faq](https://github.com/neovim/neovim/wiki/FAQ)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [https://sergeykalistratov.com/neovim-with-python-on-macos/](https://sergeykalistratov.com/neovim-with-python-on-macos/)
- neovim config examples
  - [https://github.com/bigeagle/neovim-config/blob/master/init.vim](https://github.com/bigeagle/neovim-config/blob/master/init.vim)
- [http://nerditya.com/code/guide-to-neovim/](http://nerditya.com/code/guide-to-neovim/)