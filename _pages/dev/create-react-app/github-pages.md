---
layout: page
title: create-react-app GitHub pages
permalink: /dev/create-react-app/gitub-pages.html
---

## Github Pages

When your create-react-app project is ready.

### Method 1

Add this line to `package.json`

```
"homepage": "http://xx7y7xx.github.io/antd-table-pagination-react-router",
```

```
rm -rf docs
mv build docs
git commit -m 'Rebuild'
```

Open https://github.com/xxd3vin/antd-table-pagination-react-router/settings

Change the "Source" section in Github Pages setting page, using "master branch /docs folder".

### Method 2

Ref: [https://create-react-app.dev/docs/deployment#github-pages](https://create-react-app.dev/docs/deployment#github-pages)

1. Generate a personal access token on GitHub for this project, name "[brickdb] travis-ci upload static files to github". [https://github.com/settings/tokens](https://github.com/settings/tokens)

Only select scope "repo:public_repo"

2. Create a environment variable "GITHUB_PERSONAL_ACCESS_TOKEN" on Travis CI, value is the generated token.

3. Set homepage if your final website is like this "https://your-name.github.io/your-repo-name"

Add this line to `package.json`.

```json
{
  "homepage": "http://your-name.github.io/your-repo-name"
}
```

4. Create `.travis.yml`

```yml
# https://docs.travis-ci.com/user/languages/javascript-with-nodejs/
language: node_js
node_js:
  - 12
script:
  - npm test
  - npm run build

# https://docs.travis-ci.com/user/deployment/pages/
deploy:
  provider: pages
  github_token: $GITHUB_PERSONAL_ACCESS_TOKEN # Set in the settings page of your repository, as a secure variable
  skip_cleanup: true
  local_dir: build
  on:
    branch: main
```

## Using `"homepage"` in package.json, without messing up paths for localhost

https://stackoverflow.com/questions/43011207/using-homepage-in-package-json-without-messing-up-paths-for-localhost

```
"scripts": {
  "build": "react-scripts build",
  "build-localhost": "PUBLIC_URL=/ react-scripts build"
}
```
