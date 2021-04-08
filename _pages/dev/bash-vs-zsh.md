---
layout: page
title: bash vs zsh
permalink: /dev/bash-vs-zsh.html
---

## Common config for both Bash and zsh

Put all user defined variables in `/etc/d3vin_profile`

```
# common vars
FOO=BAR
```

Then let zsh and bash to source this file

`/etc/profile` for bash

```
# Initial config for d3vin
source /etc/d3vin_profile
```

`/etc/zshenc` for zsh

```
# Initial config for d3vin
source /etc/d3vin_profile
```

Ref: [https://unix.stackexchange.com/questions/3428/share-aliases-and-path-setting-between-zsh-and-bash](https://unix.stackexchange.com/questions/3428/share-aliases-and-path-setting-between-zsh-and-bash)
