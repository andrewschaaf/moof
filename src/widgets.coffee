
{Element, E, D} = require './element'


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



module.exports =
  Button: Button
  BUTTON_STYLUS: BUTTON_STYLUS
