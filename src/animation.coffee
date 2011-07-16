
{interpolateRects, interpolatePoints} = require 'geom'


class Tween
  
  # * f(0) gets executed in the constructor
  # * f(1) gets executed at the end
  constructor: (@duration, @transition, @f) ->
    @start = new Date().getTime()
    @f 0
    setTimeout (=>@step()), 0
  
  step: () ->
    t = (new Date().getTime() - @start) / @duration
    if t > 1
      t = 1
    @f @transition(t)
    if t < 1
      setTimeout (=>@step()), 0


class Morph
  
  constructor: (element, info) ->
    {
      duration, transition, oncomplete
      opacity, rect, pos
    } = info
    new Tween duration, transition, (t) ->
      
      if opacity
        element.setOpacity(opacity[0] + (opacity[1] - opacity[0]) * t)
      
      if rect
        element.setRect interpolateRects rect[0], rect[1], t
      
      if pos
        element.setPos interpolatePoints pos[0], pos[1], t
      
      if t == 1 and oncomplete
          oncomplete()


linear    = (t) -> t
#easeIn    = (t) -> 
#easeOut   = (t) -> 
#easeInOut = (t) -> 


module.exports =
  Tween: Tween
  Morph: Morph
  linear: linear

