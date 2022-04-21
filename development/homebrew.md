---
layout: page
title: Homebrew
---

## Installation

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

show brew info

```
 ~  brew config
HOMEBREW_VERSION: 1.3.8
ORIGIN: https://github.com/Homebrew/brew
HEAD: 236b0172306a6f4b233d374fcc20adce5c3e3261
Last commit: 9 days ago
Core tap ORIGIN: https://github.com/Homebrew/homebrew-core
Core tap HEAD: f17f64c9aa75957ee7775f6a4d5d32db4a137b6d
Core tap last commit: 68 minutes ago
HOMEBREW_PREFIX: /usr/local
HOMEBREW_GEM_HOME: /Users/chenyang/.rvm/gems/ruby-2.2.6
HOMEBREW_GEM_PATH: /Users/chenyang/.rvm/gems/ruby-2.2.6:/Users/chenyang/.rvm/gems/ruby-2.2.6@global
HOMEBREW_GIT_CONFIG_FILE: /usr/local/Homebrew/.git/config
CPU: octa-core 64-bit haswell
Homebrew Ruby: 2.3.3 => /usr/local/Homebrew/Library/Homebrew/vendor/portable-ruby/2.3.3/bin/ruby
Clang: 9.0 build 900
Git: 2.13.1 => /usr/local/bin/git
Curl: 7.54.0 => /usr/bin/curl
Perl: /usr/bin/perl
Python: /usr/local/opt/python/libexec/bin/python => /usr/local/Cellar/python/2.7.14/Frameworks/Python.framework/Versions/2.7/Resources/Python.app/Contents/MacOS/Python
Ruby: /Users/chenyang/.rvm/rubies/ruby-2.2.6/bin/ruby
Java: 1.8.0_144
macOS: 10.13.1-x86_64
Xcode: 9.1
CLT: 9.1.0.0.1.1508540944
X11: N/A
```

`CLT` is (XCode) Command Line Tools, and brew is detected CLT.

## Update or upgrade the packages

First update the formulae and Homebrew itself:

```
$ brew update --verbose
```

You can now find out what is outdated with:

```
$ brew outdated
```

Upgrade everything with:

```
$ brew upgrade
```

Or upgrade a specific formula with `brew upgrade <formula>`, e.g.:

```
$ brew upgrade yarn
```

## Upgrade Homebrew

```
$ brew -v
Homebrew 3.2.10
$ brew update
...
$ brew -v
Homebrew 3.4.7
```

## Common CLI options

| Description                  | Command                  |
| :--------------------------- | :----------------------- |
| Show package information     | `brew info dialog`       |
| Show installed package       | `\$ brew list            | less` |
| Update formulae and Homebrew | `brew update`            |
| Update formula               | `brew upgrade <formula>` |

## Check wheter a formula/package is installed or not

```
$ brew list telnet # telnet is installed
/usr/local/Cellar/telnet/60/bin/telnet
/usr/local/Cellar/telnet/60/share/man/man1/telnet.1
$ brew list go # go is not installed
Error: No such keg: /usr/local/Cellar/go
```

## Homebrew-Cask

install homebrew-cask

```
$ brew tap caskroom/cask
```

## Taps (third-party repositories)

Lists the currently tapped repositories.

```
➜  ~ brew tap
Updating Homebrew...
caskroom/cask
codekitchen/dinghy
domt4/chromium
homebrew/core
```

## FAQ

```
$ brew install dialog
```

```
/usr/local/Homebrew/Library/Homebrew/brew.rb:12:in `<main>': Homebrew must be run under Ruby 2.3! (RuntimeError)
```

```
$ brew install dialog
Updating Homebrew...
==> Downloading https://homebrew.bintray.com/bottles/dialog-1.3-20170509.sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring dialog-1.3-20170509.sierra.bottle.tar.gz
🍺  /usr/local/Cellar/dialog/1.3-20170509: 14 files, 823.3KB
```

## See also

- [macOS](/macOS.html)

## References

- [https://caskroom.github.io/](https://caskroom.github.io/)
- [https://docs.brew.sh/brew-tap.html](https://docs.brew.sh/brew-tap.html)
- [https://docs.brew.sh/FAQ](https://docs.brew.sh/FAQ)
