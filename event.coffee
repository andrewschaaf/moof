
KEYCODE_DELETE = 8
KEYCODE_TAB = 9
KEYCODE_RETURN = 13
KEYCODE_ESCAPE = 27
KEYCODE_SPACE = 32

KEYCODE_LEFT = 37
KEYCODE_UP = 38
KEYCODE_RIGHT = 39
KEYCODE_DOWN = 40


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

