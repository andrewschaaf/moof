(function() {
  var Matrix;
  Matrix = (function() {
    function Matrix(w, h, v) {
      var m, row, vIsAFunction, x, y;
      this.w = w;
      this.h = h;
      if (v == null) {
        v = 0;
      }
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
      this.m = m;
    }
    Matrix.prototype.rotated = function(rotation90s) {
      var m, n, n_minus_one, x, y;
      rotation90s %= 4;
      n = this.w;
      n_minus_one = n - 1;
      m = new Matrix(n, n);
      for (y = 0; 0 <= n ? y < n : y > n; 0 <= n ? y++ : y--) {
        for (x = 0; 0 <= n ? x < n : x > n; 0 <= n ? x++ : x--) {
          if (rotation90s === 0) {
            m[y][x] = this.m[y][x];
          } else if (rotation90s === 1) {
            m[y][x] = this.m[n_minus_one - x][y];
          } else if (rotation90s === 2) {
            m[y][x] = this.m[n_minus_one - y][n_minus_one - x];
          } else if (rotation90s === 3) {
            m[y][x] = this.m[x][n_minus_one - y];
          }
        }
      }
      return m;
    };
    Matrix.prototype.centerOfGravity = function() {
      var totalWeight, weight, x, xsum, y, ysum, _ref, _ref2;
      totalWeight = 0;
      xsum = 0;
      ysum = 0;
      for (y = 0, _ref = this.h; 0 <= _ref ? y < _ref : y > _ref; 0 <= _ref ? y++ : y--) {
        for (x = 0, _ref2 = this.w; 0 <= _ref2 ? x < _ref2 : x > _ref2; 0 <= _ref2 ? x++ : x--) {
          weight = this.m[y][x];
          totalWeight += weight;
          xsum += weight * (x + 0.5);
          ysum += weight * (y + 0.5);
        }
      }
      return new Point(xsum / totalWeight, ysum / totalWeight);
    };
    return Matrix;
  })();
}).call(this);
