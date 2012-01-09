(function() {
  var Point, Rect, distanceBetweenPoints, interpolatePoints, interpolateRects;

  Point = (function() {

    function Point(x, y) {
      this.x = x;
      this.y = y;
    }

    return Point;

  })();

  Rect = (function() {

    function Rect(x, y, w, h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }

    Rect.prototype.translated = function(r) {
      return new Rect(this.x + r.x, this.y + r.y, this.w, this.h);
    };

    Rect.prototype.scaled = function(scaledBy) {
      return new Rect(this.x, this.y, this.w * scaledBy, this.h * scaledBy);
    };

    Rect.prototype.center = function() {
      return new Point(this.x + (this.w / 2), this.y + (this.h / 2));
    };

    Rect.prototype.centeredAt = function(r) {
      return new Rect(r.x - (this.w / 2), r.y - (this.h / 2), this.w, this.h);
    };

    Rect.prototype.centeredIn = function(r) {
      return this.centeredAt(r.center());
    };

    return Rect;

  })();

  interpolateRects = function(r1, r2, t) {
    return new Rect(r1.x + (r2.x - r1.x) * t, r1.y + (r2.y - r1.y) * t, r1.w + (r2.w - r1.w) * t, r1.h + (r2.h - r1.h) * t);
  };

  interpolatePoints = function(r1, r2, t) {
    return new Point(r1.x + (r2.x - r1.x) * t, r1.y + (r2.y - r1.y) * t);
  };

  distanceBetweenPoints = function(p, p2) {
    var dx, dy;
    dx = p.x - p2.x;
    dy = p.y - p2.y;
    return Math.sqrt((dx * dx) + (dy * dy));
  };

  module.exports = {
    Point: Point,
    Rect: Rect,
    interpolateRects: interpolateRects,
    interpolatePoints: interpolatePoints,
    distanceBetweenPoints: distanceBetweenPoints
  };

}).call(this);
