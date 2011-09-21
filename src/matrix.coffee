

# [[1, 2, 3],
#  [4, 5, 6]]


matrix_create = (w, h, v = 0) ->
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
  m


matrix_rotated = (m, rotation90s) ->
  rotation90s %= 4
  n = m.length
  n_minus_one = n - 1
  m2 = matrix_create n, n
  for y in [0...n]
    for x in [0...n]
      if rotation90s == 0
        m2[y][x] = m[              y][x]
      else if rotation90s == 1
        m2[y][x] = m[n_minus_one - x][y]
      else if rotation90s == 2
        m2[y][x] = m[n_minus_one - y][n_minus_one - x]
      else if rotation90s == 3
        m2[y][x] = m[              x][n_minus_one - y]
  m2


matrix_centerOfGravity = (m) ->
  h = m.length
  w = m[0].length
  totalWeight = 0
  xsum = 0
  ysum = 0
  for y in [0...h]
    for x in [0...w]
      weight = m[y][x]
      totalWeight += weight
      xsum += weight * (x + 0.5)
      ysum += weight * (y + 0.5)
  [
      xsum / totalWeight,
      ysum / totalWeight]


module.exports =
  matrix_create: matrix_create
  matrix_rotated: matrix_rotated
  matrix_centerOfGravity: matrix_centerOfGravity
