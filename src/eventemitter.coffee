

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
  



module.exports =
  mixInEventEmitter: mixInEventEmitter
