(function() {
  var endswith, intervalSet, invertedDict, keysOf, lstrip, max, min, re_escape, rjust, rstrip, startswith, timeoutSet, valuesOf;
  var __hasProp = Object.prototype.hasOwnProperty;
  timeoutSet = function(ms, f) {
    return setTimeout(f, ms);
  };
  intervalSet = function(ms, f) {
    return setInterval(f, ms);
  };
  min = function(x, y) {
    if (x < y) {
      return x;
    } else {
      return y;
    }
  };
  max = function(x, y) {
    if (x > y) {
      return x;
    } else {
      return y;
    }
  };
  keysOf = function(d) {
    var k, _results;
    _results = [];
    for (k in d) {
      if (!__hasProp.call(d, k)) continue;
      _results.push(k);
    }
    return _results;
  };
  valuesOf = function(d) {
    var k, v, _results;
    _results = [];
    for (k in d) {
      if (!__hasProp.call(d, k)) continue;
      v = d[k];
      _results.push(v);
    }
    return _results;
  };
  invertedDict = function(d) {
    var d2, k, v;
    d2 = {};
    for (k in d) {
      if (!__hasProp.call(d, k)) continue;
      v = d[k];
      d2[v] = k;
    }
    return d2;
  };
  startswith = function(s, s2) {
    return (s.length >= s2.length) && (s.substr(0, s2.length) === s2);
  };
  endswith = function(s, s2) {
    return (s.length >= s2.length) && (s.substr(s.length - s2.length) === s2);
  };
  rstrip = function(s, chars) {
    var m;
    if (chars == null) {
      chars = "\t\n\v\f\r ";
    }
    m = s.match(new RegExp("[" + (re_escape(chars)) + "]+$"));
    if (m) {
      return s.substr(0, s.length - m[0].length);
    } else {
      return s;
    }
  };
  lstrip = function(s, chars) {
    var m;
    if (chars == null) {
      chars = "\t\n\v\f\r ";
    }
    m = s.match(new RegExp("^[" + (re_escape(chars)) + "]+"));
    if (m) {
      return s.substr(m[0].length);
    } else {
      return s;
    }
  };
  rjust = function(s, width, fillchar) {
    var arr, i, n;
    if (fillchar == null) {
      fillchar = ' ';
    }
    n = width - s.length;
    if (n <= 0) {
      return s;
    } else {
      arr = [];
      for (i = 0; 0 <= n ? i < n : i > n; 0 <= n ? i++ : i--) {
        arr.push(fillchar);
      }
      arr.push(s);
      return arr.join('');
    }
  };
  re_escape = function(s) {
    return s.replace(/[-\[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
  };
  module.exports = {
    timeoutSet: timeoutSet,
    intervalSet: intervalSet,
    min: min,
    max: max,
    keysOf: keysOf,
    valuesOf: valuesOf,
    invertedDict: invertedDict,
    startswith: startswith,
    endswith: endswith,
    rstrip: rstrip,
    lstrip: lstrip,
    rjust: rjust,
    re_escape: re_escape
  };
}).call(this);
