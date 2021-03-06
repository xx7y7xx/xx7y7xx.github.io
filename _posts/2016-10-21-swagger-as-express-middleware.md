---
layout: post
title: Use swagger mock mode as express middleware
---

```
npm install swagger-express-mw --save
```

`app.js`

```js
var app = require('express')();

...

var SwaggerExpress = require('swagger-express-mw');

var config = {
  appRoot: __dirname,  // required config
  configDir: 'src/portalbillquery/swagger',
  swagger: 'src/portalbillquery/swagger/swagger.yaml'
};

SwaggerExpress.create(config, function(err, swaggerExpress) {
  if (err) { throw err; }

  // install middleware
  swaggerExpress.register(app);
});

app.listen(port, ip, function (error) {
    if (error) {
        console.error(error)
    } else {
        console.info("==>    Listening on port %s. Open up http://%s:%s/ in your browser.", port, ip, port)
    }
});
```

`src/portalbillquery/swagger/swagger.yaml`

```yml
swagger: '2.0'
info:
  version: "0.0.1"
  title: Mock mode test
host: localhost
basePath: /
schemes:
  - http
consumes:
  - application/json
produces:
  - application/json
paths:
  /weather:
    x-swagger-router-controller: weather
    get:
      responses:
        "200":
          description: Success
          schema:
            $ref: "#/definitions/WeatherResponse"
definitions:
  WeatherResponse:
    required:
      - message
    properties:
      message:
        type: string
```

`src/portalbillquery/swagger/defualt.yaml`

```yml
# swagger configuration file

# values in the swagger hash are system configuration for swagger-node
swagger:

  fittingsDirs: [ api/fittings ]
  defaultPipe: null
  swaggerControllerPipe: swagger_controllers  # defines the standard processing pipe for controllers

  # values defined in the bagpipes key are the bagpipes pipes and fittings definitions
  # (see https://github.com/apigee-127/bagpipes)
  bagpipes:

    _router:
      name: swagger_router
      mockMode: true
      mockControllersDirs: [ api/mocks ]
      controllersDirs: [ api/controllers ]

    _swagger_validate:
      name: swagger_validator
      validateResponse: true

    # pipe for all swagger-node controllers
    swagger_controllers:
      - onError: json_error_handler
      - cors
      - swagger_security
      - _swagger_validate
      - express_compatibility
      - _router

    # pipe to serve swagger (endpoint is in swagger.yaml)
    swagger_raw:
      name: swagger_raw

# any other values in this file are just loaded into the config for application access...
```