---
layout: page
title: jimp
---

[https://github.com/oliver-moran/jimp](https://github.com/oliver-moran/jimp)

## auto crop images

```js
const Jimp = require("jimp");

module.exports = function crop(filename) {
  Jimp.read(`output/${filename}`, function (err, image) {
    if (err) throw err;
    image.autocrop(0.0003, false)
      // .resize(256, 256)
      .write(`output/${filename}`);
  });
}
```

## write callback

`.write(path, callback)`

```js
Jimp
  .read('foo.jpg')
  .then((image) => {
    image.write('bar.jpg', (error, image) => {
      if (error) throw error;
    });
  })
  
```

## Remove callback from Jimp.read()

[https://github.com/oliver-moran/jimp/commit/b1359b9987fba8f08dc538143aae11d67926fb34#diff-168726dbe96b3ce427e7fedce31bb0bc](https://github.com/oliver-moran/jimp/commit/b1359b9987fba8f08dc538143aae11d67926fb34#diff-168726dbe96b3ce427e7fedce31bb0bc)

