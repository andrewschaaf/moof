(function() {
  var D, E, Element, Event;
  var __slice = Array.prototype.slice, __hasProp = Object.prototype.hasOwnProperty;

  Event = require('./event').Event;

  Element = (function() {

    function Element() {
      var arg, args, k, kid, node, nodeType, _i, _j, _len, _len2;
      nodeType = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      this._ = node = document.createElement(nodeType);
      for (_i = 0, _len = args.length; _i < _len; _i++) {
        arg = args[_i];
        if ((typeof arg) === 'string') {
          node.className = arg;
        } else if (arg instanceof Array) {
          for (_j = 0, _len2 = arg.length; _j < _len2; _j++) {
            kid = arg[_j];
            if ((typeof kid) === 'string') {
              node.appendChild(document.createTextNode(kid));
            } else {
              node.appendChild(kid._);
            }
          }
        } else {
          for (k in arg) {
            if (!__hasProp.call(arg, k)) continue;
            node[k] = "" + arg[k];
          }
        }
      }
    }

    Element.prototype.appendChildren = function(arr) {
      var x, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        x = arr[_i];
        _results.push(this.appendChild(x));
      }
      return _results;
    };

    Element.prototype.appendChild = function(x) {
      return this._.appendChild(x._);
    };

    Element.prototype.removeChildren = function() {
      var x, _results;
      x = this._.lastChild;
      _results = [];
      while (x) {
        this._.removeChild(x);
        _results.push(x = this._.lastChild);
      }
      return _results;
    };

    Element.prototype.setChildren = function(arr) {
      var x, _i, _len, _results;
      this.removeChildren();
      _results = [];
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        x = arr[_i];
        _results.push(this.appendChild(x));
      }
      return _results;
    };

    Element.prototype.setChild = function(x) {
      return this.setChildren([x]);
    };

    Element.prototype.prependChild = function(x) {
      if (this._.childNodes.length === 0) {
        this._.appendChild(x._);
      } else {

      }
      return this._.insertBefore(x._, this._.firstChild);
    };

    Element.prototype.insertBefore = function(kid, existingKid) {
      return this._.insertBefore(kid._, existingKid._);
    };

    Element.prototype.appendToBody = function() {
      return document.body.appendChild(this._);
    };

    Element.prototype.appendToHead = function() {
      return document.getElementsByTagName("head")[0].appendChild(this._);
    };

    Element.prototype.appendTo = function(x) {
      return x._.appendChild(this._);
    };

    Element.prototype.prependTo = function(x) {
      return x.prependChild(this);
    };

    Element.prototype.remove = function() {
      var _ref;
      return (_ref = this._.parentNode) != null ? _ref.removeChild(this._) : void 0;
    };

    Element.prototype.setTextChild = function(text) {
      this.removeChildren();
      return this._.appendChild(document.createTextNode(text));
    };

    Element.prototype.setOpacity = function(fraction) {
      var percent;
      percent = Math.round(100 * fraction);
      return this.setStyles({
        opacity: fraction,
        filter: "alpha(opacity=" + percent + ")",
        '-ms-filter': "progid:DXImageTransform.Microsoft.Alpha(opacity=" + percent + ")"
      });
    };

    Element.prototype.setStyles = function(d) {
      var k, v, _results;
      _results = [];
      for (k in d) {
        if (!__hasProp.call(d, k)) continue;
        v = d[k];
        _results.push(this._.style[k] = v);
      }
      return _results;
    };

    Element.prototype.setPos = function(r) {
      return this.setStyles({
        left: Math.round(r.x),
        top: Math.round(r.y)
      });
    };

    Element.prototype.setRect = function(r) {
      return this.setStyles({
        left: Math.round(r.x) + 'px',
        top: Math.round(r.y) + 'px',
        width: Math.round(r.w) + 'px',
        height: Math.round(r.h) + 'px'
      });
    };

    Element.prototype.on = function(k, f) {
      return this._['on' + k] = function(event) {
        return f(new Event(event));
      };
    };

    Element.prototype.setClasses = function(classes) {
      return this._.className = classes.join(' ');
    };

    Element.prototype.getClasses = function() {
      if (this._.className) {
        return this._.className.split(' ');
      } else {
        return [];
      }
    };

    Element.prototype.addClass = function(className) {
      var arr;
      arr = this.getClasses();
      if (arr.indexOf(className) === -1) {
        arr.push(className);
        return this.setClasses(arr);
      }
    };

    Element.prototype.removeClass = function(className) {
      var arr, i;
      arr = this.getClasses();
      i = arr.indexOf(className);
      if (i !== -1) {
        arr.splice(i, 1);
        return this.setClasses(arr);
      }
    };

    Element.prototype.getValue = function() {
      return this._.value;
    };

    Element.prototype.setValue = function(x) {
      return this._.value = x;
    };

    Element.prototype.scrollToBottom = function() {
      return this._.scrollTop = this._.scrollHeight - this._.clientHeight;
    };

    return Element;

  })();

  E = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (function(func, args, ctor) {
      ctor.prototype = func.prototype;
      var child = new ctor, result = func.apply(child, args);
      return typeof result === "object" ? result : child;
    })(Element, args, function() {});
  };

  D = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (function(func, args, ctor) {
      ctor.prototype = func.prototype;
      var child = new ctor, result = func.apply(child, args);
      return typeof result === "object" ? result : child;
    })(Element, ['div'].concat(__slice.call(args)), function() {});
  };

  module.exports = {
    Element: Element,
    E: E,
    D: D
  };

}).call(this);
