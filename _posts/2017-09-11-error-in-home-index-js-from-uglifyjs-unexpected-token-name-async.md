---
layout: post
title: "ERROR in home_index.js from UglifyJs. Unexpected token: name (Async) [./~/_react-select@1.0.0-rc.6@react-select/lib/Async.js:42,0][home_index.js:165076,6]"
---

```
Started by user 我不是陈扬
[EnvInject] - Loading node environment variables.
Building remotely on 172_20_4_221 in workspace /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@git.xx.com:sscplatform/FC.git # timeout=10
Fetching upstream changes from git@git.xx.com:sscplatform/FC.git
 > git --version # timeout=10
using GIT_SSH to set credentials 
 > git fetch --tags --progress git@git.xx.com:sscplatform/FC.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/develop^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/develop^{commit} # timeout=10
Checking out Revision 8aa9769219d411c8ff777939142db23545e9ec86 (refs/remotes/origin/develop)
Commit message: "FICLOUD-1602 期初累计折旧字段"
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 8aa9769219d411c8ff777939142db23545e9ec86
 > git rev-list 387363f61dfc54a939e403f35bc5a13a572d86cb # timeout=10
Extended Email Publisher is currently disabled in project settings
[fc_dotest] $ /bin/sh /tmp/hudson1588653242377469859.sh
platform unsupported nunjucks@3.0.1 › chokidar@1.7.0 › fsevents@^1.0.0 Package require os(darwin) not compatible with your platform(linux)
[fsevents@^1.0.0] optional install error: Package require os(darwin) not compatible with your platform(linux)
✔ Installed 128 packages
✔ Linked 1185 latest versions
[36mbuilt Module("Select")[0m
["Select"]
✔ Run 3 scripts
peerDependencies link react-bootstrap@0.30.10 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_react-bootstrap-date-picker@4.0.0@react-bootstrap-date-picker unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/react-bootstrap(0.31.3)
peerDependencies link ajv@4.11.8 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_ajv-keywords@1.5.1@ajv-keywords unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/ajv(5.2.2)
peerDependencies link webpack@3.5.6 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_webpack-dev-middleware@1.12.0@webpack-dev-middleware unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/webpack(2.7.0)
peerDependencies link webpack@3.5.6 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_uglifyjs-webpack-plugin@0.4.6@uglifyjs-webpack-plugin unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/webpack(2.7.0)
peerDependencies link react-bootstrap@0.30.10 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_react-bootstrap-select@0.14.0@react-bootstrap-select unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/react-bootstrap(0.31.3)
peerDependencies link react@0.14.9 in /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/_react-dom@0.14.9@react-dom unmet with /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/react(15.6.1)
peerDependencies WARNING ssc-grid@^0.69.16 requires a peer of react-bootstrap-date-picker@^5.1.0 but react-bootstrap-date-picker@4.0.0 was installed
peerDependencies WARNING ssc-refer@0.1.37 › react-addons-update@^0.14.8 requires a peer of react@^0.14.8 but react@15.6.1 was installed
anti semver karma@1.7.1 › useragent@2.2.1 › tmp@0.0.x delcares tmp@0.0.x(resolved as 0.0.33) but using ancestor(karma)'s dependency tmp@0.0.31(resolved as 0.0.31)
deprecate ssc-comp@0.15.0 › react-bootstrap-select@0.14.0 › gulp@3.9.1 › vinyl-fs@0.3.14 › glob-stream@3.1.18 › minimatch@^2.0.1 Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
deprecate ssc-comp@0.15.0 › react-bootstrap-select@0.14.0 › gulp@3.9.1 › vinyl-fs@0.3.14 › glob-watcher@0.0.6 › gaze@0.5.2 › globule@0.1.0 › minimatch@~0.2.11 Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
deprecate ssc-comp@0.15.0 › react-bootstrap-select@0.14.0 › gulp@3.9.1 › vinyl-fs@0.3.14 › glob-watcher@0.0.6 › gaze@0.5.2 › globule@0.1.0 › glob@3.1.21 › graceful-fs@~1.2.0 graceful-fs v3.0.0 and before will fail on node releases >= v7.0. Please update to graceful-fs@^4.0.0 as soon as possible. Use 'npm ls graceful-fs' to find it in the tree.
deprecate ssc-comp@0.15.0 › react-bootstrap-select@0.14.0 › react-tools@^0.13 react-tools is deprecated. For more information, visit https://fb.me/react-tools-deprecated
Recently updated (since 2017-09-04): 48 packages (detail see file /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/node_modules/.recently_updates.txt)
  Today:
    → express@4.15.4 › proxy-addr@1.1.5 › forwarded@~0.1.0(0.1.1) (07:15:48)
    → html-webpack-plugin@2.30.1 › html-minifier@^3.2.3(3.5.4) (03:15:32)
    → mocha@^3.5.0(3.5.2) (05:25:07)
    → webpack-dev-server@2.7.1 › sockjs@0.3.18 › faye-websocket@0.10.0 › websocket-driver@0.6.5 › websocket-extensions@>=0.1.1(0.1.2) (00:50:38)
✔ All packages installed (1540 packages installed from npm registry, used 2m, speed 43.25kB/s, json 1313(2.6MB), tarball 1.21MB)

> financial_cloud@1.0.0 publish /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest
> cross-env NODE_ENV=production webpack --config webpack.homep.config.js

Hash: 12fa631282d272abb070
Version: webpack 2.7.0
Time: 203774ms
            Asset       Size  Chunks                    Chunk Names
    home_index.js    10.1 MB       0  [emitted]  [big]  home_index
          home.js    1.22 MB       1  [emitted]  [big]  home
        common.js     250 kB       2  [emitted]  [big]  common
home_index.js.map    10.7 MB       0  [emitted]         home_index
      home.js.map    8.36 MB       1  [emitted]         home
    common.js.map    2.14 MB       2  [emitted]         common
       index.html    3.49 kB          [emitted]         
  home_index.html    3.67 kB          [emitted]         
    manifest.json  811 bytes          [emitted]         
[./node_modules/_babel-polyfill@6.26.0@babel-polyfill/lib/index.js] ./~/_babel-polyfill@6.26.0@babel-polyfill/lib/index.js 833 bytes {0} {1} [built]
[./node_modules/_react-dom@15.6.1@react-dom/index.js] ./~/_react-dom@15.6.1@react-dom/index.js 59 bytes {0} {1} {2} [built]
[./node_modules/_react-router@3.0.5@react-router/es/RouteUtils.js] ./~/_react-router@3.0.5@react-router/es/RouteUtils.js 2.43 kB {0} {1} {2} [built]
[./node_modules/_react-router@3.0.5@react-router/es/Router.js] ./~/_react-router@3.0.5@react-router/es/Router.js 5.28 kB {0} {1} {2} [built]
[./node_modules/_react-router@3.0.5@react-router/es/RouterContext.js] ./~/_react-router@3.0.5@react-router/es/RouterContext.js 3.79 kB {0} {1} {2} [built]
[./node_modules/_react-router@3.0.5@react-router/es/applyRouterMiddleware.js] ./~/_react-router@3.0.5@react-router/es/applyRouterMiddleware.js 1.9 kB {0} {1} {2} [built]
[./node_modules/_react-router@3.0.5@react-router/es/index.js] ./~/_react-router@3.0.5@react-router/es/index.js 1.46 kB {0} {1} {2} [built]
[./node_modules/_react@15.6.1@react/lib/React.js] ./~/_react@15.6.1@react/lib/React.js 5.08 kB {0} {1} {2} [built]
[./node_modules/_react@15.6.1@react/react.js] ./~/_react@15.6.1@react/react.js 56 bytes {0} {1} {2} [built]
[./src/home.js] ./src/home.js 1.3 kB {1} [built]
[./src/home_index.js] ./src/home_index.js 13.9 kB {0} [built]
[./src/财务平台/containers/转换模板/Index.js] ./src/财务平台/containers/转换模板/Index.js 7.94 kB {0} [built]
   [0] multi babel-polyfill ./src/home 40 bytes {1} [built]
   [1] multi babel-polyfill ./src/home_index 40 bytes {0} [built]
   [2] multi react react-dom react-router 52 bytes {2} [built]
    + 2216 hidden modules

ERROR in home_index.js from UglifyJs
Unexpected token: name (Async) [./~/_react-select@1.0.0-rc.6@react-select/lib/Async.js:42,0][home_index.js:165076,6]
Child html-webpack-plugin for "index.html":
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars.runtime.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars.runtime.js 4.61 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/base.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/base.js 8.4 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/decorators.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/decorators.js 1 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/exception.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/exception.js 4.74 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers.js 2.92 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/lookup.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/lookup.js 860 bytes {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/with.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/with.js 3.01 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/logger.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/logger.js 3.84 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/no-conflict.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/no-conflict.js 1.58 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/runtime.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/runtime.js 35.6 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/safe-string.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/safe-string.js 1.16 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/utils.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/utils.js 10.2 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/runtime.js] ./~/_handlebars@4.0.10@handlebars/runtime.js 167 bytes {0} [built]
    [./node_modules/_html-webpack-plugin@2.30.1@html-webpack-plugin/lib/loader.js!./client/home.hbs] ./~/_html-webpack-plugin@2.30.1@html-webpack-plugin/lib/loader.js!./client/home.hbs 6 kB {0} [built]
    [./node_modules/_webpack@2.7.0@webpack/buildin/global.js] (webpack)/buildin/global.js 509 bytes {0} [built]
        + 6 hidden modules
Child html-webpack-plugin for "home_index.html":
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars.runtime.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars.runtime.js 4.61 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/base.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/base.js 8.4 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/decorators.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/decorators.js 1 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/exception.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/exception.js 4.74 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers.js 2.92 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/lookup.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/lookup.js 860 bytes {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/with.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/helpers/with.js 3.01 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/logger.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/logger.js 3.84 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/no-conflict.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/no-conflict.js 1.58 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/runtime.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/runtime.js 35.6 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/safe-string.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/safe-string.js 1.16 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/utils.js] ./~/_handlebars@4.0.10@handlebars/dist/cjs/handlebars/utils.js 10.2 kB {0} [built]
    [./node_modules/_handlebars@4.0.10@handlebars/runtime.js] ./~/_handlebars@4.0.10@handlebars/runtime.js 167 bytes {0} [built]
    [./node_modules/_html-webpack-plugin@2.30.1@html-webpack-plugin/lib/loader.js!./client/home_index.hbs] ./~/_html-webpack-plugin@2.30.1@html-webpack-plugin/lib/loader.js!./client/home_index.hbs 6.16 kB {0} [built]
    [./node_modules/_webpack@2.7.0@webpack/buildin/global.js] (webpack)/buildin/global.js 509 bytes {0} [built]
        + 6 hidden modules

npm ERR! Linux 3.10.0-327.28.3.el7.x86_64
npm ERR! argv "/home/sscweb/.nvm/versions/node/v6.11.1/bin/node" "/home/sscweb/.nvm/versions/node/v6.11.1/bin/npm" "run" "publish"
npm ERR! node v6.11.1
npm ERR! npm  v3.10.10
npm ERR! code ELIFECYCLE
npm ERR! financial_cloud@1.0.0 publish: `cross-env NODE_ENV=production webpack --config webpack.homep.config.js`
npm ERR! Exit status 2
npm ERR! 
npm ERR! Failed at the financial_cloud@1.0.0 publish script 'cross-env NODE_ENV=production webpack --config webpack.homep.config.js'.
npm ERR! Make sure you have the latest version of node.js and npm installed.
npm ERR! If you do, this is most likely a problem with the financial_cloud package,
npm ERR! not with npm itself.
npm ERR! Tell the author that this fails on your system:
npm ERR!     cross-env NODE_ENV=production webpack --config webpack.homep.config.js
npm ERR! You can get information on how to open an issue for this project with:
npm ERR!     npm bugs financial_cloud
npm ERR! Or if that isn't available, you can get their info via:
npm ERR!     npm owner ls financial_cloud
npm ERR! There is likely additional logging output above.

npm ERR! Please include the following file with any support request:
npm ERR!     /disk100/sscweb/workspace/SSC/ENV_PROD/fc_dotest/npm-debug.log
Build step 'Execute shell' marked build as failure
Extended Email Publisher is currently disabled in project settings
Finished: FAILURE
```

这是react-select升级到v1.0.0-rc6导致的，对应的代码提交是[https://github.com/JedWatson/react-select/commit/1aa5134a1c2fd72daedabb45c2a81483c8bfeb96#diff-99b635942733c771259a2d2213102332](https://github.com/JedWatson/react-select/commit/1aa5134a1c2fd72daedabb45c2a81483c8bfeb96#diff-99b635942733c771259a2d2213102332)

之前这个作者使用babel将（`lib/Async.js`的）es6代码转换成了es5，但是在最近的更新中貌似没有进行转换


之前`package.json`中写的是`"react-select": "^1.0.0-rc.4",`

现在暂时将版本固定死为`"react-select": "1.0.0-rc.4",`

## See also

- [ERROR in index.js from UglifyJs Unexpected token: punc (,)](/2017/06/12/error-in-index-js-from-uglifyjs-unexpected-token-punc.html)

## References

- [https://github.com/JedWatson/react-select/issues/1971](https://github.com/JedWatson/react-select/issues/1971)
- [https://github.com/JedWatson/react-select/issues/1974](https://github.com/JedWatson/react-select/issues/1974)
