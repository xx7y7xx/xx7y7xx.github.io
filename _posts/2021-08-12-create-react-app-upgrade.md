---
layout: post
title: "create-react-app upgrade"
---

Following [https://github.com/facebook/create-react-app/blob/main/CHANGELOG.md](https://github.com/facebook/create-react-app/blob/main/CHANGELOG.md), I want to upgrade from 3.4.3 to 4.0.0

```
$ yarn add --exact react-scripts@4.0.0
```

After re-run `yarn start`

I saw this error

```
Failed to compile.

./src/Application/index.css (./node_modules/css-loader/dist/cjs.js??ref--5-oneOf-4-1!./node_modules/postcss-loader/src??postcss!./src/Application/index.css)
Error: Can't resolve '/loading.gif' in '/Users/chenyang/source/github/photo-map/photo-map.github.io/src/Application'
```

This is because of the soure code in `index.css` file.

```css
.amap-marker img {
  background: transparent url("/loading.gif") center no-repeat;
}
```

This image file is in `ROOT/loading.gif`, not in `src` dir.

After some searching, I cound this related answer: [https://stackoverflow.com/a/66648487/4685522](https://stackoverflow.com/a/66648487/4685522)

So my final solution is put the `loading.gif` in `src/assets` dir.

```css
.amap-marker img {
  background: transparent url("./assets/loading.gif") center no-repeat;
}
```
