---
layout: post
title: Create SSC 3.0 API documents website
---

决定采用 http://swagger.io/ 的方案

基本思路是使用swagger-editor（Live demo）定义API，然后导出JSON，最后使用swagger-ui来讲JSON渲染成API文档网页。

使用Github Project Pages来管理API文档的静态页。这样就可以通过 http://xx7y7xx.github.io/swagger-ui 来访问API文档了。

## Steps

在Github上fork一份[swagger-ui](https://github.com/swagger-api/swagger-ui)的源码

然后将fork出来的那一份Clone到本地

```
git clone git@github.com:xxd3vin/swagger-ui.git
```

查看一下目前的分支

```
$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/develop_2.0
  remotes/origin/issue-1691
  remotes/origin/master
```

创建`gh-pages`分支（without parent）。

```
$ git checkout --orphan gh-pages
Switched to a new branch 'gh-pages'
```

查看这时候的文件状态

```
$ git status
On branch gh-pages

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   .dockerignore
        new file:   .gitattributes
        new file:   .gitignore
        new file:   .jshintignore
        new file:   .jshintrc
        new file:   .npmignore
        new file:   .travis.yml
        new file:   CONTRIBUTING.md
        new file:   Dockerfile
...
        new file:   test/specs/v1.2/petstore/user.json
        new file:   test/specs/v2/formats.yaml
        new file:   test/specs/v2/petstore.json
        new file:   test/unit/mock.js
        new file:   test/unit/view/partials/signatureSpec.js
```

将需要保留的静态文件复制一份

```
cp -r dist/ /tmp
```

删除非静态页的源代码

```
$ git rm -rf .
rm '.dockerignore'
rm '.gitattributes'
rm '.gitignore'
...
rm 'test/specs/v2/formats.yaml'
rm 'test/specs/v2/petstore.json'
rm 'test/unit/mock.js'
rm 'test/unit/view/partials/signatureSpec.js'
```

查看一下是否清空了

```
$ git status
On branch gh-pages

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

将备份的`dist/`再复制回来。

```
$ cp -r /tmp/dist/* .
```

查看一下状态

```
$ git status
On branch gh-pages

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        css/
        fonts/
        images/
        index.html
        lang/
        lib/
        o2c.html
        swagger-ui.js
        swagger-ui.min.js

nothing added to commit but untracked files present (use "git add" to track)
```

添加到index，并push

```
$ git add .
$ git commit -m 'first commit'
$ git push --set-upstream origin gh-pages
```

最终可以访问的地址 https://xxd3vin.github.io/swagger-ui/
