---
layout: page
permalink: /dev/npmjs.html
title: npmjs
categories: [development, nodejs]
---

## Common commands

### List globally installed packages

```
$ npm ls -g
$ npm ls create-react-app -g
```

### Install as a global package

```
$ npm install foo --global
```

See more details about the command options: [https://docs.npmjs.com/cli/install](https://docs.npmjs.com/cli/install)

## Switch betweeen China-LAN and Internet

show current registry

```
$ npm config get registry
https://registry.npmjs.org/
```

switch to taobao registry

```
$ npm config set registry https://registry.npm.taobao.org
```

show current registry

```
$ npm config get registry
https://registry.npm.taobao.org/
```

switch to official registry

```
$ npm config set registry https://registry.npmjs.org/
```

Or choose the registry when installing packages:

```
$ npm install --registry=https://registry.npm.taobao.org
```

## Publish a new package

### Prepare

login to npmjs.com and create token for login account

```
$ npm login
```

### Publish package for the first time

```
$ npm publish
+ krpano@0.0.1
```

### Update the package

prepare update version

```
$ git tag -l
v3.0.0
```

```
$npm version patch
$ git tag -l
v3.0.0
v3.0.1
```

publish package

```
$ npm publish
+ tims-ocr-api@2.0.5
```

## install from private repo

branch is `develop`

```
npm install git+ssh://git@git.xx.com:foo/bar.git#develop --save
```

## Rename package (deprecate old create new)

For example, the old package is `ssc-grid@0.11.0` (latest version), name should changed to `ssc-comp`.

Change `name` in `package.json` to new one, also version number.

```
npm publish ... #
npm deprecate ssc-grid@"< 0.12.0" "WARNING: This project has been renamed to ssc-comp. Install using ssc-comp instead."
```

ref: [http://stackoverflow.com/questions/28371669/renaming-a-published-npm-module](http://stackoverflow.com/questions/28371669/renaming-a-published-npm-module)

## package.json script order

from [https://github.com/airbnb/react-dates](https://github.com/airbnb/react-dates)

```
    "build": "npm run clean && npm run build:js && npm run build:css && npm run build:svg",
    "build:js": "babel src/ -d lib/ --ignore src/components",
    "build:css": "node-sass css/styles.scss lib/css/_datepicker.css",
    "build:svg": "webpack",
    "clean": "rimraf lib",
    "precover": "rimraf coverage",
    "cover": "cross-env NODE_ENV=test node --max-old-space-size=2048 $(which nyc) npm run mocha test",
    "lint": "eslint --ext .js,.jsx src test",
    "mocha": "mocha ./test/_helpers",
    "react:clean": "rimraf node_modules/react node_modules/react-dom node_modules/react-addons-test-utils",
    "react:14": "rimraf node_modules/.bin/npm && npm run react:clean && npm i react@0.14 react-dom@0.14 react-addons-test-utils@0.14",
    "react:15": "rimraf node_modules/.bin/npm && npm run react:clean && npm i react@15 react-dom@15 react-addons-test-utils@15",
    "pretest": "npm run --silent lint",
    "tests-only": "npm run mocha --silent test",
    "tests-karma": "karma start",
    "test": "npm run tests-only && npm run tests-karma",
    "storybook": "start-storybook -p 9001 -s ./public",
    "tag": "git tag v$npm_package_version",
    "gh-pages:clean": "rimraf _gh-pages",
    "gh-pages:build": "$(npm bin)/build-storybook -o _gh-pages",
    "gh-pages:copy-public": "cp public/* _gh-pages/$1",
    "gh-pages:publish": "$(npm bin)/git-directory-deploy --directory _gh-pages",
    "gh-pages": "npm run gh-pages:clean && npm run gh-pages:build && npm run gh-pages:copy-public && npm run gh-pages:publish",
    "version:patch": "npm --no-git-tag-version version patch",
    "version:minor": "npm --no-git-tag-version version minor",
    "version:major": "npm --no-git-tag-version version major",
    "preversion": "npm run test && npm run check-changelog && npm run check-only-changelog-changed",
    "postversion": "git commit package.json CHANGELOG.md -m \"Version $npm_package_version\" && npm run tag && git push && git push --tags && npm publish --registry=https://registry.npmjs.org/",
    "prepublish": "in-publish && safe-publish-latest && npm run build || not-in-publish",
    "postpublish": "npm run gh-pages",
    "check-changelog": "expr $(git status --porcelain 2>/dev/null| grep \"^\\s*M.*CHANGELOG.md\" | wc -l) >/dev/null || (echo 'Please edit CHANGELOG.md' && exit 1)",
    "check-only-changelog-changed": "(expr $(git status --porcelain 2>/dev/null| grep -v \"CHANGELOG.md\" | wc -l) >/dev/null && echo 'Only CHANGELOG.md may have uncommitted changes' && exit 1) || exit 0"
```

## Boilerplate

This boilerplate follow the rule of airbnb [https://github.com/xx7y7xx/airbnb-npm-boilerplate](https://github.com/xx7y7xx/airbnb-npm-boilerplate)

## suggested packages

- [npm-check](https://github.com/dylang/npm-check)
- [pm2](https://github.com/Unitech/pm2)

## command line options

```
$ npm install --registry=https://registry.npm.taobao.org --loglevel=silly
```

## proxy

```
npm config get proxy
npm config set proxy http://localhost:1087
```

Reset

```
npm config delete proxy
```

## FAQ

If still see this error after deleting proxy.

```
error An unexpected error occurred: "https://registry.npmjs.org/@db-man%2fgithub: tunneling socket could not be established, cause=connect ECONNREFUSED 127.0.0.1:1087".
```

Beside npm, there is also a yarn config for proxy.

```
$ yarn config delete proxy
$ yarn config delete https-proxy
```

## Use Github branch as dependency in package.json

```json
  "dependencies": {
    "@db-man/components": "github:db-man/components"
  }
```

By default, when you run `npm i`, it will not upgrade `@db-man/components` to the latest version.

Instead you need to run `npm i @db-man/components`. A quick way is to add `postinstall`, so that you only need to run `npm i`.

```json
 "scripts": {
    "postinstall": "npm i @db-man/components"
  },
```

## See also

- [npm installation](/dev/npm-installation.html)
- [yarn](/dev/yarn.html)
- [npm vs yarn](/dev/npm-vs-yarn.html)

## References

- [12 - Publishing npm packages | npm Documentation](https://docs.npmjs.com/getting-started/publishing-npm-packages)
