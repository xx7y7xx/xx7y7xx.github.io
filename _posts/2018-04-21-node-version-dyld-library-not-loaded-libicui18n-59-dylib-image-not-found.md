---
layout: post
title: "node --version -- dyld: Library not loaded libicui18n.59.dylib - image not found"
---

## Error

```
$ node --version
dyld: Library not loaded: /usr/local/opt/icu4c/lib/libicui18n.59.dylib
  Referenced from: /usr/local/bin/node
  Reason: image not found
[1]    11073 abort      node --version
```

## Solution: `brew update && brew upgrade`

```
$ brew update
Updated 2 taps (homebrew/core, caskroom/cask).
==> New Formulae
deark                                                       gitlab-gem                                                  mkl-dnn
==> Updated Formulae
cmake ✔                  caffe                    flann                    juju                     monero                   phplint                  src
libgpg-error ✔           cake                     flow                     kallisto                 mongodb                  phpunit                  subversion
libtiff ✔                calicoctl                fn                       kedge                    mutt                     pioneers                 swift
libuv ✔                  camlp5                   fobis                    keychain                 mypy                     planck                   swiftformat
yarn ✔                   chronograf               folly                    kibana                   mysql                    poco                     telegraf
abcmidi                  clac                     freetds                  kompose                  mysql-sandbox            poppler                  testssl
abyss                    clamav                   fuego                    kotlin                   mysql@5.5                povray                   timelimit
akamai                   clojure                  futhark                  kubeless                 mysql@5.6                pqiv                     tippecanoe
amazon-ecs-cli           cockatrice               gegl                     kubernetes-cli           nanopb-generator         presto                   tmux
amqp-cpp                 composer                 ghc                      launch                   ncmpcpp                  proguard                 tmuxinator-completion
annie                    consul                   gjs                      lcdf-typetools           nco                      pstoedit                 trafficserver
ansible                  convox                   globus-toolkit           ledger                   ncview                   py2cairo                 tup
apache-arrow             cython                   glslang                  lgogdownloader           netcdf                   py3cairo                 txr
apibuilder-cli           dartsim                  gmt                      libbi                    nghttp2                  pyexiv2                  typescript
apm-server               diff-pdf                 gmt@4                    libbitcoin               nginx                    qd                       uhd
arangodb                 discount                 gnuradio                 libgphoto2               node-build               qmmp                     upscaledb
armadillo                dmd                      go-jira                  libgsf                   nomad                    qtfaststart              vala
armor                    dnscrypt-proxy           gollum                   libhttpseverywhere       nudoku                   quantlib                 vim
artifactory              dnsdist                  gpgme                    liblwgeom                nvm                      rancher-cli              vtk
asio                     docker2aci               gphoto2                  libmagic                 ocrmypdf                 recoverjpeg              webpack
aspectj                  dockviz                  gr-osmosdr               libmatio                 octave                   remctl                   wesnoth
atlassian-cli            dub                      gradle                   libphonenumber           oniguruma                rhash                    widelands
auditbeat                duti                     grails                   librealsense             openimageio              scala@2.11               wireguard-tools
aws-shell                dynare                   grpc                     libsoxr                  osquery                  sdcc                     wla-dx
babeld                   elasticsearch            gtk+3                    libstfl                  osrm-backend             sfk                      xonsh
bacula-fd                elasticsearch@2.4        haproxy                  libtorrent-rasterbar     packetbeat               shml                     xxhash
bartycrouch              elasticsearch@5.6        hcloud                   links                    packmol                  shogun                   ykman
bibtex2html              embulk                   hdf5                     log4cplus                paket                    silk                     yle-dl
binaryen                 emscripten               heartbeat                logstash                 pam-u2f                  singular                 you-get
bitcoin                  erlang                   heroku                   lolcat                   pam_yubico               skaffold                 youtube-dl
blueutil                 etsh                     hlint                    macvim                   pcl                      skafos                   znapzend
boost                    feh                      hugo                     mapnik                   pcre2                    softhsm                  zsh
boost-bcp                field3d                  imlib2                   metabase                 pdal                     sonarqube
boost-build              fig2dev                  influxdb                 metaproxy                pdftoedn                 source-highlight
boost-mpi                file-formula             jansson                  metricbeat               pdftoipe                 sparse
boost-python             filebeat                 jbake                    mint                     percona-server-mongodb   spotbugs
boost-python3            fio                      jenkins                  mkvtoolnix               perl@5.18                sqliteodbc
caddy                    firebase-cli             jpegoptim                modd                     pgpool-ii                sratoolkit
==> Renamed Formulae
geth -> ethereum
==> Deleted Formulae
monotone
```

```
$ brew upgrade
==> Upgrading 16 outdated packages, with result:
lame 3.99.5 -> 3.100, libtiff 4.0.9_2 -> 4.0.9_3, coreutils 8.27 -> 8.29, ffmpeg 3.3.1 -> 3.4.2, xvid 1.3.4 -> 1.3.5, unibilium 1.2.1 -> 2.0.0, cmake 3.11.0 -> 3.11.1, libuv 1.17.0 -> 1.20.1, libgpg-error 1.27 -> 1.29, yarn 1.2.1 -> 1.6.0, dialog 1.3-20170509 -> 1.3-20171209, x264 r2748 -> r2854, node 8.7.0 -> 9.11.1, neovim 0.2.2 -> 0.2.2_1, bash-completion 1.3_2 -> 1.3_3, automake 1.15 -> 1.16.1
==> Upgrading automake
==> Downloading https://homebrew.bintray.com/bottles/automake-1.16.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring automake-1.16.1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/automake/1.16.1: 131 files, 3MB
==> Upgrading libtiff
==> Downloading https://homebrew.bintray.com/bottles/libtiff-4.0.9_3.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring libtiff-4.0.9_3.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/libtiff/4.0.9_3: 246 files, 3.5MB
==> Upgrading coreutils
==> Downloading https://homebrew.bintray.com/bottles/coreutils-8.29.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring coreutils-8.29.high_sierra.bottle.tar.gz
==> Caveats
All commands have been installed with the prefix 'g'.

If you really need to use these commands with their normal names, you
can add a "gnubin" directory to your PATH from your bashrc like:

    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

Additionally, you can access their man pages with normal names if you add
the "gnuman" directory to your MANPATH from your bashrc as well:

    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

==> Summary
🍺  /usr/local/Cellar/coreutils/8.29: 430 files, 8.9MB
==> Upgrading ffmpeg
==> Installing dependencies for ffmpeg: lame, x264, xvid
==> Installing ffmpeg dependency: lame
==> Downloading https://homebrew.bintray.com/bottles/lame-3.100.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring lame-3.100.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/lame/3.100: 27 files, 2.1MB
==> Installing ffmpeg dependency: x264
==> Downloading https://homebrew.bintray.com/bottles/x264-r2854.high_sierra.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring x264-r2854.high_sierra.bottle.1.tar.gz
🍺  /usr/local/Cellar/x264/r2854: 11 files, 3.4MB
==> Installing ffmpeg dependency: xvid
==> Downloading https://homebrew.bintray.com/bottles/xvid-1.3.5.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring xvid-1.3.5.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/xvid/1.3.5: 10 files, 1.2MB
==> Installing ffmpeg
==> Downloading https://homebrew.bintray.com/bottles/ffmpeg-3.4.2.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring ffmpeg-3.4.2.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/ffmpeg/3.4.2: 248 files, 50.9MB
==> Upgrading unibilium
==> Downloading https://homebrew.bintray.com/bottles/unibilium-2.0.0.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring unibilium-2.0.0.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/unibilium/2.0.0: 63 files, 248.5KB
==> Upgrading cmake
==> Downloading https://homebrew.bintray.com/bottles/cmake-3.11.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring cmake-3.11.1.high_sierra.bottle.tar.gz
==> Caveats
Emacs Lisp files have been installed to:
  /usr/local/share/emacs/site-lisp/cmake
==> Summary
🍺  /usr/local/Cellar/cmake/3.11.1: 2,363 files, 32.7MB
==> Upgrading libuv
==> Downloading https://homebrew.bintray.com/bottles/libuv-1.20.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring libuv-1.20.1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/libuv/1.20.1: 57 files, 2.8MB
==> Upgrading libgpg-error
==> Downloading https://homebrew.bintray.com/bottles/libgpg-error-1.29.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring libgpg-error-1.29.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/libgpg-error/1.29: 25 files, 805.6KB
==> Upgrading yarn
==> Installing dependencies for yarn: node
==> Installing yarn dependency: node
==> Downloading https://homebrew.bintray.com/bottles/node-9.11.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring node-9.11.1.high_sierra.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/9.11.1: 5,125 files, 49.7MB
==> Installing yarn
==> Downloading https://yarnpkg.com/downloads/1.6.0/yarn-v1.6.0.tar.gz
==> Downloading from https://github.com/yarnpkg/yarn/releases/download/v1.6.0/yarn-v1.6.0.tar.gz
######################################################################## 100.0%
curl: (7) Failed to connect to github-production-release-asset-2e65be.s3.amazonaws.com port 443: Operation timed out
Error: Failed to download resource "yarn"
Download failed: https://yarnpkg.com/downloads/1.6.0/yarn-v1.6.0.tar.gz
==> Upgrading dialog
==> Downloading https://homebrew.bintray.com/bottles/dialog-1.3-20171209.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring dialog-1.3-20171209.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/dialog/1.3-20171209: 14 files, 823.3KB
==> Upgrading neovim
==> Downloading https://homebrew.bintray.com/bottles/neovim-0.2.2_1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring neovim-0.2.2_1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/neovim/0.2.2_1: 1,374 files, 17.6MB
==> Upgrading bash-completion
==> Downloading https://homebrew.bintray.com/bottles/bash-completion-1.3_3.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring bash-completion-1.3_3.high_sierra.bottle.tar.gz
==> Caveats
Add the following line to your ~/.bash_profile:
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/bash-completion/1.3_3: 189 files, 608.2KB
```

```
$ brew upgrade
==> Upgrading 1 outdated package, with result:
yarn 1.2.1 -> 1.6.0
==> Upgrading yarn
==> Downloading https://yarnpkg.com/downloads/1.6.0/yarn-v1.6.0.tar.gz
==> Downloading from https://github.com/yarnpkg/yarn/releases/download/v1.6.0/yarn-v1.6.0.tar.gz
######################################################################## 100.0%
🍺  /usr/local/Cellar/yarn/1.6.0: 14 files, 4.1MB, built in 45 seconds
```

```
$ node --version
v9.11.1
```
