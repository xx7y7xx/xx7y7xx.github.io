---
layout: post
title: install neovim
---

in vim, `:checkhealth` or `:CheckHealth`

when python client is not installed, output is:

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
  - INFO: Disabled. g:loaded_python_provider=1

## Python 3 provider (optional)
  - INFO: Disabled. g:loaded_python3_provider=1

## Ruby provider (optional)
  - INFO: Ruby: ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]
  - WARNING: Missing "neovim" gem.
    - ADVICE:
      - Run in shell: gem install neovim
      - Is the gem bin directory in $PATH? Check `gem environment`.
      - If you are using rvm/rbenv/chruby, try "rehashing".
```

when python client is installed, output is:

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
  - INFO: `g:python_host_prog` is not set.  Searching for python2 in the environment.
  - INFO: Executable: /usr/local/bin/python2
  - INFO: Python2 version: 2.7.14
  - INFO: python2-neovim version: 0.2.0
  - OK: Latest python2-neovim is installed: 0.2.0

## Python 3 provider (optional)
  - INFO: `g:python3_host_prog` is not set.  Searching for python3 in the environment.
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

when python intergration is enabled, the output is:

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