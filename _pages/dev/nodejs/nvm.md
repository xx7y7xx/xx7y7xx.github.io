---
layout: page
title: nvm
permalink: /dev/nodejs/nvm.html
---

## Installation on macOS

Check environment first

```
$ node -v
v12.14.0
$ brew ls node
/usr/local/Cellar/node/13.5.0/bin/node
/usr/local/Cellar/node/13.5.0/etc/bash_completion.d/npm
/usr/local/Cellar/node/13.5.0/include/node/ (475 files)
/usr/local/Cellar/node/13.5.0/lib/dtrace/node.d
/usr/local/Cellar/node/13.5.0/libexec/bin/ (2 files)
/usr/local/Cellar/node/13.5.0/libexec/lib/ (4173 files)
/usr/local/Cellar/node/13.5.0/share/doc/ (2 files)
/usr/local/Cellar/node/13.5.0/share/man/man1/node.1
/usr/local/Cellar/node/13.5.0/share/systemtap/tapset/node.stp
```

From this issue [https://github.com/nvm-sh/nvm/issues/1918](https://github.com/nvm-sh/nvm/issues/1918), seems that you have to uninstall the node installed by homebrew.

Follow the steps in [uninstall steps for homebrew](/dev/nodejs/nodejs-macos-install.html) to uninstall/remove all the version of node installed by Homebrew.

Follow the installation steps on [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

```
$ brew ls nvm
Error: No such keg: /usr/local/Cellar/nvm
```

This means `nvm` is still not installed yet.

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

```
$ nvm list
zsh: command not found: nvm
```

Add below lines to `~/.zshrc`

```
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

Open a new terminal window.

Verify the nvm installation.

```
$ command -v nvm
nvm
```

If there is node already installed by Homebrew, you will see `system`.

```
$ nvm list

->       system
iojs -> N/A (default)
node -> stable (-> N/A) (default)
unstable -> N/A (default)
nvm_list_aliases:36: no matches found: /Users/devin.chenyang/.nvm/alias/lts/*
```

If all the node installed are uninstalled, you will see:

```
$ nvm list
            N/A
iojs -> N/A (default)
node -> stable (-> N/A) (default)
unstable -> N/A (default)
nvm_list_aliases:36: no matches found: /Users/devin.chenyang/.nvm/alias/lts/*
```

See which node version can be installed by nvm, run `nvm ls-remote`. This will print a lot info...

First, I want to install the latest LTS version.

```
$ nvm install 12
```

Then check the installation

```
$ nvm ls
->     v12.16.1
default -> 12 (-> v12.16.1)
node -> stable (-> v12.16.1) (default)
stable -> 12.16 (-> v12.16.1) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/erbium (-> v12.16.1)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.19.0 (-> N/A)
lts/erbium -> v12.16.1
```

Then I'd like to install version 8 for some old projects.

```
$ nvm install 8
```

Checked the installation.

```
$ nvm ls
->      v8.17.0
       v12.16.1
default -> 12 (-> v12.16.1)
node -> stable (-> v12.16.1) (default)
stable -> 12.16 (-> v12.16.1) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/erbium (-> v12.16.1)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0
lts/dubnium -> v10.19.0 (-> N/A)
lts/erbium -> v12.16.1
```

I switch to the lastest version to develop the new projects.

```
$ nvm use 12
Now using node v12.16.1 (npm v6.13.4)
```

Installed yarn again since I remove it when uninstalling node.

```
$ brew install yarn
```

Seems that brew automatically install node 13 for me. So I will check the node version first.

```
$ node -v
v12.16.1
```

So it's still the version installed by nvm.
