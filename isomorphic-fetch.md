---
layout: page
title: isomorphic-fetch
---

[https://github.com/matthew-andrews/isomorphic-fetch](https://github.com/matthew-andrews/isomorphic-fetch)

## sample

### hello world

```js
require('es6-promise').polyfill();
require('isomorphic-fetch');

fetch('//offline-news-api.herokuapp.com/stories')
    .then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    })
    .then(function(stories) {
        console.log(stories);
    });
```

### HTTP Header

```js
const opts = {
  headers: {
    'Accept': 'application/json'
  }
};
fetch(url, opts).then();
```

### POST with `content-type: x-www-form-urlencoded`

```js
var opts = {
  method: 'post',
  headers: {
    'Content-type': 'application/x-www-form-urlencoded'
  },
  mode: "cors",
  body: 'doctype=dept&foo=bar'
};

var url = '/ficloud_pub_ctr/initgrid';
fetch(url, opts)
  .then(response => {
    console.log('Response data:', response.json());
  })
  .catch(function (err) {
    console.log("fetch error:", err);
  });
```

### POST with `content-type: application/json`

```js
var opts = {
  method: 'post',
  headers: {
    'Content-type': 'application/json'
  },
  mode: "cors",
  body: JSON.stringify({
    doctype: baseDocId
  })
};

var url = '/ficloud_pub_ctr/initgrid';
fetch(url, opts)
  .then(response => {
    console.log('Response data:', response.json());
  })
  .catch(function (err) {
    console.log("fetch error:", err);
  });
```

### POST with `content-type: multipart/form-data`

```js
const data = new FormData();
data.append('id', '0');
// data.append('modcode', code);
// data.append('appid', appid);
// data.append('tenantid', tenantid);
let opts = {
  method: 'post',
  mode: 'cors',
  body: data,
};
return fetch(RPTFILEMANAGE_UPLOAD, opts)
  .then(response => {
    console.log('Response data:', response.json());
  })
  .catch(function (err) {
    console.log("fetch error:", err);
  });
```

## References

- [https://github.github.io/fetch](https://github.github.io/fetch)