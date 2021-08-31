---
layout: page
title: nvm
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

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0  12758      0  0:00:01  0:00:01 --:--:-- 12761
=> Downloading nvm from git to '/Users/devin.chenyang/.nvm'
=> Cloning into '/Users/devin.chenyang/.nvm'...
remote: Enumerating objects: 290, done.
remote: Counting objects: 100% (290/290), done.
remote: Compressing objects: 100% (257/257), done.
remote: Total 290 (delta 35), reused 97 (delta 20), pack-reused 0
Receiving objects: 100% (290/290), 163.27 KiB | 316.00 KiB/s, done.
Resolving deltas: 100% (35/35), done.
=> Compressing and cleaning up git repository

=> Appending nvm source string to /Users/devin.chenyang/.bashrc
=> Appending bash_completion source string to /Users/devin.chenyang/.bashrc
npm info it worked if it ends with ok
npm info using npm@6.13.4
npm info using node@v12.14.0
npm timing npm Completed in 3453ms
npm info ok
=> You currently have modules installed globally with `npm`. These will no
=> longer be linked to the active version of Node when you install a new node
=> with `nvm`; and they may (depending on how you construct your `$PATH`)
=> override the binaries of modules installed with `nvm`:

/usr/local/lib
├── @storybook/cli@3.3.15
├── create-react-app@1.5.0
├── csvtojson@1.1.9
├── git-checkout-interactive@1.0.1
├── git-stats@2.10.11
├── jest-cli@21.2.1
├── legally@2.9.0
├── license-checker@15.0.0
├── license-report@2.1.0
├── lock-cli@1.2.0
├── prettier@1.8.2
├── tern@0.21.0
└── tldrlegal@1.0.5
=> If you wish to uninstall them at a later point (or re-install them under your
=> `nvm` Nodes), you can remove them from the system Node as follows:

     $ nvm use system
     $ npm uninstall -g a_module

=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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
Downloading and installing node v12.16.1...
Downloading https://nodejs.org/dist/v12.16.1/node-v12.16.1-darwin-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with shasum -a 256
Checksums matched!
Now using node v12.16.1 (npm v6.13.4)
Creating default alias: default -> 12 (-> v12.16.1)
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
Downloading and installing node v8.17.0...
Downloading https://nodejs.org/dist/v8.17.0/node-v8.17.0-darwin-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with shasum -a 256
Checksums matched!
Now using node v8.17.0 (npm v6.13.4)
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
➜  ~ nvm use 12
Now using node v12.16.1 (npm v6.13.4)
```

Installed yarn again since I remove it when uninstalling node.

```
$ brew install yarn

...

==> Installing dependencies for yarn: node
==> Installing yarn dependency: node
==> Downloading https://homebrew.bintray.com/bottles/node-13.10.1.mojave.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/26/26af9626745131a19db5b8e67c15df58890088226680e4f80169acf941b8605d?__
######################################################################## 100.0%
==> Pouring node-13.10.1.mojave.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/13.10.1: 4,686 files, 60.4MB
==> Installing yarn
==> Downloading https://yarnpkg.com/downloads/1.22.4/yarn-v1.22.4.tar.gz
==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.com/49970642/487f6380-61e3-11ea-8294-
######################################################################## 100.0%
🍺  /usr/local/Cellar/yarn/1.22.4: 14 files, 5MB, built in 13 seconds
==> Caveats
==> node
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
```

Seems that brew automatically install node 13 for me. So I will check the node version first.

```
$ node -v
v12.16.1
```

So it's still the version installed by nvm.
