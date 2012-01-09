(function() {
  var interpolateColors, moof_color_hex2, rgbFromWeb, webFromRgb;

  moof_color_hex2 = function(n) {
    if (n < 16) {
      return "0" + n.toString(16);
    } else {
      return n.toString(16);
    }
  };

  rgbFromWeb = function(web) {
    return [parseInt(web.substr(1, 2), 16), parseInt(web.substr(3, 2), 16), parseInt(web.substr(5, 2), 16)];
  };

  webFromRgb = function(r, g, b) {
    return "#" + moof_color_hex2(r) + moof_color_hex2(g) + moof_color_hex2(b);
  };

  interpolateColors = function(c1, c2, t) {
    var b1, b2, g1, g2, r1, r2, _ref, _ref2;
    _ref = rgbFromWeb(c1), r1 = _ref[0], g1 = _ref[1], b1 = _ref[2];
    _ref2 = rgbFromWeb(c2), r2 = _ref2[0], g2 = _ref2[1], b2 = _ref2[2];
    return webFromRgb(Math.round(r1 + (r2 - r1) * t), Math.round(g1 + (g2 - g1) * t), Math.round(b1 + (b2 - b1) * t));
  };

  module.exports = {
    rgbFromWeb: rgbFromWeb,
    webFromRgb: webFromRgb,
    interpolateColors: interpolateColors
  };

}).call(this);
