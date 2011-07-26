

moof_color_hex2 = (n) ->
  if n < 16
    "0" + n.toString 16
  else
    n.toString 16


rgbFromWeb = (web) ->
  [
    parseInt(web.substr(1, 2), 16)
    parseInt(web.substr(3, 2), 16)
    parseInt(web.substr(5, 2), 16)
  ]


webFromRgb = (r, g, b) ->
  ("#" +
    moof_color_hex2(r) +
    moof_color_hex2(g) +
    moof_color_hex2(b))


interpolateColors = (c1, c2, t) ->
  [r1, g1, b1] = rgbFromWeb c1
  [r2, g2, b2] = rgbFromWeb c2
  webFromRgb(
    Math.round(r1 + (r2 - r1) * t),
    Math.round(g1 + (g2 - g1) * t),
    Math.round(b1 + (b2 - b1) * t))


module.exports =
  rgbFromWeb: rgbFromWeb
  webFromRgb: webFromRgb
  interpolateColors: interpolateColors
