---
layout: page
title: oh my zsh
permalink: /dev/zsh/oh-my-zsh.html
---

## install on ubuntu 16.04

### install zsh

Follow the steps in [zsh](/dev/zsh/index.html) to install zsh first.

### install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### post installation

logout the gnome/unity session, and login again.

### plugins

`~/.zshrc`

```
plugins=(git npm)
```

### themes

install `agnoster` theme [https://github.com/agnoster/agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme)

install powerline fonts (for gnome-terminal) [https://askubuntu.com/a/283909](https://askubuntu.com/a/283909)

```
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

set zsh theme, modify `.zshrc`

```
ZSH_THEME="agnoster"
```

open a new terminal window to apply the change

## install on macOS

### Change zsh to default

Follow the steps in [zsh](/dev/zsh/index.html) to change zsh to default.

### install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### zsh theme - agnoster

[https://github.com/agnoster/agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme)

font: Menlo (patched font) [https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf)

Open the downloaded font and press "Install Font".

Set this font in iTerm2 (14px is my personal preference) (iTerm -> Preferences -> Profiles -> Text -> Change Font).

Restart iTerm2 for all changes to take effect.

Optionally set `DEFAULT_USER` to your regular username followed by prompt_context(){} in `~/.zshrc` to hide the “user@hostname” info when you’re logged in as yourself on your local machine.

```
# optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the “user@hostname” info when you’re logged in as yourself on your local machine.
DEFAULT_USER=`whoami`
```

### Solarized - iTerm2 Color Presets

[https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)

download 'Solarized Dark.itermcolors'

Open iTerm 2, open Preferences, click on the "Profiles" (formerly Addresses, formerly Bookmarks) icon in the preferences toolbar, then select the "colors" tab. Click on the "load presets" and select "import...". Select the Solarized Light or Dark theme file.

## upgrade oh-my-zsh

```
$ upgrade_oh_my_zsh
```

## References

- [https://github.com/ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [iTerm2 + Oh My Zsh + Solarized color scheme + Source Code Pro Powerline + Font Awesome + [Powerlevel10k] - (macOS)](https://gist.github.com/kevin-smets/8568070)
