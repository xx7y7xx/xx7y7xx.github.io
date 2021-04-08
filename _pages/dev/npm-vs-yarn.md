---
layout: page
permalink: /dev/npm-vs-yarn.html
title: npm vs yarn
categories: [development, nodejs]
---

| Action                               | npm                                 | yarn                                |
| ------------------------------------ | ----------------------------------- | ----------------------------------- |
| Install a package globally           | `npm i eslint -g`                   | `yarn global add eslint`            |
| Upgrade a global package             | `npm update -g eslint`              | `yarn global add eslint`            |
| Upgrade all global package           | `npm update -g`                     | `yarn global upgrade` |
| Uninstall a package globally         | `npm uninstall -g create-react-app` | `yarn global remove eslint`         |
| List all globally installed packages | `npm ls -g --depth 0`               | `yarn global list`                  |
| List one globally installed package  | `npm ls create-react-app -g`        | `yarn global list create-react-app` |
| Show package latest version          | `npm show create-react-app version` | `***` |

## See also

- [npmjs](/dev/npmjs.html)
- [yarn](/dev/yarn.html)

## References

- [https://classic.yarnpkg.com/en/docs/migrating-from-npm/](https://classic.yarnpkg.com/en/docs/migrating-from-npm/)
