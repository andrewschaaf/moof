(function() {
  var Point, Rect;
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
    return Rect;
  })();
  module.exports = {
    Point: Point,
    Rect: Rect
  };
}).call(this);
