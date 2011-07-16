(function() {
  var intervalSet, max, min, timeoutSet;
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
  module.exports = {
    timeoutSet: timeoutSet,
    intervalSet: intervalSet,
    min: min,
    max: max
  };
}).call(this);
