(function() {
  var k, moduleNames, name, v, _i, _len, _ref;
  var __hasProp = Object.prototype.hasOwnProperty;

  moduleNames = ['animation', 'base64', 'color', 'decimal', 'dom', 'element', 'event', 'eventemitter', 'geom', 'json', 'matrix', 'page', 'util', 'widgets'];

  for (_i = 0, _len = moduleNames.length; _i < _len; _i++) {
    name = moduleNames[_i];
    _ref = require("./" + name);
    for (k in _ref) {
      if (!__hasProp.call(_ref, k)) continue;
      v = _ref[k];
      module.exports[k] = v;
    }
  }

}).call(this);
