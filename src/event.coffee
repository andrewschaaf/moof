
KEYCODE_DELETE = 8
KEYCODE_TAB = 9
KEYCODE_RETURN = 13
KEYCODE_ESCAPE = 27
KEYCODE_SPACE = 32

KEYCODE_LEFT = 37
KEYCODE_UP = 38
KEYCODE_RIGHT = 39
KEYCODE_DOWN = 40

KEYCODE_0 = 48
KEYCODE_1 = 49
KEYCODE_2 = 50
KEYCODE_3 = 51
KEYCODE_4 = 52
KEYCODE_5 = 53
KEYCODE_6 = 54
KEYCODE_7 = 55
KEYCODE_8 = 56
KEYCODE_9 = 57


class Event
  
  constructor: (@e) ->
  
  getKeycode: () ->
    @e.charCode or @e.keyCode
  
  isRightButton: () ->
    if @e.which
      (@e.which == 3)
    else if e.button
      (@e.button == 2)
  
  getPos: () ->
    if @e.pageX or @e.pageY
      new Point @e.pageX, @e.pageY
    else if @e.clientX or @e.clientY
      new Point(
        @e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft,
        @e.clientY + document.body.scrollTop + document.documentElement.scrollTop)
  
  controlDown: () -> @e.ctrlKey
  altDown:     () -> @e.altKey
  shiftDown:   () -> @e.shiftKey
  metaDown:    () -> @e.metaKey
  
  stop: () ->
    
    if @e.stopPropagation
      @e.stopPropagation()
    else
      @e.cancelBubble = true
    
    if @e.preventDefault
      @e.preventDefault()
    else
      @e.returnValue = false


module.exports =
  Event: Event
  KEYCODE_DELETE: KEYCODE_DELETE
  KEYCODE_TAB: KEYCODE_TAB
  KEYCODE_RETURN: KEYCODE_RETURN
  KEYCODE_ESCAPE: KEYCODE_ESCAPE
  KEYCODE_SPACE: KEYCODE_SPACE
  KEYCODE_LEFT: KEYCODE_LEFT
  KEYCODE_UP: KEYCODE_UP
  KEYCODE_RIGHT: KEYCODE_RIGHT
  KEYCODE_DOWN: KEYCODE_DOWN
  KEYCODE_0: KEYCODE_0
  KEYCODE_1: KEYCODE_1
  KEYCODE_2: KEYCODE_2
  KEYCODE_3: KEYCODE_3
  KEYCODE_4: KEYCODE_4
  KEYCODE_5: KEYCODE_5
  KEYCODE_6: KEYCODE_6
  KEYCODE_7: KEYCODE_7
  KEYCODE_8: KEYCODE_8
  KEYCODE_9: KEYCODE_9

