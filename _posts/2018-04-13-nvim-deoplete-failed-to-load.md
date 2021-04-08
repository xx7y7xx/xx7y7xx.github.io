---
layout: post
title: nvim deoplete failed to load
---

Env: MacBook Pro (Retina, 15-inch, Mid 2015), macOS Version: 10.13.4 (17E199)

```
[deoplete] deoplete failed to load. Try the :UpdateRemotePlugins command and restart Neovim. See also :CheckHealth.
```

`:CheckHealth`

```
 44 ## Python 3 provider (optional)
 45   - INFO: Using: g:python3_host_prog = "/usr/local/bin/python3"
 46   - ERROR: `python3` was not found.
 47   - INFO: Executable: Not found
```

```
 ~  /usr/local/bin/python3 --version
zsh: no such file or directory: /usr/local/bin/python3
```

```
 ~  /usr/local/bin/python2 --version
Python 2.7.14
 ~  python2 --version
Python 2.7.14
 ~  python --version
Python 2.7.10
```

```
 ~  which python
/usr/bin/python
 ~  which python2
/usr/local/bin/python2
```

```
 ~  brew info python3
python: stable 3.6.5 (bottled), devel 3.7.0b3, HEAD
Interpreted, interactive, object-oriented programming language
https://www.python.org/
/usr/local/Cellar/python/2.7.14 (3,573 files, 49.3MB) *
  Poured from bottle on 2017-11-29 at 23:24:16
/usr/local/Cellar/python/3.6.3 (3,674 files, 57.1MB)
  Poured from bottle on 2017-11-29 at 23:27:17
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/python.rb
==> Dependencies
Build: pkg-config ✔, sphinx-doc ✘
Required: gdbm ✘, openssl ✔, readline ✔, sqlite ✘, xz ✔
Optional: tcl-tk ✘
==> Options
--with-tcl-tk
	Use Homebrew's Tk instead of macOS Tk (has optional Cocoa and threads support)
--devel
	Install development version 3.7.0b3
--HEAD
	Install HEAD version
==> Caveats
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

Pip, setuptools, and wheel have been installed. To update them run
  pip3 install --upgrade pip setuptools wheel

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.6/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
```

```
 ~  ll /usr/local/Cellar/python/3.6.3
total 64
drwxr-xr-x   3 chenyang  admin    96B Oct  3  2017 Frameworks
drwxr-xr-x   3 chenyang  admin    96B Oct  3  2017 IDLE 3.app
-rw-r--r--   1 chenyang  admin   3.3K Apr 11 00:57 INSTALL_RECEIPT.json
-rw-r--r--   1 chenyang  admin    12K Oct  3  2017 LICENSE
drwxr-xr-x   3 chenyang  admin    96B Oct  3  2017 Python Launcher 3.app
-rw-r--r--   1 chenyang  admin   9.1K Oct  3  2017 README.rst
drwxr-xr-x  19 chenyang  admin   608B Nov 29 23:27 bin
drwxr-xr-x   3 chenyang  admin    96B Oct  3  2017 lib
drwxr-xr-x   5 chenyang  admin   160B Oct  3  2017 libexec
drwxr-xr-x   3 chenyang  admin    96B Oct  3  2017 share
```

```
~  ls /usr/local/bin/python3
ls: /usr/local/bin/python3: No such file or directory
```

```
 ~  brew install python3
Error: python 2.7.14 is already installed
To upgrade to 3.6.5, run `brew upgrade python`
```

```
 ~  brew upgrade python
==> Upgrading 1 outdated package, with result:
python 2.7.14 -> 3.6.5
==> Upgrading python
==> Installing dependencies for python: gdbm, sqlite
==> Installing python dependency: gdbm
==> Downloading https://homebrew.bintray.com/bottles/gdbm-1.14.1_1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring gdbm-1.14.1_1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/gdbm/1.14.1_1: 20 files, 555.7KB
==> Installing python dependency: sqlite
==> Downloading https://homebrew.bintray.com/bottles/sqlite-3.23.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring sqlite-3.23.1.high_sierra.bottle.tar.gz
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides an older sqlite3.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/sqlite/lib
    CPPFLAGS: -I/usr/local/opt/sqlite/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/sqlite/lib/pkgconfig

==> Summary
🍺  /usr/local/Cellar/sqlite/3.23.1: 11 files, 3MB
==> Installing python
==> Downloading https://homebrew.bintray.com/bottles/python-3.6.5.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring python-3.6.5.high_sierra.bottle.tar.gz
==> /usr/local/Cellar/python/3.6.5/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python/3.6.5/bin --install-lib=/usr/local/l
==> /usr/local/Cellar/python/3.6.5/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python/3.6.5/bin --install-lib=/usr/local/l
==> /usr/local/Cellar/python/3.6.5/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python/3.6.5/bin --install-lib=/usr/local/l
==> Caveats
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

Pip, setuptools, and wheel have been installed. To update them run
  pip3 install --upgrade pip setuptools wheel

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.6/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
==> Summary
🍺  /usr/local/Cellar/python/3.6.5: 4,705 files, 99.4MB
```

```
 ~  python --version
Python 2.7.10
 ~  python2 --version
zsh: command not found: python2
 ~  python3 --version
Python 3.6.5
```

```
 ~  brew install python2
==> Downloading https://homebrew.bintray.com/bottles/python@2-2.7.14_3.high_sierra.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring python@2-2.7.14_3.high_sierra.bottle.1.tar.gz
==> /usr/local/Cellar/python@2/2.7.14_3/bin/python -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-script
==> /usr/local/Cellar/python@2/2.7.14_3/bin/python -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-script
==> /usr/local/Cellar/python@2/2.7.14_3/bin/python -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-script
==> Caveats
Pip and setuptools have been installed. To update them
  pip install --upgrade pip setuptools

You can install Python packages with
  pip install <package>

They will install into the site-package directory
  /usr/local/lib/python2.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
==> Summary
🍺  /usr/local/Cellar/python@2/2.7.14_3: 4,602 files, 81.8MB
```

```
 ~  python --version
Python 2.7.10
 ~  python2 --version
Python 2.7.14
 ~  python3 --version
Python 3.6.5
```

Open nvim, no deoplete error.