(function() {
  var Button, Element, KEYCODE_A, Morph, Rect, addCss, b64encode, bodyOn, decimal_gt, json_encode, mixInEventEmitter, rgbFromWeb, timeoutSet;

  Morph = require('animation').Morph;

  b64encode = require('base64').b64encode;

  rgbFromWeb = require('color').rgbFromWeb;

  decimal_gt = require('decimal').decimal_gt;

  addCss = require('dom').addCss;

  Element = require('element').Element;

  KEYCODE_A = require('event').KEYCODE_A;

  mixInEventEmitter = require('eventemitter').mixInEventEmitter;

  Rect = require('geom').Rect;

  json_encode = require('json').json_encode;

  bodyOn = require('page').bodyOn;

  timeoutSet = require('util').timeoutSet;

  Button = require('widgets').Button;

}).call(this);
