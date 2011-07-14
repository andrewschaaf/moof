(function() {
  var intervalSet, timeoutSet;
  timeoutSet = function(ms, f) {
    return setTimeout(f, ms);
  };
  intervalSet = function(ms, f) {
    return setInterval(f, ms);
  };
}).call(this);
