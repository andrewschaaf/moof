### /node_modules/moof/src/geom.coffee ####



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




### /node_modules/moof/src/event.coffee ####


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

KEYCODE_KEYPAD_0 = 96
KEYCODE_KEYPAD_1 = 97
KEYCODE_KEYPAD_2 = 98
KEYCODE_KEYPAD_3 = 99
KEYCODE_KEYPAD_4 = 100
KEYCODE_KEYPAD_5 = 101
KEYCODE_KEYPAD_6 = 102
KEYCODE_KEYPAD_7 = 103
KEYCODE_KEYPAD_8 = 104
KEYCODE_KEYPAD_9 = 105

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




### /node_modules/moof/src/page.coffee ####


bodyOn = (k, f) ->
  document.body['on' + k] = (e) ->
    f new Event e




### /node_modules/moof/src/element.coffee ####


class Element

  constructor: (nodeType, args...) ->
    @_ = node = document.createElement nodeType
    for arg in args
      if (typeof arg) == 'string'
        node.className = arg
      
      else if arg instanceof Array
        for kid in arg
          if (typeof kid) == 'string'
            node.appendChild document.createTextNode kid
          else
            node.appendChild kid._
      
      else
        for own k of arg
          node[k] = "" + arg[k]
  
  appendChildren: (arr) ->
    for x in arr
      @appendChild x
  
  appendChild: (x) ->
    @_.appendChild x._
  
  removeChildren: () ->
    x = @_.lastChild
    while x
      @_.removeChild x
      x = @_.lastChild
  
  setChildren: (arr) ->
    @removeChildren()
    for x in arr
      @appendChild x
  
  setChild: (x) ->
    @setChildren [x]
  
  prependChild: (x) ->
    if @_.childNodes.length == 0
      @_.appendChild x._
    else
    @_.insertBefore x._, @_.firstChild
  
  insertBefore: (kid, existingKid) ->
    @_.insertBefore kid._, existingKid._
  
  appendToBody: () ->
    document.body.appendChild @_
  
  appendToHead: () ->
    document.getElementsByTagName("head")[0].appendChild @_
  
  appendTo: (x) ->
    x._.appendChild @_
  
  prependTo: (x) ->
    x.prependChild @
  
  remove: () ->
    @_.parentNode?.removeChild @_
  
  setTextChild: (text) ->
    @removeChildren()
    @_.appendChild document.createTextNode text
  
  setOpacity: (fraction) ->
    percent = Math.round(100 * fraction)
    @setStyles {
      opacity: fraction
      filter: "alpha(opacity=#{percent})"
      '-ms-filter': "progid:DXImageTransform.Microsoft.Alpha(opacity=#{percent})"
    }
  
  setStyles: (d) ->
    for own k, v of d
      @._.style[k] = v
  
  setPos: (r) ->
    @setStyles {
      left:   Math.round r.x
      top:    Math.round r.y
    }
  
  setRect: (r) ->
    @setStyles {
      left:   Math.round(r.x) + 'px'
      top:    Math.round(r.y) + 'px'
      width:  Math.round(r.w) + 'px'
      height: Math.round(r.h) + 'px'
    }
  
  on: (k, f) ->
    @_['on' + k] = (event) ->
      f new Event event
  
  setClasses: (classes) ->
    @_.className = classes.join ' '
  
  getClasses: () ->
    if @_.className
      @_.className.split ' '
    else
      []

  addClass: (className) ->
    arr = @getClasses()
    if arr.indexOf(className) == -1
      arr.push className
      @setClasses arr

  removeClass: (className) ->
    arr = @getClasses()
    i = arr.indexOf className
    if i != -1
      arr.splice i, 1
      @setClasses arr
  
  getValue: () ->
    @_.value
  
  setValue: (x) ->
    @_.value = x
  
  scrollToBottom: () ->
    @_.scrollTop = @_.scrollHeight - @_.clientHeight
  

E = (args...) -> new Element args...
D = (args...) -> new Element 'div', args...




### /node_modules/moof/src/widgets.coffee ####


BUTTON_STYLUS = """

.Button
  display block
  cursor pointer
  text-align center
  color white
  position relative

.Button *
  cursor pointer

.Button table
  border-spacing 0
  width 100%
  height 100%

.Button .Boverlay
  z-index 50
  abs(0, 0)
  dim(100%, 100%)
  text-align center

.Button .BL
  padding 0

.Button .BR
  padding 0

"""

class Button extends Element
  constructor: (x, args...) ->
    
    if typeof x == 'string'
      type = 'whole'
      classes = "Button #{x}"
    else if x.lmr
      type = 'lmr'
      classes = "Button #{x.lmr}"
    
    super 'a', classes, [
      @overlay = E 'div', 'Boverlay'
    ]
    
    if type == 'lmr'
      @appendChildren [
        # position: absolute
        E 'table', [
          E 'tr', [
            E 'td', "BLR BL"
            E 'td', "BM"
            E 'td', "BLR BR"
          ]
        ]
      ]
    
    @on 'click', ((e) => @click(e))
    
    text = null
    opt = {}
    for x in args
      t = typeof x
      if t == 'string'
        text = x
      else if t == 'function'
        @onclick = x
      else
        _.extend opt, x
    
    if opt.id
      @._.id = opt.id
    
    if text
      @overlay.appendChild @label = D 'Blabel', [text]
  
  setText: (text) ->
    @label.setTextChild text
  
  click: (e) ->
    if e
      e.stop()
    if @onclick
      @onclick e
  
  showLoader: (className) ->
    #TODO
  
  hideLoader: () ->
    #TODO
  
  #TODO: makeActive: () ->





### /node_modules/moof/src/color.coffee ####



moof_color_hex2 = (n) ->
  if n < 16
    "0" + n.toString 16
  else
    n.toString 16


rgbFromWeb = (web) ->
  [
    parseInt(web.substr(1, 2), 16)
    parseInt(web.substr(3, 2), 16)
    parseInt(web.substr(5, 2), 16)
  ]


webFromRgb = (r, g, b) ->
  ("#" +
    moof_color_hex2(r) +
    moof_color_hex2(g) +
    moof_color_hex2(b))


interpolateColors = (c1, c2, t) ->
  [r1, g1, b1] = rgbFromWeb c1
  [r2, g2, b2] = rgbFromWeb c2
  webFromRgb(
    Math.round(r1 + (r2 - r1) * t),
    Math.round(g1 + (g2 - g1) * t),
    Math.round(b1 + (b2 - b1) * t))




### /node_modules/moof/src/animation.coffee ####


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
  
  constructor: (elements, info) ->
    {
      duration, transition, oncomplete
      opacity, rect, pos, background
    } = info
    
    if not (elements instanceof Array)
      elements = [elements]
    
    numFrames = 0
    
    new Tween duration, transition, (t) ->
      numFrames++
      for element in elements
        
        if opacity
          element.setOpacity(opacity[0] + (opacity[1] - opacity[0]) * t)
        
        if rect
          element.setRect interpolateRects rect[0], rect[1], t
        
        if pos
          element.setPos interpolatePoints pos[0], pos[1], t
        
        if background
          element._.style.background = interpolateColors(background[0], background[1], t)
      
      if t == 1 and oncomplete
        oncomplete {
          numFrames: numFrames
          info: info
        }


linear    = (t) -> t
#easeIn    = (t) -> 
#easeOut   = (t) -> 
#easeInOut = (t) -> 




### /node_modules/moof/src/base64.coffee ####



BASE64_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';


b64encode = (octets) ->
  strings = []
  numOctets = octets.length
  i = 0
  while i < numOctets
    combined = (
        ((octets[i] or 0) << 16) | 
        ((octets[i + 1] or 0) << 8) | 
        ((octets[i + 2] or 0)))
    i += 3
    strings.push(
        BASE64_ALPHABET.charAt((combined >> 18) & 0x3F) +
        BASE64_ALPHABET.charAt((combined >> 12) & 0x3F) +
        BASE64_ALPHABET.charAt((combined >> 6) & 0x3F) +
        BASE64_ALPHABET.charAt(combined & 0x3F))
  # 0 ''            
  # 1 'AA=='        
  # 2 'AAA='        
  # 3 'AAAA'        
  # 4 'AAAAAA=='    
  # 5 'AAAAAAA='    
  # 6 'AAAAAAAA'    
  paddingLength = [0, 2, 1][numOctets % 3]
  s = strings.join ''
  (
    s.substr(0, s.length - paddingLength) + 
    (['', '=', '=='][paddingLength]))


# Assumes padding
b64decode = (s) ->
  octets = []
  numChars = (s.length - ((s.match(/[=]+/) or [''])[0].length))
  i = 0
  while i < numChars
    combined = (
                  ((BASE64_ALPHABET.indexOf(s[i]) % 64) << 18) |
                  ((BASE64_ALPHABET.indexOf(s[i + 1]) % 64) << 12) |
                  ((BASE64_ALPHABET.indexOf(s[i + 2]) % 64) << 6) |
                  (BASE64_ALPHABET.indexOf(s[i + 3]) % 64))
    i += 4
    octets.push ((combined >> 16) & 0xFF)
    if (i - 1) <= numChars
      octets.push ((combined >> 8) & 0xFF)
      if (i - 1) < numChars
        octets.push ((combined) & 0xFF)
  octets




### /node_modules/moof/src/decimal.coffee ####



decimal_gt = (x, y) ->
  (1 * x) > (1 * y)





### /node_modules/moof/src/dom.coffee ####



addCss = (css) ->
  node = document.createElement 'style'
  node.type = 'text/css'
  node.appendChild document.createTextNode css
  document.head.appendChild node




### /node_modules/moof/src/eventemitter.coffee ####



mixInEventEmitter = (x) ->
  
  x.EventEmitter_listeners = {}
  
  x.emit = (k, args...) ->
    arr = @EventEmitter_listeners[k] = (@EventEmitter_listeners[k] or [])
    for f in arr
      f args...
  
  x.on = (k, f) ->
    arr = @EventEmitter_listeners[k] = (@EventEmitter_listeners[k] or [])
    arr.push f
  
  x.listeners = (k) ->
    if not @EventEmitter_listeners[k]
      @EventEmitter_listeners[k] = []
    @EventEmitter_listeners[k]
  





### /node_modules/moof/src/json.coffee ####




json_encode = (x) ->
  t = (typeof x)
  
  if x == null or t == 'undefined'
    'null'
  else if t == 'boolean' or t == 'number'
    x.valueOf()
  else if t == 'string'
    #XB confirm replace is non-destructive
    #TODO escape everything needed
    ('"' + 
        (x.replace(/\\/g, "\\\\").replace(/"/g, '\\"').replace(/\n/, '\\n')) + 
        '"')
  else if x instanceof Array
    arr = []
    for y in x
      arr.push json_encode y
    "[" + arr.join(',') + "]"
  else
    arr = []
    for own k, v of x
      arr.push json_encode(k) + ":" + json_encode(v)
    "{" + arr.join(',') + "}"


json_decode_via_eval = (s) ->
  eval "(#{s})"




### /node_modules/moof/src/util.coffee ####



timeoutSet = (ms, f) -> setTimeout f, ms
intervalSet = (ms, f) -> setInterval f, ms

min = (x, y) -> (if x < y then x else y)
max = (x, y) -> (if x > y then x else y)

keysOf = (d) ->
  for own k of d
    k

valuesOf = (d) ->
  for own k, v of d
    v

invertedDict = (d) ->
  d2 = {}
  for own k, v of d
    d2[v] = k
  d2


startswith = (s, s2) -> (s.length >= s2.length) and (s.substr(0, s2.length) == s2)
endswith   = (s, s2) -> (s.length >= s2.length) and (s.substr(s.length - s2.length) == s2)

rstrip = (s, chars = "\t\n\v\f\r ") ->
  m = s.match new RegExp "[#{re_escape chars}]+$"
  if m then s.substr(0, s.length - m[0].length) else s

lstrip = (s, chars = "\t\n\v\f\r ") ->
  m = s.match new RegExp "^[#{re_escape chars}]+"
  if m then s.substr(m[0].length) else s

strip = (s, chars = "\t\n\v\f\r ") ->
  lstrip(rstrip(s, chars), chars)

rjust = (s, width, fillchar = ' ') ->
  n = width - s.length
  if n <= 0
    s
  else
    arr = []
    for i in [0...n]
      arr.push fillchar
    arr.push s
    arr.join ''

re_escape = (s) ->
  s.replace /[-\[\]{}()*+?.,\\^$|#\s]/g, "\\$&"


ALPHABET58 = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'


# Ensure we don't return 1. (Easier than trusting/verifying each JS impl)
random = () ->
  x = Math.random()
  if x == 1 then 0 else x

# <code>[a, b]</code>
randomInteger = (a, b) ->
  Math.floor(random() * (b - a + 1)) + a

randomToken = (n = 8, alphabet = ALPHABET58) ->
  lte = alphabet.length - 1
  (for i in [0...n]
    alphabet.charAt randomInteger(0, lte)
  ).join('')





### /node_modules/moof/src/moof_bodystitch_main.coffee ####



