---
layout: page
title: fzf
---

## install on macOS

10.12

```
ITCN000075-MAC:~ devin.chenyang$ fzf
-bash: fzf: command not found
```

```
ITCN000075-MAC:~ devin.chenyang$ brew info fzf
fzf: stable 0.17.3 (bottled), HEAD
Command-line fuzzy finder written in Go
https://github.com/junegunn/fzf
Not installed
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/fzf.rb
==> Dependencies
Build: glide ✘, go ✘
==> Caveats
To install useful keybindings and fuzzy completion:
  /usr/local/opt/fzf/install

To use fzf in Vim, add the following line to your .vimrc:
  set rtp+=/usr/local/opt/fzf
```

```
ITCN000075-MAC:~ devin.chenyang$ brew install fzf
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 3 taps (caskroom/cask, codekitchen/dinghy, homebrew/core).
==> New Formulae
ddgr                                                google-authenticator-libpam                         igv                                                 libidn2                                             mongodb@3.4                                         node@8
==> Updated Formulae
codekitchen/dinghy/dinghy ✔    blockhash                      elasticsearch@5.6              gnome-builder                  heartbeat                      kyua                           macvim                         osc                            pyenv                          tasksh
icu4c ✔                        bmake                          emscripten                     gnome-recipes                  heimdal                        latexila                       mapnik                         osm2pgsql                      pygobject                      tectonic
node ✔                         byobu                          enchant                        gnuplot                        heroku                         lbdb                           menhir                         osquery                        python-markdown                telegraf
openssl ✔                      carthage                       etcd                           gnuplot@4                      hfstospell                     lgogdownloader                 meson                          osrm-backend                   qbs                            thrift
pre-commit ✔                   ceres-solver                   fabio                          gopass                         highlight                      libassuan                      metricbeat                     packer                         qt                             tinyxml2
shellcheck ✔                   certbot                        fcitx-remote-for-osx           gosu                           html-xml-utils                 libcdio                        mgba                           packetbeat                     radare2                        tmuxinator-completion
abcmidi                        chakra                         fd                             gperftools                     httest                         libcdr                         mimic                          paket                          redis                          tracebox
ace                            chamber                        ffmpeg                         gradle                         imagemagick                    liblcf                         minio-mc                       pandoc                         reminiscence                   traefik
ack                            chromedriver                   fibjs                          graphicsmagick                 imagemagick@6                  liblinear                      mockserver                     pazpar2                        rocksdb                        treefrog
acmetool                       clhep                          filebeat                       grpc                           imapfilter                     libmicrohttpd                  mongodb                        pdftoedn                       rpm                            urh
advancemame                    cling                          firebase-cli                   gsoap                          instead                        libmspub                       mono                           pdftoipe                       rtv                            vala
angular-cli                    clojure                        flow                           gspell                         jboss-forge                    libphonenumber                 monotone                       pdns                           rustup-init                    vips
ansible                        coffeescript                   fn                             gst-editing-services           jenkins                        libqalculate                   mpd                            pdnsrec                        s-nail                         widelands
ansible-lint                   commandbox                     folly                          gst-libav                      jenkins-lts                    libquvi                        mpv                            peco                           scamper                        wireguard-tools
apm-server                     corebird                       fpc                            gst-plugins-bad                jhipster                       libraw                         mrboom                         pegtl                          securefs                       wireshark
aptly                          corsixth                       freeling                       gst-plugins-base               joplin                         librdkafka                     mujs                           percona-server@5.5             sfk                            wtf
arangodb                       couchdb                        freeswitch                     gst-plugins-good               jruby                          libswiften                     natalie                        percona-server@5.6             shpotify                       xmoto
armadillo                      couchdb-lucene                 fuse-emulator                  gst-plugins-ugly               just                           libtensorflow                  ndpi                           phoronix-test-suite            sile                           xtensor
artifactory                    cromwell                       game-music-emu                 gst-python                     kibana                         libtiff                        node-build                     pilosa                         slackcat                       yaz
assimp                         dcm2niix                       gandi.cli                      gst-rtsp-server                kibana@5.6                     libtins                        node@4                         pinentry                       sql-translator                 ydcv
ats2-postiats                  dialog                         gearman                        gst-validate                   knot-resolver                  libvirt                        node@6                         pioneer                        suite-sparse                   yle-dl
aws-sdk-cpp                    diff-pdf                       gedit                          gstreamer                      kompose                        libvisio                       notmuch                        pipenv                         sundials                       you-get
azure-cli                      dmtx-utils                     git-town                       gtk-doc                        kontena                        libxc                          ntopng                         planck                         suricata                       youtube-dl
bartycrouch                    dnsdist                        gitbucket                      gtksourceview3                 kops                           logstash                       nvm                            poppler                        swift                          zbar
bazel                          docfx                          gitg                           gtkspell3                      krb5                           logstash@5.6                   octave                         ppsspp                         swift-protobuf                 zebra
bedtools                       dpkg                           gjstest                        hadolint                       kube-aws                       lsyncd                         ohcount                        pqiv                           swiftformat                    zorba
bfg                            druid                          global                         haproxy                        kubeless                       lua                            oniguruma                      presto                         syncthing                      zsh-autosuggestions
binaryen                       dwdiff                         glog                           harfbuzz                       kubernetes-cli                 lua@5.1                        onscripter                     protobuf                       sysbench
bitrise                        elasticsearch                  gmime                          haskell-stack                  kyoto-tycoon                   lutok                          optipng                        pulledpork                     tarantool
==> Deleted Formulae
lua@5.3

==> Downloading https://homebrew.bintray.com/bottles/fzf-0.17.3.sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring fzf-0.17.3.sierra.bottle.tar.gz
==> Caveats
To install useful keybindings and fuzzy completion:
  /usr/local/opt/fzf/install

To use fzf in Vim, add the following line to your .vimrc:
  set rtp+=/usr/local/opt/fzf
==> Summary
🍺  /usr/local/Cellar/fzf/0.17.3: 17 files, 3.2MB
```

```
ITCN000075-MAC:~ devin.chenyang$ brew --prefix
/usr/local
```

```
ITCN000075-MAC:~ devin.chenyang$ fzf --version
0.17.3 (brew)
```

### upgrade fzf

```
brew update; brew reinstall fzf
```

ugrade vim plugins, in vim, run

```
:PlugUpdate fzf
```

## usage

```
$ cd project_dir
$ fzf
```

will show a list of files in project_dir

select a file, e.g. `config/env.js`, press enter

will quit fzf, and print

```
ITCN000075-MAC:geo-tools devin.chenyang$ fzf
config/env.js
```

To install useful key bindings and fuzzy completion:

```
ITCN000075-MAC:geo-tools devin.chenyang$ $(brew --prefix)/opt/fzf/install
Downloading bin/fzf ...
  - Already exists
  - Checking fzf executable ... 0.17.3
Do you want to enable fuzzy auto-completion? ([y]/n) y
Do you want to enable key bindings? ([y]/n) y

Generate ~/.fzf.bash ... OK
Generate ~/.fzf.zsh ... OK

Do you want to update your shell configuration files? ([y]/n) y

Update /Users/devin.chenyang/.bashrc:
  - [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    - Already exists: line #1

Update /Users/devin.chenyang/.zshrc:
  - [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    - Already exists: line #102

Finished. Restart your shell or reload config file.
   source ~/.bashrc  # bash
   source ~/.zshrc   # zsh

Use uninstall script to remove fzf.

For more information, see: https://github.com/junegunn/fzf
```

Note: macOS use `.bash_profile` not `.bashrc`

[?] how to use Ctrl+T to paster the result

add `**` and press `<Tab>` will trigger fzf in bash/zsh

```
ITCN000075-MAC:table devin.chenyang$ ls **<Tab>
```


```
ITCN000075-MAC:table devin.chenyang$ ls **
>
  96/96
  .
  .editorconfig
  .gitignore
  .travis.yml
  assets
  assets/animation.less
  assets/bordered.less
  assets/index.less
  examples
  examples/animation.html
  examples/animation.js
  examples/childrenIndent.html
  examples/childrenIndent.js
  examples/className.html
  examples/className.js
  examples/colspan-rowspan.html
  examples/colspan-rowspan.js
  examples/column-resize.html
  examples/column-resize.js
  examples/dropdown.html
> examples/dropdown.js
  examples/expandedRowRender.html
  examples/expandedRowRender.js
  examples/fixedColumns-auto-height.html
  examples/fixedColumns-auto-height.js
  examples/fixedColumns.html
  examples/fixedColumns.js
  examples/fixedColumnsAndHeader.html
  examples/fixedColumnsAndHeader.js
  examples/fixedColumnsAndHeaderSyncRowHeight.html
```

```
ITCN000075-MAC:table devin.chenyang$ ls examples/dropdown.js
```

## neovim

( another plugin is [https://github.com/ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) )

```
ITCN000075-MAC:table devin.chenyang$ ls -l /usr/local/opt/fzf
lrwxr-xr-x  1 devin.chenyang  admin  20 Dec 13 12:47 /usr/local/opt/fzf -> ../Cellar/fzf/0.17.3
```

```
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
```

```
:PlugInstall
```

How to use

List all files in current dir

```
:Files
```

Select a file with up and down key, or with mouse

Enter to open file in current window(tab), Ctrl+T to open file in a new window(tab)

## References

- [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)
- [https://github.com/ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)