

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



module.exports =
  
  timeoutSet: timeoutSet
  intervalSet: intervalSet
  
  min: min
  max: max
  
  keysOf: keysOf
  valuesOf: valuesOf
  invertedDict: invertedDict
  
  startswith: startswith
  endswith: endswith
  rstrip: rstrip
  lstrip: lstrip
  strip: strip
  rjust: rjust
  re_escape: re_escape
  
  ALPHABET58: ALPHABET58
  random: random
  randomInteger: randomInteger
  randomToken: randomToken
