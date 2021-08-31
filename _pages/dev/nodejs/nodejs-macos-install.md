---
layout: page
title: nodejs macOS install
permalink: /dev/nodejs/nodejs-macos-install.html
---

## Method 1 - Homebrew

These installation/upgrade/uninstallation steps are follow [http://blog.teamtreehouse.com/install-node-js-npm-mac](http://blog.teamtreehouse.com/install-node-js-npm-mac)

```
$ brew install node
```

```
$ brew install node
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> New Formulae
apache-ctakes       hdf5                maven@3.0           r
==> Updated Formulae
aescrypt-packetizer        gstreamer                  packetq
amazon-ecs-cli             gtk+3                      paket
angular-cli                h2                         pango
apache-geode               harfbuzz                   pari
arangodb                   haxe                       pdf2json
artifactory                hbase                      pgcli
ascii                      heimdal                    pioneer
assimp                     heroku                     poppler
awscli                     hevea                      ppsspp
bacula-fd                  imagemagick                pqiv
bibtex2html                imagemagick@6              protobuf-swift
blockhash                  immortal                   psqlodbc
bmake                      infer                      pushpin
byobu                      influxdb@0.8               pwntools
cake                       ipmitool                   pyenv
camlp4                     jenkins                    pygobject
camlp5                     jfrog-cli-go               pygobject3
citus                      jhipster                   pyqt
cmake                      jsdoc3                     python
cmark-gfm                  juju                       python3
coccinelle                 knot                       qscintilla2
commandbox                 kubernetes-cli             rebar@3
compcert                   lablgtk                    recoverjpeg
convox                     lean-cli                   redis
coq                        ledit                      redis-leveldb
cromwell                   lego                       rocksdb
crystal-lang               leveldb                    roswell
diff-so-fancy              lftp                       scalariform
digdag                     libarchive                 sip
dmtx-utils                 libgcrypt                  snappy
docker-machine             libhttpseverywhere         snzip
docker-machine-completion  libressl                   sourcekitten
etcd                       libsodium                  sparkey
expat                      logtalk                    ssreflect
exploitdb                  lolcat                     statik
faas-cli                   macvim                     stunnel
flow                       mariadb                    suricata
fluent-bit                 mat                        swagger-codegen
folly                      mednafen                   swimat
fontforge                  menhir                     telegraf
freeradius-server          mesos                      teleport
fwup                       mftrace                    termius
gcc@6                      mgba                       tfenv
gdk-pixbuf                 mldonkey                   unison
gedit                      mongo-cxx-driver           unison@2.40
geoipupdate                mosquitto                  urh
getmail                    mpv                        v8@3.15
git ✔                      mycli                      vim
git-extras                 mysql-sandbox              vim@7.4
git-fresh                  neo4j                      vips
gnatsd                     ocaml                      webpack
gnome-builder              ocamlbuild                 wine
gnupg-pkcs11-scd           ocamlsdl                   wiredtiger
gobject-introspection      one-ml                     wireshark
gst-editing-services       opam                       wpscan
gst-libav                  openrct2                   x265
gst-plugins-bad            openrtsp                   xdot
gst-plugins-base           orientdb                   youtube-dl
gst-plugins-good           osc                        zabbix
gst-plugins-ugly           osquery                    zbar
gst-python                 owfs                       zero-install
gst-rtsp-server            oysttyer                   zsh-completions
gst-validate               packer
==> Renamed Formulae
speedtest_cli -> speedtest-cli

==> Installing dependencies for node: icu4c
==> Installing node dependency: icu4c
==> Downloading https://homebrew.bintray.com/bottles/icu4c-58.2.sierra.bottle.ta
######################################################################## 100.0%
==> Pouring icu4c-58.2.sierra.bottle.tar.gz
==> Using the sandbox
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.bash_profile
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/icu4c/lib
    CPPFLAGS: -I/usr/local/opt/icu4c/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/icu4c/lib/pkgconfig

==> Summary
🍺  /usr/local/Cellar/icu4c/58.2: 242 files, 65MB
==> Installing node
==> Downloading https://homebrew.bintray.com/bottles/node-8.1.4.sierra.bottle.ta
######################################################################## 100.0%
==> Pouring node-8.1.4.sierra.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/8.1.4: 3,782 files, 44.5MB
```

```
$ node -v
v8.1.4
$ npm -v
5.0.3
```

### Upgrade npm

```
$ npm i -g npm
```

```
$ npm -v
5.3.0
```

### Upgrade nodejs

Check if the nodejs is install from brew

```
$ brew ls node
```

Start to upgrade

```
$ brew update
$ brew upgrade node
```

### Upgrade nodejs to specific version

```
$ brew unlink node
$ brew install node@12
$ brew link node@12
```

### Uninstall

```
$ brew uninstall node
```

If failed with this error, you have to uninstall yarn first.

```
$ brew uninstall node
Error: Refusing to uninstall /usr/local/Cellar/node/13.5.0
because it is required by yarn, which is currently installed.
You can override this and force removal with:
  brew uninstall --ignore-dependencies node
```

Follow the steps in [yarn](/development/yarn.html#uninstall) to uninstall yarn first.

```
$ brew uninstall node
Uninstalling /usr/local/Cellar/node/13.5.0... (4,663 files, 59.1MB)
```

But you may find that there are multiple versions of node installed by Homebrew.

```
➜  ~ ls /usr/local/Cellar/node*
/usr/local/Cellar/node@10:
10.16.0

/usr/local/Cellar/node@12:
12.14.0
```

Follow the instruction in the [Homebrew FAQ](https://docs.brew.sh/FAQ#how-do-i-uninstall-a-formula), you have to force uninstall node.

```
$ brew uninstall --force node
```

But still can see the files

```
➜  ~ ls /usr/local/Cellar/node*
/usr/local/Cellar/node@10:
10.16.0

/usr/local/Cellar/node@12:
12.14.0
```

Follow the anwser to [brew: how to delete outdated version of package](https://apple.stackexchange.com/a/238226). I found the `node@10` or `node@12` in the result.

```
➜  ~ brew cleanup
Warning: Skipping ack: most recent version 3.3.1 not installed
Warning: Skipping awscli: most recent version 2.0.0 not installed
Warning: Skipping clang-format: most recent version 2019-05-14 not installed
Warning: Skipping direnv: most recent version 2.21.2 not installed
Warning: Skipping fzf: most recent version 0.20.0 not installed
Warning: Skipping git: most recent version 2.25.0_1 not installed
Warning: Skipping glib: most recent version 2.62.4 not installed
Warning: Skipping graphviz: most recent version 2.42.2 not installed
Warning: Skipping gts: most recent version 0.7.6_2 not installed
Warning: Skipping httpie: most recent version 2.0.0 not installed
Warning: Skipping jemalloc: most recent version 5.2.1 not installed
Warning: Skipping jpeg: most recent version 9d not installed
Removing: /Users/devin.chenyang/Library/Caches/Homebrew/libevent--2.1.11_1.mojave.bottle.tar.gz... (1.2MB)
Warning: Skipping libidn2: most recent version 2.3.0 not installed
Warning: Skipping libtiff: most recent version 4.1.0 not installed
Warning: Skipping libuv: most recent version 1.34.2 not installed
Warning: Skipping libvterm: most recent version 0.1.3 not installed
Warning: Skipping md5sha1sum: most recent version 0.9.5_1 not installed
Warning: Skipping mercurial: most recent version 5.3 not installed
Warning: Skipping msgpack: most recent version 3.2.1 not installed
Warning: Skipping ncurses: most recent version 6.1_1 not installed
Removing: /Users/devin.chenyang/Library/Caches/Homebrew/ncurses--6.1.mojave.bottle.tar.gz... (2.2MB)
Warning: Skipping neovim: most recent version 0.4.3 not installed
Warning: Skipping netpbm: most recent version 10.86.09 not installed
Warning: Skipping node@10: most recent version 10.19.0 not installed
Warning: Skipping node@12: most recent version 12.16.0 not installed
Warning: Skipping pcre: most recent version 8.44 not installed
Warning: Skipping pcre2: most recent version 10.34 not installed
Warning: Skipping plantuml: most recent version 1.2020.1 not installed
Warning: Skipping postgresql: most recent version 12.2 not installed
Warning: Skipping pre-commit: most recent version 2.0.1 not installed
Warning: Skipping python: most recent version 3.7.6_1 not installed
Warning: Skipping redis: most recent version 5.0.7 not installed
Warning: Skipping ruby: most recent version 2.7.0 not installed
Warning: Skipping shellcheck: most recent version 0.7.0 not installed
Warning: Skipping sqlite: most recent version 3.31.1 not installed
Warning: Skipping tig: most recent version 2.5.0 not installed
Warning: Skipping tmux: most recent version 3.0a not installed
Warning: Skipping watchman: most recent version 4.9.0_3 not installed
Warning: Skipping webp: most recent version 1.1.0 not installed
Warning: Skipping wget: most recent version 1.20.3_2 not installed
Removing: /Users/devin.chenyang/Library/Caches/Homebrew/portable-ruby-2.6.3.mavericks.bottle.tar.gz... (9.0MB)
```

It seems that both `node@10` and `node@12` is unlicked.
So I just follow the steps in [https://stackoverflow.com/a/32904423](https://stackoverflow.com/a/32904423) to remove each version of node.

```
$ brew uninstall node@10
Uninstalling /usr/local/Cellar/node@10/10.16.0... (4,159 files, 52.9MB)
$ brew uninstall node@12
Uninstalling /usr/local/Cellar/node@12/12.14.0... (4,308 files, 57.7MB)
$ ls /usr/local/Cellar/node*
zsh: no matches found: /usr/local/Cellar/node*
```

Check that the node is fullly uninstalled.

```
$ brew ls node
Error: No such keg: /usr/local/Cellar/node
```

## Method 2 - \*.pkg

[https://nodejs.org](https://nodejs.org)

`.pkg` installer

[https://nodesource.com/blog/installing-nodejs-tutorial-mac-os-x/](https://nodesource.com/blog/installing-nodejs-tutorial-mac-os-x/)

### Uninstall

[https://gist.github.com/TonyMtz/d75101d9bdf764c890ef](https://gist.github.com/TonyMtz/d75101d9bdf764c890ef)

但是需要把第一行改成

```
$ lsbom -f -l -s -pf /var/db/receipts/org.nodejs.node.pkg.bom | while read f; do sudo rm /usr/local/${f}; done
```

[https://github.com/nodejs/help/issues/35](https://github.com/nodejs/help/issues/35)

或者直接使用这个脚本：[https://gist.github.com/nicerobot/2697848](https://gist.github.com/nicerobot/2697848) 测试发现 curl 直接运行不成功，需要复制到`uninstall-node.sh`，然后在本地运行才可以。

## Method 3 - NVM

Follow the installation steps in [NVM](/nvm.html)

Be sure to uninstall the node installed by homebrew or \*.pkg file, according to this issue [https://github.com/nvm-sh/nvm/issues/1918](https://github.com/nvm-sh/nvm/issues/1918)

## See also

- [Homebrew](/development/homebrew.html)
