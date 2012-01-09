(function() {
  var json_decode_via_eval, json_encode;
  var __hasProp = Object.prototype.hasOwnProperty;

  json_encode = function(x) {
    var arr, k, t, v, y, _i, _len;
    t = typeof x;
    if (x === null || t === 'undefined') {
      return 'null';
    } else if (t === 'boolean' || t === 'number') {
      return x.valueOf();
    } else if (t === 'string') {
      return '"' + (x.replace(/\\/g, "\\\\").replace(/"/g, '\\"').replace(/\n/, '\\n')) + '"';
    } else if (x instanceof Array) {
      arr = [];
      for (_i = 0, _len = x.length; _i < _len; _i++) {
        y = x[_i];
        arr.push(json_encode(y));
      }
      return "[" + arr.join(',') + "]";
    } else {
      arr = [];
      for (k in x) {
        if (!__hasProp.call(x, k)) continue;
        v = x[k];
        arr.push(json_encode(k) + ":" + json_encode(v));
      }
      return "{" + arr.join(',') + "}";
    }
  };

  json_decode_via_eval = function(s) {
    return eval("(" + s + ")");
  };

  module.exports = {
    json_encode: json_encode,
    json_decode_via_eval: json_decode_via_eval
  };

}).call(this);
