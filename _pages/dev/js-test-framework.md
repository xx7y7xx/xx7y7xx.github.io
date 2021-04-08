---
layout: page
title: Javascript test framework
permalink: /dev/js-test-framework.html
---

## Table

| Name                                     | Framework | Runner | E2E | BDD | TDD |
| :--------------------------------------- | :-------- | ------ | --- | --- | --- |
| [AVA](https://github.com/avajs/ava)      | N         | Y      |     |     |     |
| [Chai](https://www.chaijs.com/)          | N         |        |     | Y   | Y   |
| [cypress](https://www.cypress.io/)       | Y         | N      | Y   |     |     |
| [Jasmine](https://jasmine.github.io/)    | Y         |        |     | Y   |     |
| [Jest](https://jestjs.io/)               | Y         | N      |     |     |     |
| [Karma](https://karma-runner.github.io/) | N         | Y      |     |     |     |
| [Mocha](https://mochajs.org/)            | Y         | Y      |     |     |     |
| [WebdriverIO](https://webdriver.io/)     | Y         |        |     |     |     |

## Useful libraries for test framework

These are not test framework, but some useful libraries when you want to unit test your code with supports spies, stubs, and mocks.

- [Sinon.JS](https://sinonjs.org/)

## CasperJS

Pros: Simple
Cons: Denpends on PhantomJS or SlimerJS. But PhantomJS development is suspended until further notice ([details](https://github.com/ariya/phantomjs/issues/15344)). And the latest version SlimerJS 1.0.0 is compatible with Firefox from 53.0 to 59.0. Now (2020-07) the latest Firefox version is 78.0.2)

## References

- [List of unit testing frameworks - Javascript](https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#JavaScript)
- [Testing Tools](https://frontendmasters.com/books/front-end-handbook/2018/tools/testing.html)
- [What is Front End Testing? Tools & Frameworks](https://www.guru99.com/frontend-testing.html)
