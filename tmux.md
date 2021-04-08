---
layout: page
title: tmux
---

## simple run

```
tmux
```

## prefix key

prefix key + command key

default prefix key is `Ctrl+b`

## common use

- split pane: `<prefix key>` + `%`
- split pane horizontally: `<prefix key>` + `"`
- switch between pane: `<prefix key>` + `o`

```
tmux # start a new session
Ctrl+B, then type :detach-client # leave current session
tmux ls # list sessions
tmux attach -t 0 # back to session
```

## list sessions

```
$ tmux ls
0: 1 windows (created Wed Nov 13 15:03:04 2019)
2: 1 windows (created Wed Nov 13 15:03:49 2019)
```

## leave sessions

Ctrl+B, then type `:detach-client`

## Attach back to session

```
$ tmux attach -t 0
```

## Quite or exit session

```
exit
```

## See also

- [tmux installation](/tmux-installation)

## References

- [http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/)
- [http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/](http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)