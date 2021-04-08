---
layout: page
title: Git Command
---

## Rename a branch

```
git branch -m <oldname> <newname>
git branch -m <newname>
```

The `-m` is for `mv` or "move".

## List all the files modified by one user

```
$ git log --no-merges --author="Yang Chen" --name-only --pretty=format:"" | sort -u
```

Ref: [https://stackoverflow.com/questions/6349139/can-i-get-git-to-tell-me-all-the-files-one-user-has-modified](https://stackoverflow.com/questions/6349139/can-i-get-git-to-tell-me-all-the-files-one-user-has-modified)
