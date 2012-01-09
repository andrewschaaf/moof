(function() {
  var Event, bodyOn;

  Event = require('./event').Event;

  bodyOn = function(k, f) {
    return document.body['on' + k] = function(e) {
      return f(new Event(e));
    };
  };

  module.exports = {
    bodyOn: bodyOn
  };

}).call(this);
