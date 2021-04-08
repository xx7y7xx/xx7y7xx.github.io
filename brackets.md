---
title: Brackets
layout: page
---

## Install Brackets on Ubuntu 16.04

Dependency error when install deb from [brackets.io](http://brackets.io/)

```
chenyang@PC:~/Downloads$ sudo dpkg -i Brackets.Release.1.7.64-bit.deb 
[sudo] password for chenyang: 
Selecting previously unselected package brackets.
(Reading database ... 210978 files and directories currently installed.)
Preparing to unpack Brackets.Release.1.7.64-bit.deb ...
Unpacking brackets (1.7.0-16898) ...
dpkg: dependency problems prevent configuration of brackets:
 brackets depends on libgcrypt11 (>= 1.4.5); however:
  Package libgcrypt11 is not installed.

dpkg: error processing package brackets (--install):
 dependency problems - leaving unconfigured
Processing triggers for hicolor-icon-theme (0.15-0ubuntu1) ...
Errors were encountered while processing:
 brackets
chenyang@PC:~/Downloads$ sudo apt-get install libgcrypt11
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Package libgcrypt11 is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'libgcrypt11' has no installation candidate
```

### Method 1

[https://github.com/adobe/brackets/issues/12380#issuecomment-225330118](https://github.com/adobe/brackets/issues/12380#issuecomment-225330118)

Install `libgcrypt11` from [Canonical LaunchPad website](https://launchpadlibrarian.net/201289896/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb), then install brackets.deb again.

### Method 2

[https://github.com/adobe/brackets/issues/12380#issuecomment-231380243](https://github.com/adobe/brackets/issues/12380#issuecomment-231380243)

Install Brackets via PPA.

```
sudo add-apt-repository ppa:webupd8team/brackets
sudo apt-get update
sudo apt-get install brackets
```

## Exclude folders like node_modules

Use this extensions: [exclude-folders](https://github.com/gruehle/exclude-folders)

Reference: [https://github.com/adobe/brackets/wiki/Large-Projects#exclude-folders-like-node_modules](https://github.com/adobe/brackets/wiki/Large-Projects#exclude-folders-like-node_modules)

## plugins

- Minimap
- Bracket Gits
- Brackets Icons
- Brackets Bookmarks
- [brackets-editorconfig](https://github.com/kidwm/brackets-editorconfig/)
- [spell-check](https://github.com/couzteau/SpellCheck)
- [wakatime](https://github.com/wakatime/brackets-wakatime)
- [Markdown Preview](https://github.com/gruehle/MarkdownPreview) - A Brackets extension that provides a live preview of markdown documents.

ps: **Brackets File Icons** is no longer maintained.

## config

### change indent char and size

change in the bottom-right of Brackets editor, OR change config:

```js
{
  "spaceUnits": 2,
  "useTabChar": false
}
```