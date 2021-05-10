---
layout: page
title: github
---

## github workflow

### Merging an upstream repository into your fork

[https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/)

```
cd react-bootstrap-table
git pull https://github.com/AllenFang/react-bootstrap-table.git
git push
```

## Two user accounts

### SSH config

Generate two SSH keys

```
~/.ssh/foo/id_rsa
~/.ssh/bar/id_rsa
```

Add SSH keys to `~/.ssh/config`

```
# Default user account
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/foo/id_rsa

# Another user account
Host github.com-bar
  HostName github.com
  User git
  IdentityFile ~/.ssh/bar/id_rsa
```

To test SSH connection between local and GitHub

```
$ ssh -T git@github.com
Hi foo! You've successfully authenticated, but GitHub does not provide shell access.
$ ssh -T git@github.com-bar
Hi bar! You've successfully authenticated, but GitHub does not provide shell access.
```

### Git config

Add the default user to global Git config `~/.gitconfig`

```
[user]
        name = Foo
        email = 1234567+foo@users.noreply.github.com
```

Add another user to repo's Git config `.git/config`

```
[user]
        name = Bar
        email = 1234567+bar@users.noreply.github.com
```

### Git clone

To git clone repo from default user account

```
$ git clone git@github.com:foo/hello-world.git
```

To git clone repo from another user account. If the URL is copy from GitHub web UI, then need change `@github.com:` to `@github.com-bar:`.


```
$ git clone git@github.com-bar:bar/hello-world.git
```

Ref:
* https://gist.github.com/oanhnn/80a89405ab9023894df7
* https://gist.github.com/jexchan/2351996

## See also

- [Github Page](/development/github-pages/github-page.html)
- [Github following](/github-following.html)
- [github markdown](/github-markdown.html)
