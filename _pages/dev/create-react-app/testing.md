---
layout: page
title: Create React App Testing
permalink: /dev/create-react-app/testing.html
---

## Jest `transformIgnorePatterns`

When source code of a npm package like `react-native-button` (https://unpkg.com/browse/react-native-button@3.0.1/) is not pre-compiled (by Babel). You sould mark it in config file to let Jest/Babel to compile it before running tests.

```json
{
  "jest": {
    "transformIgnorePatterns": [
      "node_modules/(?!(react-native|my-project|react-native-button)/)"
    ]
  }
}
```
