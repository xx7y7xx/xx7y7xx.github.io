---
layout: page
title: gruntjs
---

## installation

```
sudo npm update -g npm
sudo npm install -g grunt-cli # CLI tool `grunt`
```

add per project

```
npm install grunt --save-dev
```

## plugins

### grunt-jsdoc

```
npm install grunt-jsdoc --save-dev
```

append this line

```
grunt.loadNpmTasks('grunt-jsdoc');
```

to `Gruntfile`

```js
module.exports = function(grunt) {

  grunt.initConfig({
...
    jsdoc : {
        dist : {
            src: ['src/*.js', 'test/*.js'],
            options: {
                destination: 'doc'
            }
        }
    }
...
  });

  ...

  grunt.loadNpmTasks('grunt-jsdoc');

  grunt.registerTask('default', ['jsdoc']);

};
```
