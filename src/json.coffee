


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


module.exports =
  json_encode: json_encode
  json_decode_via_eval: json_decode_via_eval

