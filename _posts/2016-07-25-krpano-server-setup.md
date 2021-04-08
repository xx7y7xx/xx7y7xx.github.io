---
layout: post
title:  "krpano server setup"
date:   2016-07-25 00:29:33 +0800
categories: krpano
---

```
cd source
mkdir krpnao-server
cd krpano-server
npm init
npm install express --save
```

generate default app

```
sudo npm install express-generator -g
express krpano-server
npm install
DEBUG=myapp:* npm start
```

http://localhost:3000/