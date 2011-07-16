

mixInEventEmitter = (x) ->
  
  x.EventEmitter_listeners = {}
  
  x.emit = (k, args...) ->
    arr = @EventEmitter_listeners[k] = (@EventEmitter_listeners[k] or [])
    for f in arr
      f args...
  
  x.on = (k, f) ->
    arr = @EventEmitter_listeners[k] = (@EventEmitter_listeners[k] or [])
    arr.push f



module.exports =
  mixInEventEmitter: mixInEventEmitter
