---
layout: page
title: Babel
---

## Babel 5 to Babel 6

`.babelrc`

Babel 5

```
 {
   "stage": 0,
   "env": {
     "development": {
       "plugins": [
         "react-transform"
       ],
       "extra": {
         "react-transform": {
           "transforms": [{
             "transform": "react-transform-hmr",
             "imports": ["react"],
             "locals":  ["module"]
           }]
         }
       }
       "presets": ["es2015", "stage-0", "react"]
     }
   }
 }
```

Babel 6

- `stage` is deprecated
- `extra` is deprecated

```
{
  "presets": ["react", "es2015", "stage-0"],
  "env": {
    "development": {
      "plugins": [
        ["react-transform", {
          "transforms": [{
            "transform": "react-transform-hmr",
            "imports": ["react"],
            "locals":  ["module"]
          }]
        }]
      ],
    }
  }
}
```

Refs:

- [https://github.com/alexbeletsky/react-transform-boilerplate/commit/e0701bc8465c89fd07ccc3a6d3af4d364bdca2e4](https://github.com/alexbeletsky/react-transform-boilerplate/commit/e0701bc8465c89fd07ccc3a6d3af4d364bdca2e4)
- [https://github.com/gaearon/babel-plugin-react-transform/issues/46#issuecomment-152783885](https://github.com/gaearon/babel-plugin-react-transform/issues/46#issuecomment-152783885)