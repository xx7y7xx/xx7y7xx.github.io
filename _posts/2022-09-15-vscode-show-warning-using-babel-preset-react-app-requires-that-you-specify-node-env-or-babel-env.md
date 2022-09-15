---
layout: post
title: "VSCode show warning: Using babel-preset-react-app requires that you specify NODE_ENV or BABEL_ENV"
---

VSCode show warning on the first line of every js file:

```
Parsing error: [BABEL] /Users/.../App.js: Using `babel-preset-react-app` requires that you specify `NODE_ENV` or `BABEL_ENV` environment variables. Valid values are "development", "test", and "production". Instead, received: undefined. (While processing: "/Users/.../node_modules/babel-preset-react-app/index.js")
```

Solution:

```diff
diff --git a/.eslintrc.json b/.eslintrc.json
index d3fa1ee..7657259 100644
--- a/.eslintrc.json
+++ b/.eslintrc.json
@@ -12,6 +12,12 @@
   "parserOptions": {
     "parser": "@typescript-eslint/parser",
     "sourceType": "module",
-    "ecmaVersion": 2015
+    "ecmaVersion": 2015,
+    "babelOptions": {
+      "presets": [
+        ["babel-preset-react-app", false],
+        "babel-preset-react-app/prod"
+      ]
+    }
   }
 }
```

## References

- Babel error immediately on eject - https://github.com/facebook/create-react-app/issues/12070
