---
layout: post
title: "Error: `fsevents` unavailable (this watcher can only be used on Darwin)"
---

First, try to upgrade yarn.

```
$ brew upgrade yarn
==> Upgrading yarn 1.22.4 -> 1.22.10
```

But when try to `yarn start`, saw this error.

```
yarn run v1.22.10
$ node scripts/test.js --env=jsdom src/App.test.js
Error: `fsevents` unavailable (this watcher can only be used on Darwin)
    at new FSEventsWatcher (/Users/foo.bar/source/hello-world/node_modules/sane/src/fsevents_watcher.js:41:11)
    at createWatcher (/Users/foo.bar/source/hello-world/node_modules/jest-haste-map/build/index.js:780:23)
    at Array.map (<anonymous>)
    at HasteMap._watch (/Users/foo.bar/source/hello-world/node_modules/jest-haste-map/build/index.js:936:44)
    at /Users/foo.bar/source/hello-world/node_modules/jest-haste-map/build/index.js:355:23
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```

Found this solution, said it's related to `watchman`. ([https://github.com/jest-community/vscode-jest/issues/423#issuecomment-462259867](https://github.com/jest-community/vscode-jest/issues/423#issuecomment-462259867))

Then try to upgrade watchman also.

```
$ brew upgrade watchman
==> Upgrading watchman 4.9.0_2 -> 4.9.0_5
```

Problem solved at last.
