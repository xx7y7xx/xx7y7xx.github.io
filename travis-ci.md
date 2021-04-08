---
layout: page
title: travis-ci
---

## GitHub Releases Uploading

[https://docs.travis-ci.com/user/deployment/releases/](https://docs.travis-ci.com/user/deployment/releases/)

```
travis setup releases
```

```yml
#sudo: required
#dist: trusty
language: node_js
node_js:
- '6'
#install:
#  - export DISPLAY=:99.0
#  - sh -e /etc/init.d/xvfb start
#  - wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#  - sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#  - sudo apt-get update -q
#  - sudo apt-get install -q google-chrome-stable
before_script:
- npm install
script:
- npm run build:portalbillquery
before_deploy:
- cd patch
- zip -r ../patch.zip .
- cd ..
deploy:
  provider: releases
  api_key:
    secure: cGRRRcIxI395CyVhKT9p+7dozUh0X6aroC1bzHO2joIWyF6bd603JRXwX3VorMzdLcweLgGhxvKtvtb+BUIoAWu1ij87u+db1nbrwqt4BnDARGggBExGYFSuo6Nvsk8DiyA2WR2UwwUPMvLDnUsDrtFsljrJ+190Z2iLZVBfNH6rgn2JjLhXH1wpAnUs4YmuNJXghushmWmgEQRUoIdD77z8HVJJIU+5f03zTClkUXaZEd93KOsTQCd1fRY6by8A6jwg+zBC7dzUv2p/ZaV5wBiG1deiZhpkUQOcIPVxo02iJVLZHFqE3qdZ1QrMndoUKQz2/HKq50uB4A5YJh9m8f6AGTw5xmRUbLBjVWLv92ywjqKt+wxDRnQtwkuXVpnAKwQANhuu9GnXdf7uzxEeu4W8WBllO0PIlKgyb+vMREw27FGlMxXaBn8yu1u0PCwTyEphsJeEddEqHM1df7k14pyv/gtKYpmUHSUY1AcAKnN+9tUhhDEknHyoE/ppOiNotuZUsEwgB3QM3E3zNMfFKxm/8W49QU8uYT5izOHJ+TNrq6ZNHcOhVr/dPOKLZUlJgBjtEvbqJCafRCD6UUleJvrfgoy2bxalxNrROC6Jx9ac56meTFMFWvDc/4wvAc7OXOeYP1QHgkCGO7wMHUzPg2hFlyW+NGOa3WvlJkYTuxI=
  file: patch.zip
  skip_cleanup: true
  on:
    tags: true
    repo: xxd3vin/demo
```

## How to use an older version of Chrome? TravisCI Chrome version is "too old"

```js
    capabilities: [{
        // maxInstances can get overwritten per capability. So if you have an in-house Selenium
        // grid with only 5 firefox instance available you can make sure that not more than
        // 5 instance gets started at a time.
        maxInstances: 5,
        //
        browserName: 'chrome',
        version: 51
    }],
```

[https://github.com/webdriverio/webdriverio/issues/1474](https://github.com/webdriverio/webdriverio/issues/1474)

## See also

- [Automatically Publish Javadoc to GitHub Pages with Travis CI](/2016/08/02/automatically-publish-javadoc-to-gitbub-pages-with-travis-ci.html)