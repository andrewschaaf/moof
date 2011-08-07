

class Point
  constructor: (@x, @y) ->


class Rect
  
  constructor: (@x, @y, @w, @h) ->
    
  
  translated: (r) ->
    new Rect(
      @x + r.x,
      @y + r.y,
      @w,
      @h)
  
  scaled: (scaledBy) ->
    new Rect(
      @x,
      @y,
      @w * scaledBy,
      @h * scaledBy)
  
  center: () ->
    new Point(
      @x + (@w / 2),
      @y + (@h / 2))
  
  centeredAt: (r) ->
    new Rect(
      r.x - (@w / 2),
      r.y - (@h / 2),
      @w,
      @h)
  
  centeredIn: (r) ->
    @centeredAt r.center()
  


interpolateRects = (r1, r2, t) ->
  new Rect(
    (r1.x + (r2.x - r1.x) * t),
    (r1.y + (r2.y - r1.y) * t),
    (r1.w + (r2.w - r1.w) * t),
    (r1.h + (r2.h - r1.h) * t))


interpolatePoints = (r1, r2, t) ->
  new Point(
    (r1.x + (r2.x - r1.x) * t),
    (r1.y + (r2.y - r1.y) * t))


distanceBetweenPoints = (p, p2) ->
  dx = p.x - p2.x
  dy = p.y - p2.y
  Math.sqrt((dx * dx) + (dy * dy))


module.exports =
  Point: Point
  Rect: Rect
  interpolateRects: interpolateRects
  interpolatePoints: interpolatePoints
  distanceBetweenPoints: distanceBetweenPoints

