---
layout: page
title: zsh
permalink: /dev/zsh/install.html
---

## Installation for Ubuntu 16.04

### prepare

find the shell (Bash shell) currently used

```
$ echo $SHELL
/bin/bash
```

Check on your Valid login Shells

```
$ cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
/usr/bin/screen
/usr/bin/tmux
```

### install zsh

```
sudo apt install zsh
```

```
$ cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
/usr/bin/screen
/usr/bin/tmux
/bin/zsh  <------------- apt install this line
/usr/bin/zsh  <--------- apt install this line
```

Make it your default shell:

```
chsh -s $(which zsh)
```

## Installation for macOS

macOS ship zsh by default

```
$ zsh --version
zsh 5.2 (x86_64-apple-darwin16.0)
```

make sure Zsh is in your authorized shells list (`/etc/shells`)

```
$ cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

Make it your default shell

```
chsh -s $(which zsh)
```

Log out and login back again

## See also

- [zsh](/dev/zsh/index.html)

## References

- [https://wiki.ubuntu.com/ChangingShells](https://wiki.ubuntu.com/ChangingShells)
- [https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
