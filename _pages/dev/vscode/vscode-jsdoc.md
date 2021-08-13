---
layout: page
title: "VS Code and JSDoc"
permalink: /dev/vscode/index.html
---

## Type Definitions

```js
// src/Application/helpers/filesListHelpers.js
/**
 * File from Google Drive
 * @typedef {Object} File
 * @property {Object} imageMediaMetadata
 * @property {string} thumbnailLink
 * @property {string} webContentLink
 * @property {string} webViewLink
 */

/**
 * @export
 * @returns {Promise<File[]>}
 */
export const getPhotos = async (setMediaItems) => {
  // ...
};
```

```js
// src/Application/Map/helpers.js
/**
 * @param {import("../helpers/filesListHelpers").File[]} files
 */
export const addMarkersToAMap = async (files) => {
  // ...
};
```

If you have a `type.js` which only contains the comments of type definition, don't forget to add a fake export at the end of `type.js`.

```js
// type.js
/**
 * @typedef {Object} Foo
 */
/**
 * @typedef {Object} Bar
 */
export {};
```

Ref: [https://github.com/microsoft/TypeScript/issues/25386#issuecomment-404691034](https://github.com/microsoft/TypeScript/issues/25386#issuecomment-404691034)
