(function() {
  var ALPHABET58, endswith, intervalSet, invertedDict, keysOf, lstrip, max, min, random, randomInteger, randomToken, re_escape, rjust, rstrip, startswith, strip, timeoutSet, valuesOf;
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
    if (chars == null) chars = "\t\n\v\f\r ";
    m = s.match(new RegExp("[" + (re_escape(chars)) + "]+$"));
    if (m) {
      return s.substr(0, s.length - m[0].length);
    } else {
      return s;
    }
  };

  lstrip = function(s, chars) {
    var m;
    if (chars == null) chars = "\t\n\v\f\r ";
    m = s.match(new RegExp("^[" + (re_escape(chars)) + "]+"));
    if (m) {
      return s.substr(m[0].length);
    } else {
      return s;
    }
  };

  strip = function(s, chars) {
    if (chars == null) chars = "\t\n\v\f\r ";
    return lstrip(rstrip(s, chars), chars);
  };

  rjust = function(s, width, fillchar) {
    var arr, i, n;
    if (fillchar == null) fillchar = ' ';
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

  ALPHABET58 = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

  random = function() {
    var x;
    x = Math.random();
    if (x === 1) {
      return 0;
    } else {
      return x;
    }
  };

  randomInteger = function(a, b) {
    return Math.floor(random() * (b - a + 1)) + a;
  };

  randomToken = function(n, alphabet) {
    var i, lte;
    if (n == null) n = 8;
    if (alphabet == null) alphabet = ALPHABET58;
    lte = alphabet.length - 1;
    return ((function() {
      var _results;
      _results = [];
      for (i = 0; 0 <= n ? i < n : i > n; 0 <= n ? i++ : i--) {
        _results.push(alphabet.charAt(randomInteger(0, lte)));
      }
      return _results;
    })()).join('');
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
    strip: strip,
    rjust: rjust,
    re_escape: re_escape,
    ALPHABET58: ALPHABET58,
    random: random,
    randomInteger: randomInteger,
    randomToken: randomToken
  };

}).call(this);
