(function() {
  var matrix_centerOfGravity, matrix_create, matrix_rotated;

  matrix_create = function(w, h, v) {
    var m, row, vIsAFunction, x, y;
    if (v == null) v = 0;
    vIsAFunction = (typeof v) === 'function';
    m = [];
    for (y = 0; 0 <= h ? y < h : y > h; 0 <= h ? y++ : y--) {
      row = [];
      for (x = 0; 0 <= w ? x < w : x > w; 0 <= w ? x++ : x--) {
        if (vIsAFunction) {
          row.push(v(x, y));
        } else {
          row.push(v);
        }
      }
      m.push(row);
    }
    return m;
  };

  matrix_rotated = function(m, rotation90s) {
    var m2, n, n_minus_one, x, y;
    rotation90s %= 4;
    n = m.length;
    n_minus_one = n - 1;
    m2 = matrix_create(n, n);
    for (y = 0; 0 <= n ? y < n : y > n; 0 <= n ? y++ : y--) {
      for (x = 0; 0 <= n ? x < n : x > n; 0 <= n ? x++ : x--) {
        if (rotation90s === 0) {
          m2[y][x] = m[y][x];
        } else if (rotation90s === 1) {
          m2[y][x] = m[n_minus_one - x][y];
        } else if (rotation90s === 2) {
          m2[y][x] = m[n_minus_one - y][n_minus_one - x];
        } else if (rotation90s === 3) {
          m2[y][x] = m[x][n_minus_one - y];
        }
      }
    }
    return m2;
  };

  matrix_centerOfGravity = function(m) {
    var h, totalWeight, w, weight, x, xsum, y, ysum;
    h = m.length;
    w = m[0].length;
    totalWeight = 0;
    xsum = 0;
    ysum = 0;
    for (y = 0; 0 <= h ? y < h : y > h; 0 <= h ? y++ : y--) {
      for (x = 0; 0 <= w ? x < w : x > w; 0 <= w ? x++ : x--) {
        weight = m[y][x];
        totalWeight += weight;
        xsum += weight * (x + 0.5);
        ysum += weight * (y + 0.5);
      }
    }
    return [xsum / totalWeight, ysum / totalWeight];
  };

  module.exports = {
    matrix_create: matrix_create,
    matrix_rotated: matrix_rotated,
    matrix_centerOfGravity: matrix_centerOfGravity
  };

}).call(this);
