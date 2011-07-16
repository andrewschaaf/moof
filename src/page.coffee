
{Event} = require './event'


bodyOn = (k, f) ->
  document.body['on' + k] = (e) ->
    f new Event e


module.exports =
  bodyOn: bodyOn

