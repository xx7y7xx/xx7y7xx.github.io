---
layout: page
title: React-native npm start Unable to start server
---

```
 ~/source/tmp/AwesomeProject  npm start
npm info it worked if it ends with ok
npm verb cli [ '/usr/local/Cellar/node/8.7.0/bin/node',
npm verb cli   '/usr/local/bin/npm',
npm verb cli   'start' ]
npm info using npm@5.5.1
npm info using node@v8.7.0
npm verb run-script [ 'prestart', 'start', 'poststart' ]
npm info lifecycle AwesomeProject@0.1.0~prestart: AwesomeProject@0.1.0
npm info lifecycle AwesomeProject@0.1.0~start: AwesomeProject@0.1.0

> AwesomeProject@0.1.0 start /Users/chenyang/source/tmp/AwesomeProject
> react-native-scripts start

4:25:35 PM: Unable to start server
See https://git.io/v5vcn for more information, either install watchman or run the following snippet:
  sudo sysctl -w kern.maxfiles=5242880
  sudo sysctl -w kern.maxfilesperproc=524288

npm verb lifecycle AwesomeProject@0.1.0~start: unsafe-perm in lifecycle true
npm verb lifecycle AwesomeProject@0.1.0~start: PATH: /usr/local/lib/node_modules/npm/bin/node-gyp-bin:/Users/chenyang/source/tmp/AwesomeProject/node_modules/.bin:/Users/chenyang/.rvm/gems/ruby-2.2.6/bin:/Users/chenyang/.rvm/gems/ruby-2.2.6@global/bin:/Users/chenyang/.rvm/rubies/ruby-2.2.6/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/chenyang/.rvm/bin
npm verb lifecycle AwesomeProject@0.1.0~start: CWD: /Users/chenyang/source/tmp/AwesomeProject
npm info lifecycle AwesomeProject@0.1.0~start: Failed to exec start script
npm verb stack Error: AwesomeProject@0.1.0 start: `react-native-scripts start`
npm verb stack Exit status 1
npm verb stack     at EventEmitter.<anonymous> (/usr/local/lib/node_modules/npm/node_modules/npm-lifecycle/index.js:280:16)
npm verb stack     at emitTwo (events.js:125:13)
npm verb stack     at EventEmitter.emit (events.js:213:7)
npm verb stack     at ChildProcess.<anonymous> (/usr/local/lib/node_modules/npm/node_modules/npm-lifecycle/lib/spawn.js:55:14)
npm verb stack     at emitTwo (events.js:125:13)
npm verb stack     at ChildProcess.emit (events.js:213:7)
npm verb stack     at maybeClose (internal/child_process.js:927:16)
npm verb stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:211:5)
npm verb pkgid AwesomeProject@0.1.0
npm verb cwd /Users/chenyang/source/tmp/AwesomeProject
npm verb Darwin 16.7.0
npm verb argv "/usr/local/Cellar/node/8.7.0/bin/node" "/usr/local/bin/npm" "start"
npm verb node v8.7.0
npm verb npm  v5.5.1
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! AwesomeProject@0.1.0 start: `react-native-scripts start`
npm ERR! Exit status 1
npm ERR!
npm ERR! Failed at the AwesomeProject@0.1.0 start script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
npm verb exit [ 1, true ]

npm ERR! A complete log of this run can be found in:
npm ERR!     /Users/chenyang/.npm/_logs/2017-10-20T08_25_35_473Z-debug.log
```

```
 ~  sudo sysctl -w kern.maxfiles=5242880
Password:
kern.maxfiles: 12288 -> 5242880
 ~  sudo sysctl -w kern.maxfilesperproc=524288
kern.maxfilesperproc: 10240 -> 524288
```

## References

- [https://github.com/react-community/create-react-native-app/issues/234](https://github.com/react-community/create-react-native-app/issues/234)