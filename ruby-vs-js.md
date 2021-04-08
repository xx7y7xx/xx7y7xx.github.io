---
layout: page
title: "Ruby vs Javascript"
---

| Command description            | Ruby                                 | Javascript                   |
| :----------------------------- | :----------------------------------- | :--------------------------- |
| create a Gemfile               | gem init                             | npm init -y                  |
| Dependency config file         | Gemfile                              | package.json                 |
| Install dependencies globally  | gem install <package>                | npm install -g <package>     |
| Add to dependency config file  | bundle add <package>                 | npm install <package> --save |
| Install dependency config file | bundle install                       | npm install                  |
| Run a package                  | [bundle exec][bundle-exec] <package> | npx <package>                |

[bundle-exec]: https://bundler.io/man/bundle-exec.1.html

## References

- [https://frontendgods.com/getting-started-with-ruby-for/](https://frontendgods.com/getting-started-with-ruby-for/)
