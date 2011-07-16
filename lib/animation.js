(function() {
  var Morph, Tween, interpolatePoints, interpolateRects, linear, _ref;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  _ref = require('geom'), interpolateRects = _ref.interpolateRects, interpolatePoints = _ref.interpolatePoints;
  Tween = (function() {
    function Tween(duration, transition, f) {
      this.duration = duration;
      this.transition = transition;
      this.f = f;
      this.start = new Date().getTime();
      this.f(0);
      setTimeout((__bind(function() {
        return this.step();
      }, this)), 0);
    }
    Tween.prototype.step = function() {
      var t;
      t = (new Date().getTime() - this.start) / this.duration;
      if (t > 1) {
        t = 1;
      }
      this.f(this.transition(t));
      if (t < 1) {
        return setTimeout((__bind(function() {
          return this.step();
        }, this)), 0);
      }
    };
    return Tween;
  })();
  Morph = (function() {
    function Morph(element, info) {
      var duration, oncomplete, opacity, pos, rect, transition;
      duration = info.duration, transition = info.transition, oncomplete = info.oncomplete, opacity = info.opacity, rect = info.rect, pos = info.pos;
      new Tween(duration, transition, function(t) {
        if (opacity) {
          element.setOpacity(opacity[0] + (opacity[1] - opacity[0]) * t);
        }
        if (rect) {
          element.setRect(interpolateRects(rect[0], rect[1], t));
        }
        if (pos) {
          element.setPos(interpolatePoints(pos[0], pos[1], t));
        }
        if (t === 1 && oncomplete) {
          return oncomplete();
        }
      });
    }
    return Morph;
  })();
  linear = function(t) {
    return t;
  };
  module.exports = {
    Tween: Tween,
    Morph: Morph,
    linear: linear
  };
}).call(this);
