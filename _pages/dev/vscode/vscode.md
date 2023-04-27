---
layout: page
title: vscode
permalink: /dev/vscode/index.html
---

## user setting

```js
// Place your settings in this file to overwrite the default settings
{
    "workbench.iconTheme": "vscode-icons",
    "editor.renderWhitespace": "all",
    "editor.tabSize": 2,
    "window.zoomLevel": 0,
    "files.exclude": {
        "**/node_modules": true
    },
    "eslint.autoFixOnSave": true
}
```

showing the exact file path of the current file is to use breadCrumbs

Command+, to open the user settings, enter `breadCrumbs`

![](/attachments/Jietu20181012-170049.jpg)

![](/attachments/Jietu20181012-170542.jpg)

## Common keyboard shortcuts

- `Ctrl+Shift+\` jump to closing bracket
- `Ctrl+g` jump to line and column(offset), input `12:34`, this to jump to line 12 and column 34.

## [js] Experimental support for decorators is a feature that is subject to change in a future release. Set the 'experimentalDecorators' option to remove this warning.

Create `tsconfig.json` under project root dir

```json
{
  "compilerOptions": {
    "experimentalDecorators": true,
    "allowJs": true
  }
}
```

[https://ihatetomatoes.net/how-to-remove-experimentaldecorators-warning-in-vscode/](https://ihatetomatoes.net/how-to-remove-experimentaldecorators-warning-in-vscode/)

## features

### column editor

Shift+Alt+Down

## plugins

Ctrl+P, `ext install docthis`

- `vscode-eslint`
  - `"eslint.autoFixOnSave": true` enables auto fix on save.
- `debugger-for-chrome`
- docthis
- npm
- npm-intellisense
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons) (Needs to restart vscode, not reload)
- code-settings-sync
- autofilename
- [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- vue
  - [vetur](https://github.com/vuejs/vetur)
- `formulahendry.auto-rename-tag`: Automatically rename paired HTML/XML tag, same as Visual Studio IDE does.
- `formulahendry.auto-close-tag`: Automatically add HTML/XML close tag, same as Visual Studio IDE or Sublime Text does.

### for typescript

- vscode-tslint
  - `"tslint.autoFixOnSave": true` enable auto fix on save.

## FAQ

### VSCode not auto completing HTML

1. type `div` or `<div`
2. press `Tab` key
3. Optional, press `Tab` key again

[https://stackoverflow.com/a/37638626/4685522](https://stackoverflow.com/a/37638626/4685522)

### How can I change keyboard shortcut bindings in Visual Studio Code?

Click File -> Preferences -> Keyboard shortcuts.

```
// Place your key bindings in this file to overwrite the defaults
[
    { "key": "ctrl+o",                "command": "workbench.action.files.openFile" },

    { "key": "ctrl+alt+k",            "command": "bookmarks.toggle",
                                     "when": "editorTextFocus" }

]
```

[https://stackoverflow.com/a/33791170/4685522](https://stackoverflow.com/a/33791170/4685522)

### How do you format code on save in VS Code

```json
{
  "editor.formatOnSave": true
}
```

[https://stackoverflow.com/a/39973431/4685522](https://stackoverflow.com/a/39973431/4685522)

### exclude dirs

Set workspace settings: `.vscode/settings.json`

```
// Place your settings in this file to overwrite default and user settings.
{
  "files.exclude": {
    "**/amd": true,
    "**/coverage": true,
    "**/dist": true,
    "**/docs-built": true,
    "**/es": true,
    "**/lib": true,
    "**/tmp-docs-repo": true
  }
}
```

[https://github.com/Microsoft/vscode/issues/78](https://github.com/Microsoft/vscode/issues/78)

### Show whitespace characters in Visual Studio Code

[https://stackoverflow.com/a/30140625/4685522](https://stackoverflow.com/a/30140625/4685522)

```js
"editor.renderWhitespace": "all",
```

### Open file with fuzzy search on workspace

Ctrl+P, then input filename to search, press enter to open selected file.

## Error: Using `babel-preset-react-app` requires that you specify `NODE_ENV` or `BABEL_ENV` environment variables. Valid values are "development", "test", and "production". Instead, received: undefined.

On the first line of a file in create-react-app project (already eject)

```
import React, { useEffect } from 'react';
```

The error is:

```
Parsing error: [BABEL] /Users/devin.chenyang/source/github.com/xx7y7xx/kepler.gl-examples/src/App.js: Using `babel-preset-react-app` requires that you specify `NODE_ENV` or `BABEL_ENV` environment variables. Valid values are "development", "test", and "production". Instead, received: undefined. (While processing: "/Users/devin.chenyang/source/github.com/xx7y7xx/kepler.gl-examples/node_modules/babel-preset-react-app/index.js") eslint
```

See the snapshot:

![](/attachments/vscode_eslint_error_babel_env.png)

Solution:

Add this line to `package.json`

```
"parser": "@typescript-eslint/parser",
```

```json
{
  "eslintConfig": {
    "parser": "@typescript-eslint/parser",
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  }
}
```

## See also

- [VS Code x Go](/vscode-go.md)
