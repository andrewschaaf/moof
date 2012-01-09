(function() {
  var Morph, Tween, interpolateColors, interpolatePoints, interpolateRects, linear, _ref;

  _ref = require('./geom'), interpolateRects = _ref.interpolateRects, interpolatePoints = _ref.interpolatePoints;

  interpolateColors = require('./color').interpolateColors;

  Tween = (function() {

    function Tween(duration, transition, f) {
      var _this = this;
      this.duration = duration;
      this.transition = transition;
      this.f = f;
      this.start = new Date().getTime();
      this.f(0);
      setTimeout((function() {
        return _this.step();
      }), 0);
    }

    Tween.prototype.step = function() {
      var t;
      var _this = this;
      t = (new Date().getTime() - this.start) / this.duration;
      if (t > 1) t = 1;
      this.f(this.transition(t));
      if (t < 1) {
        return setTimeout((function() {
          return _this.step();
        }), 0);
      }
    };

    return Tween;

  })();

  Morph = (function() {

    function Morph(elements, info) {
      var background, duration, numFrames, oncomplete, opacity, pos, rect, transition;
      duration = info.duration, transition = info.transition, oncomplete = info.oncomplete, opacity = info.opacity, rect = info.rect, pos = info.pos, background = info.background;
      if (!(elements instanceof Array)) elements = [elements];
      numFrames = 0;
      new Tween(duration, transition, function(t) {
        var element, _i, _len;
        numFrames++;
        for (_i = 0, _len = elements.length; _i < _len; _i++) {
          element = elements[_i];
          if (opacity) {
            element.setOpacity(opacity[0] + (opacity[1] - opacity[0]) * t);
          }
          if (rect) element.setRect(interpolateRects(rect[0], rect[1], t));
          if (pos) element.setPos(interpolatePoints(pos[0], pos[1], t));
          if (background) {
            element._.style.background = interpolateColors(background[0], background[1], t);
          }
        }
        if (t === 1 && oncomplete) {
          return oncomplete({
            numFrames: numFrames,
            info: info
          });
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
