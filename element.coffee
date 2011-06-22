

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
          node[k] = arg[k]
  
  prependChild: (x) ->
    if @_.childNodes.length == 0
      @_.appendChild x._
    else
    @_.insertBefore x._, @_.firstChild
  
  appendToBody: () ->
    document.body.appendChild @_
    @
  
  appendTo: (x) ->
    x._.appendChild @_
    @
  
  remove: () ->
    @_.parentNode.removeChild(@_)
  
  setStyles: (d) ->
    for own k, v of d
      @._.style[k] = v
  
  setRect: (r) ->
    @setStyles {
      left:   Math.round r.x
      top:    Math.round r.y
      width:  Math.round r.w
      height: Math.round r.h
    }



module.exports =
  Element: Element

