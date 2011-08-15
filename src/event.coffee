
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
KEYCODE_A = 65
KEYCODE_B = 66
KEYCODE_C = 67
KEYCODE_D = 68
KEYCODE_E = 69
KEYCODE_F = 70
KEYCODE_G = 71
KEYCODE_H = 72
KEYCODE_I = 73
KEYCODE_J = 74
KEYCODE_K = 75
KEYCODE_L = 76
KEYCODE_M = 77
KEYCODE_N = 78
KEYCODE_O = 79
KEYCODE_P = 80
KEYCODE_Q = 81
KEYCODE_R = 82
KEYCODE_S = 83
KEYCODE_T = 84
KEYCODE_U = 85
KEYCODE_V = 86
KEYCODE_W = 87
KEYCODE_X = 88
KEYCODE_Y = 89
KEYCODE_Z = 90


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
  KEYCODE_A: KEYCODE_A
  KEYCODE_B: KEYCODE_B
  KEYCODE_C: KEYCODE_C
  KEYCODE_D: KEYCODE_D
  KEYCODE_E: KEYCODE_E
  KEYCODE_F: KEYCODE_F
  KEYCODE_G: KEYCODE_G
  KEYCODE_H: KEYCODE_H
  KEYCODE_I: KEYCODE_I
  KEYCODE_J: KEYCODE_J
  KEYCODE_K: KEYCODE_K
  KEYCODE_L: KEYCODE_L
  KEYCODE_M: KEYCODE_M
  KEYCODE_N: KEYCODE_N
  KEYCODE_O: KEYCODE_O
  KEYCODE_P: KEYCODE_P
  KEYCODE_Q: KEYCODE_Q
  KEYCODE_R: KEYCODE_R
  KEYCODE_S: KEYCODE_S
  KEYCODE_T: KEYCODE_T
  KEYCODE_U: KEYCODE_U
  KEYCODE_V: KEYCODE_V
  KEYCODE_W: KEYCODE_W
  KEYCODE_X: KEYCODE_X
  KEYCODE_Y: KEYCODE_Y
  KEYCODE_Z: KEYCODE_Z

