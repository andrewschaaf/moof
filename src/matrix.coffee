

# [[1, 2, 3],
#  [4, 5, 6]]


class Matrix
  constructor: (@w, @h, v = 0) ->
    vIsAFunction = ((typeof v) == 'function')
    m = []
    for y in [0...h]
      row = []
      for x in [0...w]
        if vIsAFunction
          row.push v(x, y)
        else
          row.push v
      m.push row
    @m = m
  
  rotated: (rotation90s) ->
    rotation90s %= 4
    n = @w
    n_minus_one = n - 1
    m = new Matrix n, n
    for y in [0...n]
      for x in [0...n]
        if rotation90s == 0
          m[y][x] = @m[              y][x]
        else if rotation90s == 1
          m[y][x] = @m[n_minus_one - x][y]
        else if rotation90s == 2
          m[y][x] = @m[n_minus_one - y][n_minus_one - x]
        else if rotation90s == 3
          m[y][x] = @m[              x][n_minus_one - y]
    m
  
  centerOfGravity: () ->
    totalWeight = 0
    xsum = 0
    ysum = 0
    for y in [0...@h]
      for x in [0...@w]
        weight = @m[y][x]
        totalWeight += weight
        xsum += weight * (x + 0.5)
        ysum += weight * (y + 0.5)
    new Point(xsum / totalWeight, ysum / totalWeight)

