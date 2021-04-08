---
layout: page
title: Python macOS Installation
---

## Summary

Python can be installed by Homebrew or Pyenv. Please jump to the chapter for the installation step for either Homebrew or Pyenv.

## Homebrew

In this chapter, there are the install, upgrade and the uninstall steps.

### Install

The default version of python ship with mac is too low, and not ship with the `pip` tool

> pip is already installed if you're using Python 2 >=2.7.9 or Python 3 >=3.4 binaries downloaded from python.org, but you'll need to upgrade pip.

[https://pip.pypa.io/en/stable/installing/](https://pip.pypa.io/en/stable/installing/)

```
➜  ~ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.12.6
BuildVersion:	16G1036
➜  ~ python --version
Python 2.7.10
➜  ~ brew info python
python: stable 2.7.14 (bottled), HEAD
Interpreted, interactive, object-oriented programming language
https://www.python.org/
Not installed
```

follow steps in [https://sergeykalistratov.com/neovim-with-python-on-macos/](https://sergeykalistratov.com/neovim-with-python-on-macos/)

```
brew install python
brew install python3
```

```
➜  ~ brew install python; brew install python3
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (caskroom/cask).
No changes to formulae.

==> Downloading https://homebrew.bintray.com/bottles/python-2.7.14.sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring python-2.7.14.sierra.bottle.tar.gz
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scripts=/usr/local/Cellar/python/2.7.14/bin --install-lib=/usr/local/
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scripts=/usr/local/Cellar/python/2.7.14/bin --install-lib=/usr/local/
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scripts=/usr/local/Cellar/python/2.7.14/bin --install-lib=/usr/local/
==> Caveats
This formula installs a python2 executable to /usr/local/bin.
If you wish to have this formula's python executable in your PATH then add
the following to ~/.zshrc:
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"

Pip and setuptools have been installed. To update them
  pip2 install --upgrade pip setuptools

You can install Python packages with
  pip2 install <package>

They will install into the site-package directory
  /usr/local/lib/python2.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python.html
==> Summary
🍺  /usr/local/Cellar/python/2.7.14: 3,517 files, 48.4MB
Warning: python3 3.6.3 is already installed
```

```
➜  ~ pip2 --version
pip 9.0.1 from /usr/local/lib/python2.7/site-packages (python 2.7)
➜  ~ pip3 --version
pip 9.0.1 from /usr/local/lib/python3.6/site-packages (python 3.6)
```

python bin is installed in `/usr/local/bin/`

```
➜  ~ /usr/local/bin/python2 --version
Python 2.7.14
➜  ~ /usr/local/bin/python3 --version
Python 3.6.3
```

### Upgrade

```
brew upgrade python
```

### Uninstall

Check the installed version first.

```
$ python --version
Python 2.7.15
$ pip --version
pip 18.0 from /usr/local/lib/python2.7/site-packages/pip (python 2.7)

$ python3 --version
Python 3.7.4
$ pip3 --version
pip 19.1.1 from /usr/local/lib/python3.7/site-packages/pip (python 3.7)
```

```
$ brew ls python
/usr/local/Cellar/python/3.7.4_1/bin/2to3
...
/usr/local/Cellar/python/3.7.4_1/share/man/ (2 files)
```

```
$ brew info python
...
==> Caveats
Python has been installed as
  /usr/local/bin/python3
...
```

Start to uninstall python installded by homebrew

```
$ brew uninstall python3
Error: Refusing to uninstall /usr/local/Cellar/python/3.7.4_1
because it is required by glib, graphviz, gts and plantuml, which are currently installed.
You can override this and force removal with:
  brew uninstall --ignore-dependencies python3
```

Because I know I will install python again by pyenv, so I will just ignore the dependencies.

```
$ brew uninstall --ignore-dependencies python3
Uninstalling /usr/local/Cellar/python/3.7.4_1... (3,905 files, 60.6MB)
```

Try to uninstall python2

```
$ brew uninstall --ignore-dependencies python2
Error: No such keg: /usr/local/Cellar/python2
```

Seems the formula name is not correct. Try to find the correct one.

```
$ brew ls python2
Error: No such keg: /usr/local/Cellar/python2
$ brew ls python
Error: No such keg: /usr/local/Cellar/python
```

Maybe python is already uninstalled. But I need to confirm this.
Open a new terminal window.

```
$ python --version
Python 2.7.15
$ which python
/usr/local/bin/python
$ ls -al /usr/local/bin/python
lrwxr-xr-x  1 chenyang  admin  38 Aug 25  2018 /usr/local/bin/python -> ../Cellar/python@2/2.7.15_1/bin/python
```

So the link in bin dir is really from a homebrew cellar. I still need to remove it.

```
$ brew uninstall python
Error: No such keg: /usr/local/Cellar/python
$ brew uninstall python2
Error: No such keg: /usr/local/Cellar/python2
$ brew uninstall python3
Error: No such keg: /usr/local/Cellar/python
$ pip --version
pip 18.0 from /usr/local/lib/python2.7/site-packages/pip (python 2.7)
```

Why not I try another key `python@2`.

```
$ brew uninstall python@2
Error: Refusing to uninstall /usr/local/Cellar/python@2/2.7.15_1
because it is required by watchman, which is currently installed.
You can override this and force removal with:
  brew uninstall --ignore-dependencies python@2
```

Seems it works. So let me ignore the dependencies.

```
$ brew uninstall --ignore-dependencies python@2
Uninstalling /usr/local/Cellar/python@2/2.7.15_1... (4,747 files, 84MB)
```

OK, it's gone. Must checked it.

```
$ python2 --version
Python 2.7.16
$ python --version
Python 2.7.16
$ which python
/usr/bin/python
$ ls -al /usr/bin/python
lrwxr-xr-x  1 root  wheel  75 Oct 23 04:00 /usr/bin/python -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7
```

We can see now it's from the system default python installation. (Which should not been remove since some system software depend on it)

```
$ python3 --version
Python 3.7.3
$ which python3
/usr/bin/python3
$ ls -al /usr/bin/python3
-rwxr-xr-x  1 root  wheel  31456 Jan 23 21:58 /usr/bin/python3
```

Why there still python3 installed in `/usr/bin` dir?
After view [this](https://apple.stackexchange.com/a/376081) question, it is shipped with the macOS Catalina (Version 10.16).
So I will leave it there.

## Installation by pyenv

If you have several versions of Python installed by Homebrew, please uninstall them first. (I don't know whether it is necessary to uninstall them, but to avoid some weird problems, I do uninstall them first)

Follow the above step for uninstall Python installed by Homebrew.

### Install

Update formula first.

```
$ brew update
```

Then install `pyenv`.

```
$ brew install pyenv
Updating Homebrew...
==> Installing dependencies for pyenv: readline
==> Installing pyenv dependency: readline
==> Downloading https://homebrew.bintray.com/bottles/readline-8.0.4.catalina.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/6a/6ae1c8e7c783f32bd22c6085caa4d838fed7fb386da7e40ca47b87ec9b1237d6?__gda__=exp=1585330170~hmac=36de54a83cd5d780182ed4699bd42b951f
######################################################################## 100.0%
==> Pouring readline-8.0.4.catalina.bottle.tar.gz
==> Caveats
readline is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only.

For compilers to find readline you may need to set:
  export LDFLAGS="-L/usr/local/opt/readline/lib"
  export CPPFLAGS="-I/usr/local/opt/readline/include"

For pkg-config to find readline you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

==> Summary
🍺  /usr/local/Cellar/readline/8.0.4: 48 files, 1.5MB
==> Installing pyenv
==> Downloading https://homebrew.bintray.com/bottles/pyenv-1.2.17.catalina.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/cb/cbb04be64ce7bd342271f5bfe091203e5c40c05d8ffa821cb969aa331197240d?__gda__=exp=1585330175~hmac=b309e437cfe8423a9cc6cfd3a76750e76b
######################################################################## 100.0%
==> Pouring pyenv-1.2.17.catalina.bottle.tar.gz
🍺  /usr/local/Cellar/pyenv/1.2.17: 696 files, 2.5MB
==> Caveats
==> readline
readline is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only.

For compilers to find readline you may need to set:
  export LDFLAGS="-L/usr/local/opt/readline/lib"
  export CPPFLAGS="-I/usr/local/opt/readline/include"

For pkg-config to find readline you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
```

Add `pyenv init` to your shell to enable shims and autocompletion.

```
vim ~/.zshrc
```

Add these lines to `~/.zshrc`

```
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```

Open a new terminal window to make the environment variables take effect.

List the versions of Python currently installed.

```
$ pyenv versions
* system (set by /Users/chenyang/.pyenv/version)
```

### Install Python versions

Check current version.

```
$ python --version
Python 2.7.16
$ pip --version
zsh: command not found: pip
$ python3 --version
Python 3.7.3
```

Install `3.7.1`

```
$ pyenv install 3.7.1
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.7.1.tar.xz...
-> https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
Installing Python-3.7.1...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk
Installed Python-3.7.1 to /Users/chenyang/.pyenv/versions/3.7.1
```

List versions.

```
$ pyenv versions
* system (set by /Users/chenyang/.pyenv/version)
  3.7.1
```

Try to install another version `3.8.0`

```
$ pyenv install 3.8.0
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.8.0.tar.xz...
-> https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz
Installing Python-3.8.0...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk
Installed Python-3.8.0 to /Users/chenyang/.pyenv/versions/3.8.0
```

List versions.

```
$ pyenv versions
* system (set by /Users/chenyang/.pyenv/version)
  3.7.1
  3.8.0
```

Change version from `2.7.16` to `3.8.0`.

```
$ python --version
Python 2.7.16
$ pyenv global 3.8.0
```

Open a new window to check the version, as it doesn't take effect in the current terminal.

```
$ python --version
Python 3.8.0
$ pip --version
pip 19.2.3 from /Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/pip (python 3.8)
```

### Other usages

When you are working in a local project. Use `pyenv local` to create a `.python-version` file in the project dir. This will make sure when you run `python` in the project dir, it will use the version specific in the `.python-version` file.

```
pyenv local 3.5.0
```

If you want to make sure whenever running `python` in a terminall, will always use `3.7.0`, then use `pyenv global` to set the version.

```
pyenv global 3.7.2
```

### References

There are the websites when I learned how to install and setup.

- [https://github.com/pyenv/pyenv#homebrew-on-macos](https://github.com/pyenv/pyenv#homebrew-on-macos)
- [https://medium.com/python-every-day/python-development-on-macos-with-pyenv-2509c694a808](https://medium.com/python-every-day/python-development-on-macos-with-pyenv-2509c694a808)
- [https://gist.github.com/Bouke/11261620](https://gist.github.com/Bouke/11261620)
- [https://stackoverflow.com/a/18671336](https://stackoverflow.com/a/18671336)

### Upgrade

```
$ brew upgrade pyenv
```
