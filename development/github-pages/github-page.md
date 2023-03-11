---
layout: page
title: Github Pages Howtos
---

## 使用 travis-ci 自动编译 markdown 并 push 到 github 文档分枝

生成一个提交文档专用的 key

```
ssh-keygen -t rsa -C "travis@xxd3vin.github.io" -N "" -f /tmp/id_rsa
```

```
cd ~/source/xxd3vin.github.io
cp /tmp/id_rsa .
travis login --auto
```

开始加密

```
travis encrypt-file id_rsa --add
```

加密完成之后，生成 id_rsa.enc，并且在`.travis.yml`文件的`before_install:`中自动插入了如下代码

```
- openssl aes-256-cbc -K $encrypted_3a9bae88342b_key -iv $encrypted_3a9bae88342b_iv
  -in id_rsa.enc -out id_rsa -d
```

在每次 build 的时候需要将`id_rsa`复制到当前用户的`.ssh`目录下。所以在上面`openssl ...`下一行添加：

```
- mv id_rsa ~/.ssh
- chmod 600 ~/.ssh/id_rsa
```

注意，不要将未加密的私钥提交了。

```
mv id_rsa /tmp
```

提交加密后的私钥`id_rsa.enc`和`.travis.yml`配置文件

```
git add id_rsa.enc .travis.yml
```

全部都配置好了之后是这样的：[xxd3vin.github.io/.travis.yml](https://github.com/xx7y7xx/xxd3vin.github.io/blob/7a6f07b13048fec35b08d920ad374909ff61a725/.travis.yml#L21)

参考：[http://www.cnblogs.com/zqzjs/p/6119750.html](http://www.cnblogs.com/zqzjs/p/6119750.html)

### 参考网站

- [https://github.com/andersonvom/andersonvom.github.io](https://github.com/andersonvom/andersonvom.github.io)
- [https://github.com/supercollider/supercollider.github.io](https://github.com/supercollider/supercollider.github.io)
- [https://github.com/yegor256/blog](https://github.com/yegor256/blog)

## Deploying a subfolder to GitHub Pages

[https://gist.github.com/cobyism/4730490](https://gist.github.com/cobyism/4730490)

Remove the `dist` directory from the project’s `.gitignore` file (it’s ignored by default by Yeoman).

```
git add dist .gitignore && git commit -m "Initial dist subtree commit"
git subtree push --prefix dist origin gh-pages
```

## Deploy a React App to github page

Let's take a example: [https://github.com/xx7y7xx/antd-demos](https://github.com/xx7y7xx/antd-demos)

1. Create a new empty repo `antd-demos`
2. First commit

```
➜  xxd3vin mkdir antd-demos

➜  xxd3vin cd antd-demos

➜  antd-demos git init
Initialized empty Git repository in /Users/devin.chenyang/source/xxd3vin/antd-demos/.git/

➜  antd-demos git:(master) echo '101' > index.html

➜  antd-demos git:(master) ✗ git add .

➜  antd-demos git:(master) ✗ git commit -m 'First commit'
[master (root-commit) ffefc10] First commit
 1 file changed, 1 insertion(+)
 create mode 100644 index.html

➜  antd-demos git:(master) ✗ git remote add origin git@github.com:xxd3vin/antd-demos.git

➜  antd-demos git:(master) git push -u origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 218 bytes | 218.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:xxd3vin/antd-demos.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

3. Create `develop` branch

```
➜  antd-demos git:(master) git checkout --orphan develop
Switched to a new branch 'develop'

➜  antd-demos git:(develop) ✗ git rm -rf .
rm 'index.html'

➜  antd-demos git:(develop) echo "#Ant Design Demos" > README.md

➜  antd-demos git:(develop) ✗ git add README.md

➜  antd-demos git:(develop) ✗ git commit -m 'First commit'
[develop (root-commit) 0a04775] First commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md

➜  antd-demos git:(develop) git push origin develop
Counting objects: 3, done.
Writing objects: 100% (3/3), 236 bytes | 236.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:xxd3vin/antd-demos.git
 * [new branch]      develop -> develop
```

4. Change default branch from `master` to `develop` [https://github.com/xx7y7xx/antd-demos/settings/branches](https://github.com/xx7y7xx/antd-demos/settings/branches)

5. Enable Github Pages. Select `master` branch as Source. [https://github.com/xx7y7xx/antd-demos/settings](https://github.com/xx7y7xx/antd-demos/settings)

6. Test our website [https://xxd3vin.github.io/antd-demos/](https://xxd3vin.github.io/antd-demos/)

7. Remove local git repo and git clone it again

```
➜  antd-demos git:(develop) cd ..
➜  xxd3vin rm -rf antd-demos
➜  xxd3vin git clone git@github.com:xxd3vin/antd-demos.git
Cloning into 'antd-demos'...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 0), reused 6 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), done.
```

If you don't remove the original `antd-demos` dir, you will come into this error:

```
➜  antd-demos git:(develop) git pull
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> develop
```

8. At `develop` branch, try `create-react-app` in the parent dir of `antd-demos`

```
➜  antd-demos git:(develop) cd ..

➜  xxd3vin create-react-app antd-demos

➜  xxd3vin cd antd-demos

➜  antd-demos git:(develop) ✗ rm README.old.md

➜  antd-demos git:(develop) ✗ git add .

➜  antd-demos git:(develop) ✗ git commit -m 'create-react-app'
[develop d67ee96] create-react-app
 14 files changed, 9973 insertions(+), 1 deletion(-)
 create mode 100644 .gitignore
 rewrite README.md (100%)
 create mode 100644 package.json
 create mode 100644 public/favicon.ico
 create mode 100644 public/index.html
 create mode 100644 public/manifest.json
 create mode 100644 src/App.css
 create mode 100644 src/App.js
 create mode 100644 src/App.test.js
 create mode 100644 src/index.css
 create mode 100644 src/index.js
 create mode 100644 src/logo.svg
 create mode 100644 src/registerServiceWorker.js
 create mode 100644 yarn.lock

➜  antd-demos git:(develop) git push
Counting objects: 18, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (18/18), done.
Writing objects: 100% (18/18), 114.19 KiB | 255.00 KiB/s, done.
Total 18 (delta 0), reused 0 (delta 0)
To github.com:xxd3vin/antd-demos.git
   0a04775..d67ee96  develop -> develop
```

9. Add two npm script

```diff
diff --git a/package.json b/package.json
index 8ccb19d..07c86e0 100644
--- a/package.json
+++ b/package.json
@@ -2,6 +2,7 @@
   "name": "antd-demos",
   "version": "0.1.0",
   "private": true,
+  "homepage": "https://xxd3vin.github.io/antd-demos",
   "dependencies": {
     "react": "^16.3.2",
     "react-dom": "^16.3.2",
@@ -11,6 +12,8 @@
     "start": "react-scripts start",
     "build": "react-scripts build",
     "test": "react-scripts test --env=jsdom",
-    "eject": "react-scripts eject"
+    "eject": "react-scripts eject",
+    "predeploy": "npm run build",
+    "deploy": "gh-pages -b master -d build"
   }
-}
\ No newline at end of file
+}
```

10. Add `gh-pages` to dev dep

```
➜  antd-demos git:(develop) ✗ yarn add gh-pages -D
yarn add v1.5.1
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
[4/4] 📃  Building fresh packages...
success Saved lockfile.
success Saved 4 new dependencies.
info Direct dependencies
├─ gh-pages@1.1.0
├─ react-dom@16.3.2
└─ react@16.3.2
info All dependencies
├─ base64url@2.0.0
├─ gh-pages@1.1.0
├─ react-dom@16.3.2
└─ react@16.3.2
✨  Done in 7.83s.
```

11. Build

```
➜  antd-demos git:(develop) ✗ yarn predeploy
yarn run v1.5.1
$ npm run build

> antd-demos@0.1.0 build /Users/devin.chenyang/source/xxd3vin/antd-demos
> react-scripts build

Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  38.06 KB  build/static/js/main.a3b22bcc.js
  299 B     build/static/css/main.c17080f1.css

The project was built assuming it is hosted at the server root.
You can control this with the homepage field in your package.json.
For example, add this to build it for GitHub Pages:

  "homepage" : "http://myname.github.io/myapp",

The build folder is ready to be deployed.
You may serve it with a static server:

  yarn global add serve
  serve -s build

Find out more about deployment here:

  http://bit.ly/2vY88Kr

✨  Done in 8.00s.
```

12. Deploy

```
➜  antd-demos git:(develop) ✗ yarn deploy
yarn run v1.5.1
$ npm run build

> antd-demos@0.1.0 build /Users/devin.chenyang/source/xxd3vin/antd-demos
> react-scripts build

Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  38.08 KB (+21 B)  build/static/js/main.65084cf2.js
  299 B             build/static/css/main.c17080f1.css

The project was built assuming it is hosted at /antd-demos/.
You can control this with the homepage field in your package.json.

The build folder is ready to be deployed.
To publish it at https://xxd3vin.github.io/antd-demos, run:

  yarn run deploy

Find out more about deployment here:

  http://bit.ly/2vY88Kr

$ gh-pages -b master -d build
Published
✨  Done in 24.54s.
```

## See also

- [kramdown syntax](/kramdown.html)
