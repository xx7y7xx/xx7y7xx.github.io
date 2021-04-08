---
layout: post
title: 'Rename dir with special chars in Git repo'
---

After clone, the status is not correct.

Ps: the original name of dir is `web - 副本`, but now the unicode is not right. (You could saw a snapshot of the special char at [here](https://github.com/xxd3vin/rsd_web/issues/1#issuecomment-256374916))

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        "web - \302\270\302\261\302\261\302\276/"
```

First rename the dir with Windows Explorer, to for example `web_copy`.

Then the status is:

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    "web - \270\261\261\276/WEB-INF/conf/system.properties"
        deleted:    "web - \270\261\261\276/WEB-INF/tld/c-rt.tld"
        deleted:    "web - \270\261\261\276/WEB-INF/tld/fn.tld"
...
```

Try to add with `-u` switch.

```
$ git add -u
```

The Git status:

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        deleted:    "web - \270\261\261\276/WEB-INF/conf/system.properties"
        deleted:    "web - \270\261\261\276/WEB-INF/tld/c-rt.tld"
        deleted:    "web - \270\261\261\276/WEB-INF/tld/fn.tld"
...
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        web_copy/
```

`git add` the new dir

The Git status:

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        renamed:    "web - \270\261\261\276/WEB-INF/conf/system.properties" -> web_copy/WEB-INF/conf/system.properties
        renamed:    "web - \270\261\261\276/WEB-INF/tld/c-rt.tld" -> web_copy/WEB-INF/tld/c-rt.tld
        renamed:    "web - \270\261\261\276/WEB-INF/tld/fn.tld" -> web_copy/WEB-INF/tld/fn.tld
...
```

At last `git commit` and `git push`.

## References

- [https://github.com/xxd3vin/rsd_web/issues/1](https://github.com/xxd3vin/rsd_web/issues/1)
- [http://stackoverflow.com/questions/7811147/impossible-to-git-rm-with-special-caracters](http://stackoverflow.com/a/7811205/4685522)