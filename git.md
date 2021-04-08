---
title: Git
layout: page
---

## Recommanded git client app

- SourceTree - [https://www.sourcetreeapp.com/](https://www.sourcetreeapp.com/)
- GitHub
- Gitk - for Linux, only commit viewer

## Online Git repo

- github.com
- bitbucket.org
- coding.net
- git.oschina.net

## reorder commits

Make some test commits

```
# Add test1 to test.txt
git add test.txt
git commit -m "test1"

# Add test2 to test.txt
git add test.txt
git commit -m "test2"

# Add test3 to test.txt
git add test.txt
git commit -m "test3"
```

Start to reorder commits. You may change `3`.

    git rebase -i HEAD~3

A editor is opened with content below:

    pick 99b2f12 test1
    pick 516497d test2
    pick 7c5bc93 test3

    # Rebase 897e85c..7c5bc93 onto 897e85c
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit the commit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld into previous commit
    #  f, fixup = like "squash", but discard this commit's log message
    #  x, exec = run command (the rest of the line) using shell
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    # However, if you remove everything, the rebase will be aborted.
    #
    # Note that empty commits are commented out

Only modify `pick` to:

    pick 7c5bc93 test3
    pick 99b2f12 test1
    pick 516497d test2

This mean commit order change from `1 > 2 > 3` to `3 > 1 > 2`.

Save and exit editor.

You may deal with conflict when these commits changed the same line in the same file.

Reference: [http://blog.dennisrobinson.name/reorder-commits-with-git/](http://blog.dennisrobinson.name/reorder-commits-with-git/)

## Push only one commit

First, reoder your commits, put the commit above other commit (the oldest).

Then use `git log` to get the hash. Below `47816ddbf98184a9fbec1b2692c2655ab8d64516` is a example hash.

    commit 47816ddbf98184a9fbec1b2692c2655ab8d64516
    Author: Devin Chen <d3vin.chen@gmail.com>
    Date:   Thu Apr 7 01:14:12 2016 +0800

        test3

    git push origin 47816ddbf98184a9fbec1b2692c2655ab8d64516:master

## change remote

```
git remote set-url origin git@git.coding.net:xin2011nix/xx_api.git
```

## set up git server

```
$ sudo useradd git
$ sudo su git
$ cd
$ mkdir .ssh
$ chmod 700 .ssh
$ cat .ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEArcBHqbUu8vBa+HT1091czMymiYXi7hEOEdaSik3r7RpjS4uZmyvgpuFNiYZOJZCZj1BMyUFAWNGCdm1hiBTez5eXlrDZjgbsVra5BhRkQOjtBmp0Uz6i5q2y1xyqlOxdFG7P3XGFYdJ8+SWj+XC++nw7NmhLMsXp4d96wvbkJ4M= d3vin.chen@gmail.com(rsa-key-20131201
$ chmod 600 .ssh/authorized_keys
```

create git repo project

```
$ sudo su git
$ cd ~
$ mkdir project.git
$ cd project.git
$ git --bare init
```

push to remote

```
mkdir project
cd project
touch README.md
git init
git add .
git commit -m "initial commit"
git remote add origin ssh://git@101.200.74.182:9999/~/project.git
git push origin master
```

`/etc/passwd`

```
git:x:1001:1001::/home/git:/bin/bash
```

change to

```
git:x:1001:1001::/home/git:/usr/bin/git-shell
```

so git user can not login to a normal shell.

## move old git repo to new server

All source code is in old repo, new repo is created with only a readme file.

```
$ git remote -v
origin  git@git.coding.net:xin2011nix/xx_note.git (fetch)
origin  git@git.coding.net:xin2011nix/xx_note.git (push)
$ git remote add new_origin ssh://git@101.200.74.182:9999/~/share-cli-doc.git
$ git remote -v
new_origin      ssh://git@101.200.74.182:9999/~/share-cli-doc.git (fetch)
new_origin      ssh://git@101.200.74.182:9999/~/share-cli-doc.git (push)
origin  git@git.coding.net:xin2011nix/xx_note.git (fetch)
origin  git@git.coding.net:xin2011nix/xx_note.git (push)
$ git pull new_origin master
From ssh://101.200.74.182:9999/~/share-cli-doc
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> new_origin/master
Merge made by the 'recursive' strategy.
 README.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
$ git push new_origin master
Counting objects: 173, done.
Compressing objects: 100% (164/164), done.
Writing objects: 100% (171/171), 120.34 KiB | 0 bytes/s, done.
Total 171 (delta 80), reused 13 (delta 0)
To ssh://git@101.200.74.182:9999/~/share-cli-doc.git
   3d5bedc..f6599de  master -> master
```

## term

- `master` - a branch name
- `remote` - ?
- `origin` - a remote name
- `topic` - ?
- `origin/master` - a brach on a remote

## checkout another remote branch

```
$ git branch -a
* develop
  remotes/origin/HEAD -> origin/master
  remotes/origin/develop
  remotes/origin/develop-invoice
  remotes/origin/master
```

```
$ git checkout -b develop-invoice origin/develop-invoice
Branch develop-invoice set up to track remote branch develop-invoice from origin.
Switched to a new branch 'develop-invoice'
```

```
$ git branch -a
  develop
* develop-invoice
  remotes/origin/HEAD -> origin/master
  remotes/origin/develop
  remotes/origin/develop-invoice
  remotes/origin/master
```

也可以简写如下，但是由于没有填写 remote name（也就是 origin），如果 repo 存在多个 remote，可能会出现问题。（参照[http://stackoverflow.com/questions/1783405/how-to-check-out-a-remote-git-branch](http://stackoverflow.com/questions/1783405/how-to-check-out-a-remote-git-branch)）

```
$ git checkout develop-invoice
```

## git tagging

The recommanded tag type is annotated tags (not lightweight tags), so bellow only describe how to create an annotated tags.

List current tags.

```
git tag
```

Create an annotated tag (with `-a` option)

```
git tag -a v0.1 -m 'first release'
```

See the information about the tagged commit.

```
git show v0.1
```

Push to a remote server

```
git push origin v0.1
```

Push all the tags to a remote server

```
git push origin --tags
```

For Github users, if you push a tag to your repo on Github, then A new release is created for you automatically.

## 开发方法 Git workflow

在 Github 上创建项目，默认创建 master 分支

clone 代码到本地

```
git clone ...
```

### 开发分支（development branch）

创建开发分支 develop

```
git checkout -b develop master
```

创建文件，提交代码

```
touch README.md
git add .
git commit -m 'first commit'
git push --set-upstream origin develop
```

准备好了要发布，切换到 master 分支，将 develop 中的新代码合并到 master 中。（这里我不希望有 fast-forward merge，具体参照[Implicit merge via rebase or fast-forward merge](https://developer.atlassian.com/blog/2014/12/pull-request-merge-strategies-the-great-debate/#implicit-merge-via-rebase-or-fast-forward-merge)）

```
git checkout master
git merge --no-ff develop
```

### 功能分支（feature branch）

创建功能分支（修补 bug 分支）

```
git checkout -b feature-x develop
```

在功能分支提交代码之后，需要合并回开发分支

```
git checkout develop
git merge --no-ff feature-x
```

删除功能分支

```
git branch -d feature-x
git push origin --delete feature-x
```

TODO：功能分支是否需要 push 到 remote？

### 预发布分支（release branch）

创建预发布分支

```
git checkout -b release-0.23 develop
```

代码测试后发现没有问题了，提交分支（TODO：如何进行打包测试？如果测试后发现有 bug，提交到哪个分支，如何合并？）

```
git push --set-upstream origin release-0.23
```

切换到 master 分支，然后将发布分支`release-0.23`合并进来，然后打一个标签，最后提交代码和标签

```
git checkout master
git merge --no-ff release-0.23
git tag -a v0.23 -m 'new release'
git push --follow-tags
```

如何在预发布分支中提交了代码，那么需要合并回 develop 分支。

```
git checkout develop
git merge --no-ff release-0.23
git push
```

最后删除本地和 remote 的预发布分支

```
git branch -d release-0.23
git push origin --delete release-0.23
```

### 修补 bug 分支（bug branch）

```
git checkout -b fixbug-ie11-promise-undefined master
git push --set-upstream origin fixbug-ie11-promise-undefined
```

修改代码，提交代码，测试没有问题了，合并到 master

```
git checkout master
git merge --no-ff fixbug-ie11-promise-undefined
git tag -a v0.24 -m 'new release'
git push --follow-tags
```

再合并到 develop 中

```
git checkout develop
git merge --no-ff fixbug-ie11-promise-undefined
git push
```

最后删除分支

```
git branch -d fixbug-ie11-promise-undefined
git push origin --delete fixbug-ie11-promise-undefined
```

## Merge update from upstream to your fork

```
git clone git@github.com:xxd3vin/swagger-ui.git
cd swagger-ui
git checkout master
git pull https://github.com/swagger-api/swagger-ui.git master
git push
```

[https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/)

## proxy (shadowsocks)

[Git Proxy](/git-proxy.html)

## git rollback commit

```
git revert 1c9729b2958f811781ffc695323583a14f5ac5f3
```

## Generating statistics from Git repository

```
$ # commits per author
$ git shortlog -s -n
```

[https://github.com/IonicaBizau/git-stats](https://github.com/IonicaBizau/git-stats)
