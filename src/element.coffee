
{Event} = require './event'


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


module.exports =
  Element: Element
  E: E
  D: D

