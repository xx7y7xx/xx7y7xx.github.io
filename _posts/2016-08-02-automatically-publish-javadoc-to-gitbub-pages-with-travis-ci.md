---
layout: post
title: "Automatically Publish Javadoc to GitHub Pages with Travis CI"
---

## prepare

1. a existen github project.
2. a `conf.json` to success to generate jsdoc html files into `out/` dir.
3. a Travis account - https://travis-ci.org/ .
4. Install [Ruby Gem](/gem.html)

## Enable project on travis-ci

Go to your profile page of travis-ci, for example [https://travis-ci.org/profile/xxd3vin](https://travis-ci.org/profile/xxd3vin)

If your project is not in the list, try press button "Sync account".

Then press the switch button on the left of project name.

## create `gh-pages` for a existen project on github.

```
cd ~/source/tims-ocr-api
git branch -a
git checkout --orphan gh-pages
git rm -rf .
echo "test" > index.html
git add index.html
git commit -m "clean publish branch"
git push --set-upstream origin gh-pages
```

## Switch to development branch

```
git checkout master
```

## Create github personal access token or use existen one

for example a1b2c3d4e5f6

## Encrypt your access token

Install `travis` command line tool, if you don't have one.

```
$ gem install travis
```

```
$ travis encrypt GH_TOKEN=a1b2c3d4e5f6

Detected repository as yyssc/tims-ocr-api, is this correct? |yes| yes
Please add the following to your .travis.yml file:

secure: "Ky/lA272zNC0..............................BtBEf9q+edjc="

Pro Tip: You can add it automatically by running with --add.
```

add `secure: ...` to `.travis.yml` config file. (An example .travis.yml config file: https://github.com/xxd3vin/xxd3vin.github.io/blob/develop/.travis.yml ,another example: https://github.com/xxd3vin/uui/blob/master/.travis.yml)

add `GH_TOKEN=a1b2c3d4e5f6` to [travis.org Environment Variables](https://travis-ci.org/yyssc/tims-ocr-api/settings)

## create post script `.utility/push-jsdoc-to-gh-pages.sh`

```sh
#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "yyssc/tims-ocr-api" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then

  echo -e "Publishing jsdoc...\n"

  cp -R "out/tims-ocr-api/2.0.5" $HOME/jsdoc-latest

  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/yyssc/tims-ocr-api gh-pages > /dev/null

  cd gh-pages
  git rm -rf ./jsdoc
  cp -Rf $HOME/jsdoc-latest ./jsdoc
  git add -f .
  git commit -m "Latest jsdoc on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
  git push -fq origin gh-pages > /dev/null

  echo -e "Published Javadoc to gh-pages.\n"
  
fi
```

add to post hook.

```
$ cat .travis.yml
...
after_success:
  - .utility/push-jsdoc-to-gh-pages.sh
...
```

## See also

- [Ruby gem](/gem)

## References

- https://help.github.com/articles/creating-project-pages-manually/
- https://benlimmer.com/2013/12/26/automatically-publish-javadoc-to-gh-pages-with-travis-ci/