---
layout: page
title: zsh
permalink: /dev/zsh/index.html
---

## iterm

最近 IT 不知道搞什么鬼，公司的 MBP 中的默认 shell 总是被修改为 bash，今天测试了一下，刚改完不到 10 分钟就又退回 zsh 了

[https://stackoverflow.com/a/24991403/4685522](https://stackoverflow.com/a/24991403/4685522)

Go to iTerm2 -> Preferences -> Profiles -> Default and in the General Tab set the Command to /bin/zsh ( or maybe /usr/local/bin/zsh ) instead of Login shell.

Update 2017-12-18

今天发现使用这种方法启动的 zsh 在 PATH 设置上会又区别，比如缺少`/usr/local/bin`，然后就调用不到使用 brew 安装的 neovim 了

这是使用 iterm 使用 zsh 直接打开新的 tab 页面

```
➜  ~ echo $PATH
/usr/bin:/bin:/usr/sbin:/sbin:/Users/devin.chenyang/opt/arcanist/bin/:/usr/local/opt/fzf/bin
```

这是使用`ch`来切换 shell

```
➜  ~ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/devin.chenyang/opt/arcanist/bin/:/usr/local/opt/fzf/bin
```

可能跟 Open Directory server 有关系 [https://apple.stackexchange.com/a/88279](https://apple.stackexchange.com/a/88279)

## FAQ

Put user defined functions and variables in ~/.zshenv, not in ~/.zshrc, otherwise they will not found when running a shell script.

Check this document [http://zsh.sourceforge.net/Intro/intro_3.html](http://zsh.sourceforge.net/Intro/intro_3.html) for more details.

There is a question related to this one. [https://unix.stackexchange.com/questions/126956/functions-defined-in-zshrc-not-found-when-running-script](https://unix.stackexchange.com/questions/126956/functions-defined-in-zshrc-not-found-when-running-script)

## zsh Configuration Files

| all users     | user      | login shell | interactive shell | scripts | Terminal.app |
| :------------ | :-------- | ----------- | ----------------- | ------- | ------------ |
| /etc/zshenv   | .zshenv   | v           | v                 | v       | v            |
| /etc/zprofile | .zprofile | v           | x                 | x       | v            |
| /etc/zshrc    | .zshrc    | v           | v                 | x       | v            |
| /etc/zlogin   | .zlogin   | v           | x                 | x       | v            |
| /etc/zlogout  | .zlogout  | v           | x                 | x       | v            |

There are five startup files that zsh will read commands from:

```
$ZDOTDIR/.zshenv
$ZDOTDIR/.zprofile
$ZDOTDIR/.zshrc
$ZDOTDIR/.zlogin
$ZDOTDIR/.zlogout
```

## See also

- [zsh install](/dev/zsh/install.html)

## References

- [https://wiki.ubuntu.com/ChangingShells](https://wiki.ubuntu.com/ChangingShells)
- [https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [An Introduction to the Z Shell - Startup Files](http://zsh.sourceforge.net/Intro/intro_3.html)
