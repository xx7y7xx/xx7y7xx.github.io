---
layout: page
title: keystone
---

generate a new project dir.

```
npm install -g generator-keystone yo
mkdir my-test-project
cd my-test-project
yo keystone
```

start website

```
cd my-site
node keystone
```

a demo generated by generator-keystone: https://github.com/xx7y7xx/my-keystone-demo

## database

modify `.env`

```
## database
MONGO_URI=mongodb://localhost:27017/my-site
```
