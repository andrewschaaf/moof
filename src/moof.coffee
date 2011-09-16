

moduleNames = [
  'animation'
  'base64'
  'color'
  'decimal'
  'dom'
  'element'
  'event'
  'eventemitter'
  'geom'
  'json'
  'matrix'
  'page'
  'util'
  'widgets'
]

for name in moduleNames
  for own k, v of require "./#{name}"
    module.exports[k] = v
