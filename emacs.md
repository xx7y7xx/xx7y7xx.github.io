---
layout: page
title: Emacs
---

## macOS

The initial env

```
➜  ~ which emacs
/usr/bin/emacs
```

```
➜  ~ emacs --version
GNU Emacs 22.1.1
Copyright (C) 2007 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```

### install on macOS method 1

[http://wikemacs.org/wiki/Installing_Emacs_on_OS_X](http://wikemacs.org/wiki/Installing_Emacs_on_OS_X)

```
$ brew update
$ brew install emacs --with-cocoa
$ brew linkapps emacs
```

```
➜  ~ ll /usr/local/bin/emacs
lrwxr-xr-x  1 devin.chenyang  admin    30B Dec 29 11:26 /usr/local/bin/emacs -> ../Cellar/emacs/25.3/bin/emacs
```

```
➜  ~ ll /usr/local/Cellar/emacs/
total 0
drwxr-xr-x  13 devin.chenyang  admin   442B Dec 29 11:26 25.3
```

How to uninstall

```
➜  ~ brew uninstall emacs
Uninstalling /usr/local/Cellar/emacs/25.3... (4,051 files, 119.4MB)
```

```
➜  ~ ll /usr/local/bin/emacs
ls: /usr/local/bin/emacs: No such file or directory
➜  ~ ll /usr/local/Cellar/emacs/
ls: /usr/local/Cellar/emacs/: No such file or directory
```

### install on macOS method 2

[http://wikemacs.org/wiki/Installing_Emacs_on_OS_X#Homebrew_recommended_by_brew](http://wikemacs.org/wiki/Installing_Emacs_on_OS_X#Homebrew_recommended_by_brew)

```
brew update
```

```
brew cask install emacs
```

because I installed emac with `brew install emacs --with-cocoa` and doing `brew linkapps emacs` before.
But when uninstalling emac I only run `brew uninstall emacs` with out `brew unlinkapps emac`.
So I came across a error when trying to install emacs with `brew cask install emacs` here.

```
➜  ~ brew cask install emacs
==> Satisfying dependencies
==> Downloading https://emacsformacosx.com/emacs-builds/Emacs-25.3-universal.dmg
######################################################################## 100.0%
==> Verifying checksum for Cask emacs
==> Installing Cask emacs
==> Purging files for version 25.3 of Cask emacs
Error: It seems there is already an App at '/Applications/Emacs.app'.
➜  ~ echo $?
1
```

Try with `verbose` parameters

```
➜  ~ brew cask install emacs --verbose
==> Satisfying dependencies
==> Downloading https://emacsformacosx.com/emacs-builds/Emacs-25.3-universal.dmg
Already downloaded: /Users/devin.chenyang/Library/Caches/Homebrew/Cask/emacs--25.3.dmg
==> Verifying checksum for Cask emacs
==> Installing Cask emacs
==> Purging files for version 25.3 of Cask emacs
Error: It seems there is already an App at '/Applications/Emacs.app'.
Error: Kernel.exit
```

Try to check the installed software with homebrew

```
➜  ~ brew list
ack		bash-completion	direnv		gdbm		git		icu4c		libidn2		libunistring	libvterm	luajit		mercurial	neovim		openssl		pcre		pre-commit	python3		redis		shellcheck	unfs3		watchman	xz
awscli		dinghy		fzf		gettext		httpie		jemalloc	libtermkey	libuv		libyaml		md5sha1sum	msgpack		node		openssl@1.1	pkg-config	python		readline	ruby		sqlite		unibilium	wget		yarn
➜  ~ brew cask list
➜  ~
```

Try to show the linked file with `/Applications/Emacs.app`.
We can see the linked file `/usr/local/opt/emacs/Emacs.app` is not existed, because emacs has already been uninstalled.

```
➜  ~ ll /Applications/Emacs.app
lrwxr-xr-x  1 devin.chenyang  admin    30B Dec 29 12:09 /Applications/Emacs.app -> /usr/local/opt/emacs/Emacs.app
➜  ~ ll /usr/local/opt/emacs/Emacs.app
ls: /usr/local/opt/emacs/Emacs.app: No such file or directory
```

Try to unlink `/Applications/Emacs.app`, but failed.
That's because the unlinkapps tool can't find `/usr/local/Cellar/emacs`

```
➜  ~ brew unlinkapps emacs
Warning: `brew unlinkapps` has been deprecated and will eventually be removed!

Unfortunately `brew linkapps` cannot behave nicely with e.g. Spotlight using either aliases or symlinks and Homebrew formulae do not build "proper" `.app` bundles that can be relocated. Instead, please consider using `brew cask` and migrate formulae using `.app`s to casks.
Error: No such keg: /usr/local/Cellar/emacs
➜  ~ ll /Applications/Emacs.app
lrwxr-xr-x  1 devin.chenyang  admin    30B Dec 29 12:09 /Applications/Emacs.app -> /usr/local/opt/emacs/Emacs.app
```

I think the only way to fix it is that I have to uninstall emacs installed with `brew cask`, and install emacs with `brew` again, and first unlinkapp emacs, and then uninstall emacs.
And at last I install emacs with `brew cask` again.

Try to check whether`emacs` is installed by `brew cask`. As it displays, `emacs` is not successed to install.
So I think I don't need to uninstall first.

```
➜  ~ brew cask list
➜  ~
```

Install emacs with homebrew

```
brew install emacs --with-cocoa
```

Check the link first

```
➜  ~ ll /Applications/Emacs.app
lrwxr-xr-x  1 devin.chenyang  admin    30B Dec 29 12:09 /Applications/Emacs.app -> /usr/local/opt/emacs/Emacs.app
➜  ~ ll /usr/local/opt/emacs/Emacs.app
total 0
drwxr-xr-x  6 devin.chenyang  admin   204B Dec 29 14:47 Contents
```

Unlink the emacs app

```
➜  ~ brew unlinkapps emacs
Warning: `brew unlinkapps` has been deprecated and will eventually be removed!

Unfortunately `brew linkapps` cannot behave nicely with e.g. Spotlight using either aliases or symlinks and Homebrew formulae do not build "proper" `.app` bundles that can be relocated. Instead, please consider using `brew cask` and migrate formulae using `.app`s to casks.
Unlinking: /Applications/Emacs.app
Unlinked 1 app from /Applications
```

```
➜  ~ ll /Applications/Emacs.app
ls: /Applications/Emacs.app: No such file or directory
```

Then uninstall emacs

```
$ brew uninstall emacs
```

At last install emacs again

```
➜  ~ brew cask install emacs
==> Satisfying dependencies
==> Downloading https://emacsformacosx.com/emacs-builds/Emacs-25.3-universal.dmg
Already downloaded: /Users/devin.chenyang/Library/Caches/Homebrew/Cask/emacs--25.3.dmg
==> Verifying checksum for Cask emacs
==> Installing Cask emacs
==> Moving App 'Emacs.app' to '/Applications/Emacs.app'.
==> Linking Binary 'Emacs' to '/usr/local/bin/emacs'.
==> Linking Binary 'ctags' to '/usr/local/bin/ctags'.
==> Linking Binary 'emacsclient' to '/usr/local/bin/emacsclient'.
==> Linking Binary 'etags' to '/usr/local/bin/etags'.
==> Linking Binary 'ebrowse' to '/usr/local/bin/ebrowse'.
🍺  emacs was successfully installed!
```

```
➜  ~ ll /usr/local/Caskroom/emacs
total 0
drwxr-xr-x  5 devin.chenyang  admin   170B Dec 29 15:00 25.3
```

```
➜  ~ ll /Applications/Emacs.app
total 0
drwxr-xr-x  7 devin.chenyang  devin.chenyang   238B Sep 13 02:51 Contents
```

Now you could search "emacs" in Spotlight Search.
But when you run `emacs` in terminal, it is the old version

```
➜  ~ emacs --version
GNU Emacs 22.1.1
Copyright (C) 2007 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```

You should make a alias for emacs. ( Follow this document: [https://emacsformacosx.com/tips](https://emacsformacosx.com/tips) )

```
➜  ~ mkdir bin
➜  ~ l /Applications/Emacs.app/Contents/MacOS/Emacs
-rwxr-xr-x  1 devin.chenyang  devin.chenyang   3.3K Sep 13 02:51 /Applications/Emacs.app/Contents/MacOS/Emacs
➜  ~ cat bin/emacs
#!/bin/sh
/Applications/Emacs.app/Contents/MacOS/Emacs "$@"
➜  ~ chmod +x bin/emacs
```

Add `export PATH=$PATH:$HOME/bin` to your zsh/bash config

```
$ source ~/.zshrc # OR
$ source ~/.bash_profile
```

```
➜  ~ emacs --version
GNU Emacs 25.3.1
Copyright (C) 2017 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of GNU Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```

Run `emacs` with `nw` (no window) option

```
$ emacs -nw
```

Input <kbd><kbd>Ctrl</kbd>+<kbd>X</kbd></kbd> then <kbd><kbd>Ctrl</kbd>+<kbd>C</kbd></kbd> to quit emacs.
See [https://www.gnu.org/software/emacs/manual/html_node/emacs/Exiting.html](https://www.gnu.org/software/emacs/manual/html_node/emacs/Exiting.html) for more details.

As said in [https://emacs-doctor.com/how-to-exit-emacs.html](https://emacs-doctor.com/how-to-exit-emacs.html)

> Spending the rest of your life in Emacs is a feature, not a bug.

You could also use <kbd><kbd>Ctrl</kbd>+<kbd>Z</kbd></kbd> to send `emacs` process to background, and back to terminal, and `fg` to go back to emacs again.

If you have not decide whether to start emacs server or not, you may see these for details about what emacs server doing:

- [http://wikemacs.org/wiki/Emacs_server](http://wikemacs.org/wiki/Emacs_server)
- [https://www.reddit.com/r/emacs/comments/6hd8ru/do_you_run_emacs_in_daemon_mode/](https://www.reddit.com/r/emacs/comments/6hd8ru/do_you_run_emacs_in_daemon_mode/)

```
brew services start emacs
```

## References

- [http://wikemacs.org/wiki/Installing_Emacs_on_OS_X](http://wikemacs.org/wiki/Installing_Emacs_on_OS_X)
- [https://emacs-doctor.com/how-to-exit-emacs.html](https://emacs-doctor.com/how-to-exit-emacs.html)