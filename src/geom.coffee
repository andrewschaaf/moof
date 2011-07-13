

class Point
  constructor: (@x, @y) ->


class Rect
  constructor: (@x, @y, @w, @h) ->


module.exports =
  Point: Point
  Rect: Rect
