---
layout: page
title: macOS
---

## must install tools (for development)

- [homebrew](/homebrew.html)
- `brew install wget` (The installation script of other tools may use `wget` to download file from github.com)
- `brew install md5sha1sum` ( could use `md5sum` command line tools )
- https://www.intel.com/content/www/us/en/developer/articles/tool/power-gadget.html

## Init

### How to tab between buttons on an Mac OS X dialog box

- [https://superuser.com/a/473145](https://superuser.com/a/473145)
- [https://superuser.com/a/547501](https://superuser.com/a/547501)

## How to exclude node_modules dir from "All My Files"

How do I hide files from “All My Files” in Mac OS X v10.7 (Lion)

[https://superuser.com/questions/322142/how-do-i-hide-files-from-all-my-files-in-mac-os-x-v10-7-lion](https://superuser.com/questions/322142/how-do-i-hide-files-from-all-my-files-in-mac-os-x-v10-7-lion)

## can’t be opened because it is from an unidentified developer.

Hold down the Control key and click the application icon. From the contextual menu choose Open.

[http://www.iclarified.com/28180/how-to-open-applications-from-unidentified-developers-in-mac-os-x-mountain-lion](http://www.iclarified.com/28180/how-to-open-applications-from-unidentified-developers-in-mac-os-x-mountain-lion)

## Common Software

- diff
  - [http://www.sourcegear.com/diffmerge/index.html](http://www.sourcegear.com/diffmerge/index.html)
  - P4Merge - [https://www.perforce.com/downloads/visual-merge-tool](https://www.perforce.com/downloads/visual-merge-tool)
- CPU temperature [http://fannywidget.com/](http://fannywidget.com/)
- iTerm2 [iterm2](/iterm2.html)
- zsh [zsh](/dev/zsh/index.html)
- search (replace spotlight) [https://www.alfredapp.com/](https://www.alfredapp.com/) [reorder spotlight search results](https://apple.stackexchange.com/a/216786)
- text editor - open TextEdit, `Preferences > Format > Plain text`
- cpu monitor/stat - MenuMeters [https://github.com/yujitach/MenuMeters](https://github.com/yujitach/MenuMeters)
- DVD Rip - HandBrake [https://github.com/HandBrake/HandBrake](https://github.com/HandBrake/HandBrake)

## Bash git completion

macOS shiped with git by default

```
$ git --version
git version 2.13.5 (Apple Git-94)
```

```
brew install git bash-completion
```

open a new terminal window, you will get the new git

```
$ git --version
git version 2.15.0
```

Add contents below to `~/.bash_profile`

```
# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
```

ref:

- [https://apple.stackexchange.com/a/92637](https://apple.stackexchange.com/a/92637)
- [https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)

## XCode

[https://itunes.apple.com/us/app/xcode/id497799835?mt=12](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)

## Remote Desktop Client for Windows

- [Parallels Client](http://www.parallels.com/products/ras/download/client/#mac)
- [Remote Desktop Client Preview for Mac supports multiple monitors and more](https://blogs.technet.microsoft.com/enterprisemobility/2016/03/30/remote-desktop-client-preview-for-mac-supports-multiple-monitors-and-more/)

## command line tools

### md5

```
echo -n "this will be encrypted" | md5
md5 -qs 'this will be encrypted'
```

[https://stackoverflow.com/a/8996843/4685522](https://stackoverflow.com/a/8996843/4685522)

## disable save-as dialog animation

for 10.12 (macOS Sierra )

```
defaults write NSGlobalDomain NSWindowResizeTime .001
```

[https://apple.stackexchange.com/a/142734](https://apple.stackexchange.com/a/142734)
[https://www.defaults-write.com/10-terminal-commands-to-speed-up-macos-sierra-on-your-mac/](https://www.defaults-write.com/10-terminal-commands-to-speed-up-macos-sierra-on-your-mac/)

## Install Chromium (not chrome!) on Mac OS X # {#install-chromium}

### method 1

use dmg file directly

[http://www.freesmug.org/chromium](http://www.freesmug.org/chromium)

### method 2

```
$ brew tap domt4/chromium
$ brew cask install mac-chromium
$ brew tap buo/cask-upgrade
```

`brew-cask-upgrade` is a command-line tool for upgrading every outdated app installed by [Homebrew Cask](https://caskroom.github.io/).

how to update `mac-chromium`

```
➜  ~ brew cu mac-chromium
==> Options
Include auto-update (-a): false
Include latest (-f): false
==> Updating Homebrew
Already up-to-date.
==> Finding outdated apps
     Cask          Current  Latest   A/U    Result
1/1  mac-chromium  c514074  c514074       [   OK   ]
```

Refs: [https://apple.stackexchange.com/a/215426](https://apple.stackexchange.com/a/215426)

uninstall

```
➜  ~ brew cask uninstall mac-chromium
==> Uninstalling Cask mac-chromium
==> Removing App '/Applications/Chromium.app'.
==> Unlinking Binary '/usr/local/bin/chromium'.
```

## prevent your Mac from automatically going to sleep

- [Caffeine](http://lightheadsw.com/caffeine/)
- [insomniax](http://semaja2.net/ye-ol-projects/insomniaxinfo/)

## python # {#python}

[python](/python.html)

## disk (file system) case sensitive

[https://apple.stackexchange.com/a/71360](https://apple.stackexchange.com/a/71360)

```
$ diskutil info /
...
   Content (IOContent):      Apple_HFS
   File System Personality:  Journaled HFS+
   Type (Bundle):            hfs
   Name (User Visible):      Mac OS Extended (Journaled)
   Journal:                  Journal size 40960 KB at offset 0x1a388000
   Owners:                   Enabled
...
```

```
➜  tmp pwd
/Users/devin.chenyang/tmp
➜  tmp touch A
➜  tmp ll
total 0
-rw-r--r--  1 devin.chenyang  devin.chenyang     0B Nov 29 12:39 A
➜  tmp touch a
➜  tmp ll
total 0
-rw-r--r--  1 devin.chenyang  devin.chenyang     0B Nov 29 12:39 A
```

```
➜  ~ cd /tmp
➜  /tmp touch a
➜  /tmp touch A
➜  /tmp ll a A
-rw-r--r--  1 devin.chenyang  wheel     0B Nov 29 12:30 A
-rw-r--r--  1 devin.chenyang  wheel     0B Nov 29 12:30 a
```

solution is [https://stackoverflow.com/a/20907647/4685522](https://stackoverflow.com/a/20907647/4685522)

```
git mv a A
```

## force spotlight to re-index

I just installed a new version brackets. When I search it in spotlight, it disappeared

```
sudo mdutil -a -i off
sudo mdutil -a -i on
```

[https://apple.stackexchange.com/a/142523](https://apple.stackexchange.com/a/142523)

and a another way:

[https://apple.stackexchange.com/a/237498](https://apple.stackexchange.com/a/237498)

you could also use [https://www.alfredapp.com/](https://www.alfredapp.com/) to replace spotlight

## Show macOS version

```
ip-10-6-2-171:~ devin.chenyang$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.12.6
BuildVersion:	16G1036
```

## 鼠标指针自动往(224,1176)跳转

经常是连续跳两次，间隔 1 ～ 2s，也就是第一次跳过来，然后手动挪开，然后又跳过来了，坐标始终是(224,1176)。有的时候是跳转一次。

屏幕分辨率是 2560x1440, 27 寸 DELL U2715H

内置显示器分辨率是 2880x1800

Update 2018-03-14: 现在 macOS 已经更新到了 10.12.6，没有再次出现这个问题。

Update 2018-03-27: 现在是 10.12.6 (16G1212) 但是最近又开始出现这个问题了。跳转到(840,966)/(2560x1440)

```
2018-03-28
4:43
6:20

2018-03-29
12:39 - 1 jump
4:21 - 1 jump
4:47 - 1 jump
5:57 - 1 jump
6:37 - 1 jump

2018-03-30
12:49 - 1 jump
1:06 - 1 jump
4:35 - 1 jump
4:57 - 1 jump

2018-04-04
After a mac update and a reboot, there seems no jumping now. current version is: 10.12.6 (16G1314)
```

## Shortcut

Put macOS (10.12) to sleep `Ctrl+Shift+Fn+F12`

## `locate` command

What's the equivalent of Linux's `updatedb` command for the Mac?

```
sudo /usr/libexec/locate.updatedb
```

## `split` command

```
split -b 2m "foo.tsv" "bar-"
```

`2m` mean 2MB.

will get two new files

```
bar-aa
bar-ab
```

## Python 2.7 already deprecated in macOS Catalina (Version 10.15)

Python 2.7 will be removed in macOS (Version 10.16)

[macOS Catalina 10.15 Release Notes

- Scripting Language Runtimes - Deprecations](https://developer.apple.com/documentation/macos_release_notes/macos_catalina_10_15_release_notes#3318257)

## Fixing Tags Encoding of map3 files

Tag Editor - [https://amvidia.com/guides/music-organising/fixing-tags-encoding](https://amvidia.com/guides/music-organising/fixing-tags-encoding)

But the free version of "Tag Editor" cannot support bulk fixing multiple mp3 files.

Another tool I tried is MusicBrainz Picard ([https://picard.musicbrainz.org/](https://picard.musicbrainz.org/)), but it doesn't support fixing encoding. But we could use it to bulk rename mp3 tags.

## See also

- [Brew](/homebrew.html)
- [macOS High sierra](/macos-high-sierra.html)

## References

- [`brew tap`](https://docs.brew.sh/brew-tap.html) adds more repositories to the list of formulae that brew tracks, updates, and installs from.
- [https://github.com/buo/homebrew-cask-upgrade](https://github.com/buo/homebrew-cask-upgrade)
