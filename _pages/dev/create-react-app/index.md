---
layout: page
title: create-react-app
permalink: /dev/create-react-app/index.html
---

## With installation

Install

```
$ npm install -g create-react-app
```

Upgrade

```
$ npm update -g create-react-app
```

Create repo

```
$ create-react-app foo
$ cd foo
$ yarn start
```

Uninstall

```
$ npm uninstall -g create-react-app
```

## Without installation

Method 1

```
$ npm init react-app my-app
```

Method 2

```
$ npx create-react-app my-app
```

## Config

Create `.editorconfig` with content:

```
# EditorConfig is awesome: https://EditorConfig.org

# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

# Matches multiple files with brace expansion notation
# Set default charset
[*.{js,jsx}]
charset = utf-8
quote_type = single
```

## Github Pages

When your create-react-app project is ready.

### Method 1

Add this line to `package.json`

```
"homepage": "http://xxd3vin.github.io/antd-table-pagination-react-router",
```

```
rm -rf docs
mv build docs
git commit -m 'Rebuild'
```

[https://github.com/xxd3vin/antd-table-pagination-react-router/settings](https://github.com/xxd3vin/antd-table-pagination-react-router/settings)

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

## Test

Access [https://xxd3vin.github.io/antd-table-pagination-react-router/](https://xxd3vin.github.io/antd-table-pagination-react-router/)

## react-router and react-router-dom

```
yarn add react-router-dom
```

[https://github.com/xxd3vin/antd-table-pagination-react-router/commit/54186065b0a35fe4fb77068a5f3a95829aae2337](https://github.com/xxd3vin/antd-table-pagination-react-router/commit/54186065b0a35fe4fb77068a5f3a95829aae2337)

## antd

```
yarn add antd
```

Modify `src/index.js`, add below line just before `import './index.css';`

```
import 'antd/dist/antd.css';
```

## Customizing create-react-app: How to Make Your Own Template

[https://auth0.com/blog/how-to-configure-create-react-app/](https://auth0.com/blog/how-to-configure-create-react-app/)

## Config override in `package.json`

### jest

Check which key in `package.json` could override the jest config: [https://create-react-app.dev/docs/running-tests/#configuration](https://create-react-app.dev/docs/running-tests/#configuration)

| Keys in `package.json` | Config Key          |
| :--------------------- | :------------------ |
| collectCoverageFrom    | collectCoverageFrom |

Note: `collectCoverage` in jest config is not supported by override this way. Need passing from CLI `react-scripts test --coverage`

## Passing environment variables to source code {#pass-env-var}

```js
class Map extends Component {
  render() {
    const key = process.env.REACT_APP_GOOGLE_MAPS_API_KEY;
    return <GoogleMap apiKey={key} />;
  }
}
```

Setup environment variables in Travis CI

[https://travis-ci.com/github/your-user-name/your-repo-name/settings](https://travis-ci.com/github/your-user-name/your-repo-name/settings)

## References

- [https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#deployment](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#deployment)
- [https://github.com/facebook/create-react-app/pull/520](https://github.com/facebook/create-react-app/pull/520)
- [https://ant.design/docs/react/introduce](https://ant.design/docs/react/introduce)
