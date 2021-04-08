---
title: panode
---

[https://www.npmjs.com/package/panode](https://www.npmjs.com/package/panode)

```
root@ubuntu-512mb-nyc1-01:~# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
root@ubuntu-512mb-nyc1-01:~# sudo apt-get install -y nodejs
root@ubuntu-512mb-nyc1-01:~# mkdir panode
root@ubuntu-512mb-nyc1-01:~# cd panode
root@ubuntu-512mb-nyc1-01:~/panode# npm install panode
```

edit `index.js`

```js
var pano = require('panode');

var myPano = pano.generate({
    lat: '52.347358',
    lng: '4.847041',
    outputLocation: __dirname + '/panorama.jpg'
}, function() {
    console.log("Panorama saved, do something else");
});
```

```
root@ubuntu-512mb-nyc1-01:~/panode# npm install fs-extra
root@ubuntu-512mb-nyc1-01:~/panode# apt-get install hugin-tools
root@ubuntu-512mb-nyc1-01:~/panode# apt-get install enblend
root@ubuntu-512mb-nyc1-01:~/panode# node index.js 
```


```
root@ubuntu-512mb-nyc1-01:~/panode# node index.js 
Generating panorama for 52.347358 / 4.847041
Panorama generated!
Panorama saved, do something else

root@ubuntu-512mb-nyc1-01:~/panode# ls
index.js  node_modules  panorama.jpg
root@ubuntu-512mb-nyc1-01:~/panode# file panorama.jpg 
panorama.jpg: TIFF image data, little-endian
```