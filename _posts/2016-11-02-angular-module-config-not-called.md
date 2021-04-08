---
layout: post
title: "Angular module config not called"
---

# Angular module config not called

`app/app.js` (This sample project coming from [angular-seed](https://github.com/angular/angular-seed))

```js
// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.view1',
  'myApp.view2',
  'myApp.version'
]).
config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  debugger;
  $locationProvider.hashPrefix('!');

  $routeProvider.otherwise({redirectTo: '/view1'});
}]);
```

Chrome debugger will not stop at `debugger`, cause `config` is not called.

That is becuase `ng-app="myApp"` was missing from the root HTML element, usually at `<html>`:

```html
<html lang="en" ng-app="myApp" class="no-js">
```

Or maybe in `<div>` element.

```html
<div class="fuck-lfw" ng-app="myApp">
```

See [http://stackoverflow.com/a/36063080/4685522](http://stackoverflow.com/a/36063080/4685522) for the same mistake.

## References

- [http://stackoverflow.com/a/36063080/4685522](http://stackoverflow.com/a/36063080/4685522)
- [https://docs.angularjs.org/api/ng/directive/ngApp#usage](https://docs.angularjs.org/api/ng/directive/ngApp#usage)
- [http://www.w3schools.com/angular/ng_ng-app.asp](http://www.w3schools.com/angular/ng_ng-app.asp)