---
layout: page
title: Atom plugins
permalink: /atom-plugins/index.html
---

## Theme

- seti-ui

## Packages

- open-recent
- project-manager
- minimap
- highlight-selected
- minimap-highlight-selected (will install highlight-selected)
- autoclose-html
- pigments
- auto-detect-indentation
- atom-beautify
- docblockr
- autocomplete-modules
- linter-eslint config: Fix errors on save
- git-plus
- vuejs
  - `language-vue`: syntax highlighting
- editorconfig
- language-markdown
- [`autocomplete-plus`](https://atom.io/packages/autocomplete-plus) (直接搜索插件名称找不到，可以搜索描述信息的第一句)
- [`flow-ide`](https://github.com/steelbrain/flow-ide) （有一个[`ide-flow`](https://github.com/lukehoban/atom-ide-flow)已经停止维护了）
- language-docker
- language-gitignore
- platformio-ide-terminal - Open a terminal in Atom

Atom doesn't have these plugins, but here is the replacements:

- [vscode-gitlens](https://github.com/eamodio/vscode-gitlens) -> Atom Commands: "git blame" to access the webpage of GitHub/GitLab blame page.

## For React

- language-babel syntax highlighting for jsx and es6 (this is not compactible with [atom-react](https://atom.io/packages/react) )

## For Typescript

- packages
  - atom-typescript
  - linter-tslint

## For markdown

- [prettier-atom](https://atom.io/packages/prettier-atom)

## editorconfig

ctrl+shift+p `EditorConfig: show state` 查看状态，修复问题，比如将官方的`whitespace`插件禁用了。

## open-on-github

[https://github.com/atom/open-on-github](https://github.com/atom/open-on-github)

```
# Fix error "No URL defined for remote: ." when using open-on-github package in Atom when in non default branch
[remote "."]
        url = git@gitlab.com:foo/bar.git
```

## See also

- [Atom](/atom.html)
