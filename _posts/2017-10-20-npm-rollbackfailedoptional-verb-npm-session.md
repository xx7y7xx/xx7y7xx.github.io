---
layout: post
title: "npm error rollbackFailedOptional: verb npm-session 5820b76c7d6419cf"
---

Here is the error message when trying to install `create-react-native-app` or other package with npm.

```
$ npm install -g create-react-native-app
npm info it worked if it ends with ok
npm verb cli [ '/usr/local/Cellar/node/8.7.0/bin/node',
npm verb cli   '/usr/local/bin/npm',
npm verb cli   'install',
npm verb cli   '-g',
npm verb cli   'create-react-native-app' ]
npm info using npm@5.5.1
npm info using node@v8.7.0
npm verb npm-session 5820b76c7d6419cf
⸨░░░░░░░░░░░░░░░░░░⸩ ⠧ rollbackFailedOptional: verb npm-session 5820b76c7d6419cf
```

When you try again, the error message may be different.

```
$ npm install -g create-react-native-app
npm info it worked if it ends with ok
npm verb cli [ '/usr/local/Cellar/node/8.7.0/bin/node',
npm verb cli   '/usr/local/bin/npm',
npm verb cli   'install',
npm verb cli   '-g',
npm verb cli   'create-react-native-app' ]
npm info using npm@5.5.1
npm info using node@v8.7.0
npm verb npm-session cd3c2ada6b59b819
npm verb type system
npm verb stack FetchError: request to https://registry.npmjs.org/create-react-native-app failed, reason: read ETIMEDOUT
npm verb stack     at ClientRequest.req.on.err (/usr/local/lib/node_modules/npm/node_modules/pacote/node_modules/make-fetch-happen/node_modules/node-fetch-npm/src/index.js:68:14)
npm verb stack     at emitOne (events.js:115:13)
npm verb stack     at ClientRequest.emit (events.js:210:7)
npm verb stack     at TLSSocket.socketErrorListener (_http_client.js:385:9)
npm verb stack     at emitOne (events.js:115:13)
npm verb stack     at TLSSocket.emit (events.js:210:7)
npm verb stack     at emitErrorNT (internal/streams/destroy.js:64:8)
npm verb stack     at _combinedTickCallback (internal/process/next_tick.js:138:11)
npm verb stack     at process._tickCallback (internal/process/next_tick.js:180:9)
npm verb cwd /Users/chenyang
npm verb Darwin 16.7.0
npm verb argv "/usr/local/Cellar/node/8.7.0/bin/node" "/usr/local/bin/npm" "install" "-g" "create-react-native-app"
npm verb node v8.7.0
npm verb npm  v5.5.1
npm ERR! code ETIMEDOUT
npm ERR! errno ETIMEDOUT
npm ERR! network request to https://registry.npmjs.org/create-react-native-app failed, reason: read ETIMEDOUT
npm ERR! network This is a problem related to network connectivity.
npm ERR! network In most cases you are behind a proxy or have bad network settings.
npm ERR! network
npm ERR! network If you are behind a proxy, please make sure that the
npm ERR! network 'proxy' config is set properly.  See: 'npm help config'
npm verb exit [ 1, true ]

npm ERR! A complete log of this run can be found in:
npm ERR!     /Users/chenyang/.npm/_logs/2017-10-20T07_56_18_886Z-debug.log
```

So finally, I found it is a network issue.

## References

- [https://github.com/npm/npm/issues/17246#issuecomment-311050212](https://github.com/npm/npm/issues/17246#issuecomment-311050212)
