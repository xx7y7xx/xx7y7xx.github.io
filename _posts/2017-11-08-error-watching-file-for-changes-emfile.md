---
layout: post
title: "Hot to fix this error - \"Error: Error watching file for changes: EMFILE\""
---

## Case 1

Background: OS is macOS

```
$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.12.6
BuildVersion:	16G1036
```

The project is created by create-react-app

```
$ yarn test
yarn run v1.3.2
$ node scripts/test.js --env=jsdom
2017-11-08 18:17 node[82524] (FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-22)
2017-11-08 18:17 node[82524] (FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-22)
2017-11-08 18:17 node[82524] (FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-22)
events.js:183
      throw er; // Unhandled 'error' event
      ^

Error: Error watching file for changes: EMFILE
    at _errnoException (util.js:1024:11)
    at FSEvent.FSWatcher._handle.onchange (fs.js:1351:9)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```

Solution is to install `watchman`

```
$ brew install watchman
```

## Case 2

Background: OS is macOS

```
$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.13.6
BuildVersion:	17G65
```

The project is created by create-react-app, will get an error when run `yarn test`

```
 RUNS  src/App.test.js
 PASS  src/App.test.js18323] (FSEvents.framework) FSEventStreamStart: register_with_serv  ✓ renders without crashing (34ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        3.717s, estimated 4s
Ran all test suites related to changed files.

Watch Usage
 › Press a to run all tests.
 › Press p to filter by a filename regex pattern.
 › Press t to filter by a test name regex pattern.
 › Press q to quit watch mode.
 › Press Enter to trigger a test run.
2018-08-25 00:48 node[18323] (FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-22)
events.js:165
      throw er; // Unhandled 'error' event
      ^

Error: Error watching file for changes: EMFILE
    at FSEvent.FSWatcher._handle.onchange (fs.js:1379:9)
Emitted 'error' event at:
    at FSEvent.FSWatcher._handle.onchange (fs.js:1382:12)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```

Check whether `watchman` is installed

```
brew info watchman
watchman: stable 4.9.0 (bottled), HEAD
Watch files and take action when they change
https://github.com/facebook/watchman
Not installed
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/watchman.rb
==> Dependencies
Build: autoconf ✔, automake ✔, libtool ✔, pkg-config ✔
Required: python@2 ✔, openssl ✔, pcre ✔
==> Requirements
Required: macOS >= 10.10 ✔
==> Options
--HEAD
	Install HEAD version
```

Solution is to install `watchman`

```
$ brew install watchman
```

## See also

- [macOS](/macOS.html)
- [Homebrew](/homebrew.html)

## References

- [Packager fails on macOS 10.12 Sierra · Issue #9309 · facebook/react-native](https://github.com/facebook/react-native/issues/9309#issuecomment-312621262)