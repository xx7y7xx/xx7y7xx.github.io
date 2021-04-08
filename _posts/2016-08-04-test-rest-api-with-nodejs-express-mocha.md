---
layout: post
title: "Test Restfule API with Node.js expressjs and mocha"
date: 2016-08-04 00:29:33 +0800
categories: node mocha
---

## install deps

```
npm install supertest --save-dev
npm install should --save-dev
```

used as

```js
var request = require('supertest');
var should = require('should');
```

## step

```
mkdir test
vim test/test.js
```

## code

```js
const should = require('should'); 
const request = require('supertest');

describe('TIMS OCR server', function() {
  var url = 'http://127.0.0.1:3000';

  before(function(done) {
    done();
  });

  describe('图像上传接口', function() {
    it('should return error trying to save duplicate username', function(done) {
      var file_param = {
        "bill_pk": "123",
      	"note_type": 0,
        "doc_name": "test.jpg为上海增票",
        "recognize_type": "同步",
        "data": {
          "file_pk": "img123",
          "file_name": "test.jpg",
          "file_format": "jpg",
          "file_size": "", // stat --printf="%s" test.jpg
          "file_md5": "", // md5=($(md5sum test.jpg));echo $md5
          "desc": "a test.jpg image"
      	}
      };

      request(url)
        .post('/TIMS-Server/postController/uploadFile.action')
        .attach('file', 'test.jpg')
        .field('file_param', file_param)
        .expect('Content-Type', /json/)
        .expect(200) //Status code
        // end handles the response
        .end(function(err, res) {
          if (err) {
            throw err;
          }
          // Should.js fluent syntax applied
          res.body.should.have.property('_id');
          res.body.firstName.should.equal('JP');
          done();
        });
    });//ti
  });
});
```

## ref

- https://thewayofcode.wordpress.com/2013/04/21/how-to-build-and-test-rest-api-with-nodejs-express-mocha/