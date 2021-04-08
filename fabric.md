---
layout: page
title: fabric
---

## npm install on ubuntu 16.04

prepare

(these dev packages are dependent by [node-canvas](https://www.npmjs.com/package/canvas))

( fabric needs [node-canvas](https://www.npmjs.com/package/canvas), and [node-canvas](https://www.npmjs.com/package/canvas) needs [Cairo](https://www.cairographics.org/) )

```
sudo apt install libgif-dev libjpeg-dev
```

start to install

```
npm install fabric --save
```

### fabric dependency tree

```
├─┬ fabric@2.0.0-beta.5
│ ├─┬ canvas@1.6.6
│ │ ├── nan@2.6.2
│ │ ├─┬ parse-css-font@2.0.2
│ │ │ ├── css-font-size-keywords@1.0.0
│ │ │ ├── css-font-stretch-keywords@1.0.1
│ │ │ ├── css-font-style-keywords@1.0.1
│ │ │ ├── css-font-weight-keywords@1.0.0
│ │ │ ├── css-global-keywords@1.0.1
│ │ │ ├─┬ css-list-helpers@1.0.1
│ │ │ │ └── tcomb@2.7.0 deduped
│ │ │ ├── css-system-font-keywords@1.0.0
│ │ │ ├── tcomb@2.7.0
│ │ │ └── unquote@1.1.0
│ │ └─┬ units-css@0.4.0
│ │   ├── isnumeric@0.2.0
│ │   └── viewport-dimensions@0.2.0
```