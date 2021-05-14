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