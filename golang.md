---
layout: page
title: golang
---

## Manually install

### installation on macOS

download pkg from [https://golang.org/dl/](https://golang.org/dl/) and install it.

### Install all dependencies for current project

`cd` into current project dir

```
go get ./...
```

## Via Homebrew

```
$ brew install go@1.13
```

## lint error

```
File is not correctly formatted according to goimports.
```

```
goimports -w main.go
```

this will update the original `main.go` file.
