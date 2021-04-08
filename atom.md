---
layout: page
title: Atom
---

## Sub pages

- [Atom Commands](/atom-commands)

## Shortcuts

### Command Palette

<kbd class="platform-mac">Cmd+Shift+P</kbd>

Then input the command, e.g. "about", will jump to the About page of Atom.

### Fuzzy Finder

<kbd class="platform-mac">Cmd+T/Ctrl+P</kbd>

Then input the filename, e.g. "atom.md", will open this file.

## config

config example: [https://github.com/xxd3vin/env/blob/master/.atom/config.cson](https://github.com/xxd3vin/env/blob/master/.atom/config.cson)

### "Remove Trailing Whitespace" should not be on by default

[https://github.com/atom/whitespace/issues/10#issuecomment-85183781](https://github.com/atom/whitespace/issues/10#issuecomment-85183781)

```
"*":
  whitespace:
    removeTrailingWhitespace: false
```

## install in ubuntu 16.04

```
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
```

## http proxy

[Convert Shadowsocks into an HTTP proxy](https://github.com/shadowsocks/shadowsocks/wiki/Convert-Shadowsocks-into-an-HTTP-proxy)

[Polipo](https://www.irif.fr/~jch/software/polipo/) is a option. (But Polipo is no longer maintained)

[Privoxy](https://www.privoxy.org/) is another option.

Follow the instructions here: [privoxy](/privoxy.html)

[Set proxy with apm config](/apm-config.html#set-proxy)

## search exclude

### Config

[https://github.com/xxd3vin/env/blob/master/.atom/config.cson](https://github.com/xxd3vin/env/blob/master/.atom/config.cson)

```
vim ~/.atom/config.cson
```

```

"*":
  core:
    ignoredNames: [
      ".git"
      ".hg"
      ".svn"
      ".DS_Store"
      "._*"
      "Thumbs.db"
      "desktop.ini"
      "node_modules"
      "dist"
      "coverage"
      ".happypack"
      ".nuxt"
    ]
```

Atom, Preferences, Core, Core Settings, Ignored Names:

![](/attachments/atom-config-ignorenames.jpg)

## Search in Projects

Search `debug(` in project `xxd3vin.github.io`, and ignore `node_modules` dir.

search keyword

```
debug(
```

filter

```
xxd3vin.github.io, !node_modules
```

Ref: [https://github.com/atom/find-and-replace/issues/149#issuecomment-36959881](https://github.com/atom/find-and-replace/issues/149#issuecomment-36959881)

### Exclude some file type

Search in the `src/api` dir, and exclude the test files.

```
src/api,!*.test.js
```

## eslint

https://github.com/AtomLinter/linter-eslint

### vue # {#eslint-vue}

To lint `*.vue` file, just to enable the "Lint HTML Files" option in `linter-eslint` configuration.

And install `eslint-plugin-html`

```
npm i eslint-plugin-html -D
```

Add this plugin to `.eslintrc`

```js
{
  plugins: ["html"];
}
```

## plugins

To: [Atom plugins](/atom-plugins/index.html)

## keyboard shortcuts for macOS

[https://gist.github.com/chrissimpkins/5bf5686bae86b8129bee](https://gist.github.com/chrissimpkins/5bf5686bae86b8129bee)

- `⌃-m` - Go to Matching Bracket
- `⌘-F2` - Toggle Bookmark

## See also

- [apm config](/apm-config.html)
