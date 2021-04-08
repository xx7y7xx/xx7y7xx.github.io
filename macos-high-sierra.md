---
layout: page
title: macOS High Sierra
---

## issues of upgrade to 10.13 (macOS High Sierra)

### install python with homebrew

#### Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks

```
~  brew install python
brew install python3
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> New Formulae
neal

==> Installing dependencies for python: sqlite, gdbm, openssl
==> Installing python dependency: sqlite
==> Downloading https://homebrew.bintray.com/bottles/sqlite-3.21.0.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring sqlite-3.21.0.high_sierra.bottle.tar.gz
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
🍺  /usr/local/Cellar/sqlite/3.21.0: 11 files, 3.0MB
==> Installing python dependency: gdbm
==> Downloading https://homebrew.bintray.com/bottles/gdbm-1.13.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring gdbm-1.13.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/gdbm/1.13: 19 files, 553.9KB
==> Installing python dependency: openssl
==> Downloading https://homebrew.bintray.com/bottles/openssl-1.0.2m.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring openssl-1.0.2m.high_sierra.bottle.tar.gz
==> Caveats
A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
  /usr/local/etc/openssl/certs

and run
  /usr/local/opt/openssl/bin/c_rehash

This formula is keg-only, which means it was not symlinked into /usr/local,
because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/openssl/lib
    CPPFLAGS: -I/usr/local/opt/openssl/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/openssl/lib/pkgconfig

==> Summary
🍺  /usr/local/Cellar/openssl/1.0.2m: 1,792 files, 12.3MB
==> Installing python
Warning: Building python from source:
  The bottle needs the Apple Command Line Tools to be installed.
  You can install them, if desired, with:
    xcode-select --install

==> Downloading https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
######################################################################## 100.0%
==> ./configure --prefix=/usr/local/Cellar/python/2.7.14 --enable-ipv6 --datarootdir=/usr/local/Cellar/python/2.7.14/share --datadir=/usr/local/Cellar/python/2.7.14/share -
==> make
==> make install PYTHONAPPSDIR=/usr/local/Cellar/python/2.7.14
==> make frameworkinstallextras PYTHONAPPSDIR=/usr/local/Cellar/python/2.7.14/share/python
==> Downloading https://files.pythonhosted.org/packages/a4/c8/9a7a47f683d54d83f648d37c3e180317f80dc126a304c45dc6663246233a/setuptools-36.5.0.zip
######################################################################## 100.0%
==> Downloading https://files.pythonhosted.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz
######################################################################## 100.0%
==> Downloading https://files.pythonhosted.org/packages/fa/b4/f9886517624a4dcb81a1d766f68034344b7565db69f13d52697222daeb72/wheel-0.30.0.tar.gz
######################################################################## 100.0%
Error: An unexpected error occurred during the `brew link` step
The formula built, but is not symlinked into /usr/local
Permission denied @ dir_s_mkdir - /usr/local/Frameworks
Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks
Updating Homebrew...
==> Installing dependencies for python3: xz
==> Installing python3 dependency: xz
==> Downloading https://homebrew.bintray.com/bottles/xz-5.2.3.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring xz-5.2.3.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/xz/5.2.3: 92 files, 1.4MB
==> Installing python3
Warning: Building python3 from source:
  The bottle needs the Apple Command Line Tools to be installed.
  You can install them, if desired, with:
    xcode-select --install

==> Downloading https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
######################################################################## 100.0%
==> ./configure --prefix=/usr/local/Cellar/python3/3.6.3 --enable-ipv6 --datarootdir=/usr/local/Cellar/python3/3.6.3/share --datadir=/usr/local/Cellar/python3/3.6.3/share -
==> make
==> make install PYTHONAPPSDIR=/usr/local/Cellar/python3/3.6.3
==> make frameworkinstallextras PYTHONAPPSDIR=/usr/local/Cellar/python3/3.6.3/share/python3
==> Downloading https://files.pythonhosted.org/packages/a4/c8/9a7a47f683d54d83f648d37c3e180317f80dc126a304c45dc6663246233a/setuptools-36.5.0.zip
######################################################################## 100.0%
==> Downloading https://files.pythonhosted.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz
######################################################################## 100.0%
==> Downloading https://files.pythonhosted.org/packages/fa/b4/f9886517624a4dcb81a1d766f68034344b7565db69f13d52697222daeb72/wheel-0.30.0.tar.gz
######################################################################## 100.0%
Error: An unexpected error occurred during the `brew link` step
The formula built, but is not symlinked into /usr/local
Permission denied @ dir_s_mkdir - /usr/local/Frameworks
Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks
```

```
 ~  brew install python
Warning: python 2.7.14 is already installed, it's just not linked.
You can use `brew link python` to link this version.
 ~  brew install python3
Warning: python3 3.6.3 is already installed, it's just not linked.
You can use `brew link python3` to link this version.
```

```
 ~  python --version
Python 2.7.10
```

```
 ~  brew link python
Linking /usr/local/Cellar/python/2.7.14... Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks
 ~  brew link python3
Linking /usr/local/Cellar/python3/3.6.3... Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks
```

[https://github.com/Homebrew/homebrew-core/issues/19286](https://github.com/Homebrew/homebrew-core/issues/19286)

`/usr/local/Frameworks` dir is missing

```
~  ll /usr/local
total 0
drwxrwxr-x    3 chenyang  admin    96B Nov 17 23:35 Caskroom
drwxrwxr-x   37 chenyang  admin   1.2K Nov 29 22:41 Cellar
drwxrwxr-x   17 chenyang  admin   544B Nov 29 21:53 Homebrew
drwxrwxr-x  219 chenyang  admin   6.8K Nov 29 22:46 bin
drwxrwxr-x    7 chenyang  admin   224B Nov 11 23:09 etc
drwxr-xr-x   20 root      wheel   640B Oct 26 02:36 go
drwxrwxr-x   45 chenyang  admin   1.4K Nov 29 22:40 include
drwxrwxr-x   95 chenyang  admin   3.0K Nov 29 22:40 lib
drwxrwxr-x   51 chenyang  admin   1.6K Nov 29 22:46 opt
drwxr-xr-x    3 root      wheel    96B Nov 11 23:09 remotedesktop
drwxrwxr-x   24 chenyang  admin   768B Nov 29 22:45 share
drwxrwxr-x    3 chenyang  admin    96B Nov 11 23:09 var
```

```
 ~  sudo mkdir /usr/local/Frameworks
Password:
 ~  sudo chown $(whoami):admin /usr/local/Frameworks
 ~  brew link python
Linking /usr/local/Cellar/python/2.7.14... 321 symlinks created
 ~  brew link python3
Linking /usr/local/Cellar/python3/3.6.3... 1 symlinks created
 ~  ll /usr/local/Frameworks
total 0
drwxr-xr-x  6 chenyang  admin   192B Nov 29 22:58 Python.framework
 ~  ll /usr/local/Frameworks/Python.framework
total 0
lrwxr-xr-x  1 chenyang  admin    62B Nov 29 22:58 Headers -> ../../Cellar/python/2.7.14/Frameworks/Python.framework/Headers
lrwxr-xr-x  1 chenyang  admin    61B Nov 29 22:58 Python -> ../../Cellar/python/2.7.14/Frameworks/Python.framework/Python
lrwxr-xr-x  1 chenyang  admin    64B Nov 29 22:58 Resources -> ../../Cellar/python/2.7.14/Frameworks/Python.framework/Resources
drwxr-xr-x  5 chenyang  admin   160B Nov 29 22:58 Versions
```

#### pip is missing

```
~  pip
zsh: command not found: pip
```

uninstall python and install again

```
 ~  brew uninstall python
Uninstalling /usr/local/Cellar/python/2.7.14... (5,941 files, 81.7MB)
 ~  brew uninstall python3
Uninstalling /usr/local/Cellar/python3/3.6.3... (7,572 files, 105.4MB)
```

```
 ~  brew install python
Updating Homebrew...
==> Downloading https://homebrew.bintray.com/bottles/python-2.7.14.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring python-2.7.14.high_sierra.bottle.tar.gz
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scr
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scr
==> /usr/local/Cellar/python/2.7.14/bin/python2 -s setup.py --no-user-cfg install --force --verbose --single-version-externally-managed --record=installed.txt --install-scr
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
 ~  brew install python3
==> Downloading https://homebrew.bintray.com/bottles/python3-3.6.3.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring python3-3.6.3.high_sierra.bottle.tar.gz
==> /usr/local/Cellar/python3/3.6.3/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python3/3.6.3/bin --install-lib=/usr
==> /usr/local/Cellar/python3/3.6.3/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python3/3.6.3/bin --install-lib=/usr
==> /usr/local/Cellar/python3/3.6.3/bin/python3 -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python3/3.6.3/bin --install-lib=/usr
==> Caveats
Pip, setuptools, and wheel have been installed. To update them
  pip3 install --upgrade pip setuptools wheel

You can install Python packages with
  pip3 install <package>

They will install into the site-package directory
  /usr/local/lib/python3.6/site-packages

See: https://docs.brew.sh/Homebrew-and-Python.html
==> Summary
🍺  /usr/local/Cellar/python3/3.6.3: 3,588 files, 56.1MB
```

check pip version

```
 ~  pip2 --version
pip 9.0.1 from /usr/local/lib/python2.7/site-packages (python 2.7)
 ~  pip3 --version
pip 9.0.1 from /usr/local/lib/python3.6/site-packages (python 3.6)
```

## See also

- [macOS](/macOS.html)