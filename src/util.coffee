

timeoutSet = (ms, f) -> setTimeout f, ms
intervalSet = (ms, f) -> setInterval f, ms

min = (x, y) -> (if x < y then x else y)
max = (x, y) -> (if x > y then x else y)

module.exports =
  timeoutSet: timeoutSet
  intervalSet: intervalSet
  min: min
  max: max

