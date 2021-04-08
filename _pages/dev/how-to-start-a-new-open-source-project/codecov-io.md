---
layout: page
permalink: /dev/how-to-start-a-new-open-source-project/codecov-io.html
title: Codecov.io
---

## GitHub App Integration (Optional)

Install GitHub App Integration ([https://github.com/apps/codecov](https://github.com/apps/codecov)).

## Generate report

Have a try whether the coverage report could be generated.

```
$ test --ci --coverage --watchAll=false
$ ls -1 coverage
clover.xml
coverage-final.json
lcov-report
lcov.info
```

## Add to `package.json`

```json
{
  "scripts": {
    "report": "react-scripts test --ci --coverage --watchAll=false && npx codecov -F unittests"
  }
}
```

## Set codecov.io upload token

Set your codecov.io upload token to Travis CI.

Find your token in codecov.io first.

[https://app.codecov.io/gh/your-name/your-repo](https://app.codecov.io/gh/your-name/your-repo)

Then put it in the "Environment Variables - Settings" of your project on Travis CI. ([https://www.travis-ci.com/github/your-name/your-repo/settings](https://www.travis-ci.com/github/your-name/your-repo/settings))

```
CODECOV_TOKEN=123456
```

## Add `npm run report` to `travis.yml`

```yml
script:
  - npm test
  # Generate code coverage report and upload to codecov.io
  - npm run eport
  - npm run build
```

## Show badge on the first page of the GitHub repo

Copy markdown of badge

[https://app.codecov.io/gh/your-user-name/your-repo-name/settings/badge](https://app.codecov.io/gh/your-user-name/your-repo-name/settings/badge)

Update `README.md`

```
# Your Repo Name [![codecov](https://codecov.io/gh/your-user-name/your-repo-name/branch/master/graph/badge.svg?token=123456)](https://codecov.io/gh/your-user-name/your-repo-name)

```

## Install Chrome extension to show code coverage information from Codecov on GitHub

[https://github.com/codecov/sourcegraph-codecov/blob/master/README.md](https://github.com/codecov/sourcegraph-codecov/blob/master/README.md)

## References

- [Get your NPM-package covered with Jest and Codecov ☂️](https://www.freecodecamp.org/news/get-your-npm-package-covered-with-jest-and-codecov-9a4cb22b93f4/)
- Jest
  - [Jest CLI Options](https://jestjs.io/docs/en/cli.html#--coverageboolean)
  - [Configuring Jest](https://jestjs.io/docs/en/configuration.html)
- [Running Tests | Create React App](https://create-react-app.dev/docs/running-tests/)
- [https://github.com/codecov/example-node](https://github.com/codecov/example-node)
- [Arguments - Codecov Bash uploader](https://docs.codecov.io/docs/about-the-codecov-bash-uploader#arguments)
