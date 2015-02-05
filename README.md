d-teamwork
========

A Javascript/Coffescript/Node.js DSL lib to interact with teamwork API

## Usage

```coffee
Teamwork = require 'd-teamwork'
teamwork = new Teamwork(config.teamwork.url, config.teamwork.token, config.teamwork.password)

teamwork.project(1).tasks().query(filter: 'completed').get (err, response, body) ->
  console.log err, response, body

teamwork.time(1).get (err, response, body) ->
  console.log err, response, body
```

## License

Licensed under <a href="http://krolow.mit-license.org/">The MIT License</a>
Redistributions of files must retain the above copyright notice.

## Author

Vinícius Krolow - krolow[at]gmail.com
