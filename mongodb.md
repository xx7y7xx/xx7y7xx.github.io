---
layout: page
title: mongodb
---

## mongo shell

```
chenyang@chenyang-pc:~$ mongo
MongoDB shell version: 3.2.8
connecting to: test
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
	http://docs.mongodb.org/
Questions? Try the support group
	http://groups.google.com/group/mongodb-user
Server has startup warnings: 
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-08-06T15:50:47.366+0800 I CONTROL  [initandlisten] 
> 
```

list all databases

```
> show dbs
local  0.000GB
mfc    0.000GB
```

To display the database you are using, type db:

```
> db
mfc
```

Print a list of all collections for current database

```
> show collections
changeshangs
```

simple query

```
> db.changeshangs.find()
{ "_id" : ObjectId("5980206225775d2299285b1c"), "name" : "xiaoyou", "__v" : 0 }
```

## install mongodb nodejs client for current project

```
npm install mongodb --save
```

create `m.js`:

```js
var MongoClient = require('mongodb').MongoClient
  , assert = require('assert');

// Connection URL
var url = 'mongodb://localhost:27017/myproject';

// Use connect method to connect to the server
MongoClient.connect(url, function(err, db) {
  assert.equal(null, err);
  console.log("Connected succesfully to server");

  db.close();
});
```

run

```
chenyang@chenyang-pc:~/source/ssc_ocr$ node m.js
Connected succesfully to server
```

some examples: https://gist.github.com/xxd3vin/3bf8b88e7abee9d09131fd223f84799d

## rename

https://jira.mongodb.org/browse/SERVER-701

```
$ mongo
> show dbs
local      0.000GB
my-site    0.000GB
myproject  0.000GB
> db.copyDatabase('my-site', 'ocr');
{ "ok" : 1 }
> show dbs
local      0.000GB
my-site    0.000GB
myproject  0.000GB
ocr        0.000GB
> use my-site
switched to db my-site
> db.dropDatabase();
{ "dropped" : "my-site", "ok" : 1 }
> show dbs
local      0.000GB
myproject  0.000GB
ocr        0.000GB
```

## query

按照创建时间排序，其实就是按照`_id`排序

```
> db.bills.find().sort({_id: -1}).limit(1)
```

## See also

- [mongodb install](/mongodb-install.html)

## References

- using shell client [https://docs.mongodb.com/getting-started/shell/client/](https://docs.mongodb.com/getting-started/shell/client/)
- using nodejs client [http://mongodb.github.io/node-mongodb-native/2.1/quick-start/?_ga=1.268288653.2086652299.1470468883](http://mongodb.github.io/node-mongodb-native/2.1/quick-start/?_ga=1.268288653.2086652299.1470468883)