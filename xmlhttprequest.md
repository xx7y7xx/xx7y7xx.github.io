---
layout: page
title: XMLHttpRequest
---

## Request examples

### POST `content-type: application/json`

```js
const reqObj = {
  modid: rowObj.id,
  modcode: rowObj.code,
};
const oReq = new XMLHttpRequest();
oReq.open('POST', '/download', true);
oReq.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
oReq.responseType = 'arraybuffer';
oReq.onload = (oEvent) => { // eslint-disable-line no-unused-vars
  let blob = new Blob([oReq.response], { type: 'image/jpeg' });
  // eslint-disable-next-line no-undef
  saveAs(blob, 'expoted.jpg');
  // ...
};
oReq.send(JSON.stringify(reqObj));
```

### POST `content-type: application/x-www-form-urlencoded`

```js
const oReq = new XMLHttpRequest();
oReq.open('POST', 'http://10.3.14.238/fireport/rptfilemanage/download', true);
oReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
oReq.responseType = 'arraybuffer';
oReq.onload = (oEvent) => { // eslint-disable-line no-unused-vars
  let filename = 'exported.zip';
  let blob = new Blob([oReq.response], { type: 'image/jpeg' });
  // eslint-disable-next-line no-undef
  saveAs(blob, filename);
  // ...
};
oReq.send(`modid=${rowObj.id}&modcode=${rowObj.code}`);
```

## Get filename in response

[https://stackoverflow.com/a/40940790/4685522](https://stackoverflow.com/a/40940790/4685522)

```js
const oReq = new XMLHttpRequest();
// ...
oReq.onload = () => {
  const disposition = oReq.getResponseHeader('Content-Disposition');
  if (disposition && disposition.indexOf('attachment') !== -1) {
    const filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
    const matches = filenameRegex.exec(disposition);
    if (matches != null && matches[1]) {
      filename = matches[1].replace(/['"]/g, '');
    }
  }
}
```

## References

- [Send POST request open save as dialog to save file locally](https://gist.github.com/xxd3vin/9632138c49c94b38b2c632c40990f6f8)