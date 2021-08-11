---
layout: page
title: GitHub two user accounts
permalink: /dev/github/github-two-user-accounts.html
---

## Two user accounts

### SSH config

Generate two SSH keys

```
~/.ssh/id_rsa     # default user
~/.ssh/bar/id_rsa # not common used account
```

Add SSH keys to `~/.ssh/config`

```
# Default user account
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa

# Another user account
Host github.com-bar
  HostName github.com
  User git
  IdentityFile ~/.ssh/bar/id_rsa
```

To test SSH connection between local and GitHub

```
$ ssh -T git@github.com
Hi Default User! You've successfully authenticated, but GitHub does not provide shell access.
$ ssh -T git@github.com-bar
Hi Bar! You've successfully authenticated, but GitHub does not provide shell access.
```

### Git config

Add the default user to global Git config `~/.gitconfig`

```
[user]
        name = Default User
        email = 1234567+defaultuser@users.noreply.github.com
```

Add the not common used user to project's gitconfig file

```
$ cd ~/source/github/bar/bar-test
$ vim .git/config
```

Add following

```
[remote "origin"]
        url = git@github.com-bar:bar/bar-test.git
[user]
        name = Bar
        email = 1234567+bar@users.noreply.github.com
```

### Git clone

To git clone repo from default user account

```
$ cd ~/source/github/defaultuser
$ git clone git@github.com:defaultuser/hello-world.git
```

To git clone repo from another user account. If the URL is copy from GitHub web UI, then need change `@github.com:` to `@github.com-bar:`.

```
$ cd ~/source/github/bar
$ git clone git@github.com-bar:bar/bar-test.git
```

Ref:

- https://gist.github.com/oanhnn/80a89405ab9023894df7
- https://gist.github.com/jexchan/2351996
