(function() {
  var mixInEventEmitter;
  var __slice = Array.prototype.slice;

  mixInEventEmitter = function(x) {
    x.EventEmitter_listeners = {};
    x.emit = function() {
      var args, arr, f, k, _i, _len, _results;
      k = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      arr = this.EventEmitter_listeners[k] = this.EventEmitter_listeners[k] || [];
      _results = [];
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        f = arr[_i];
        _results.push(f.apply(null, args));
      }
      return _results;
    };
    x.on = function(k, f) {
      var arr;
      arr = this.EventEmitter_listeners[k] = this.EventEmitter_listeners[k] || [];
      return arr.push(f);
    };
    return x.listeners = function(k) {
      if (!this.EventEmitter_listeners[k]) this.EventEmitter_listeners[k] = [];
      return this.EventEmitter_listeners[k];
    };
  };

  module.exports = {
    mixInEventEmitter: mixInEventEmitter
  };

}).call(this);
