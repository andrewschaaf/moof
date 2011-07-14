(function() {
  var Element, Event;
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
            node[k] = arg[k];
          }
        }
      }
    }
    Element.prototype.appendChild = function(x) {
      return this._.appendChild(x._);
    };
    Element.prototype.prependChild = function(x) {
      if (this._.childNodes.length === 0) {
        this._.appendChild(x._);
      } else {

      }
      return this._.insertBefore(x._, this._.firstChild);
    };
    Element.prototype.appendToBody = function() {
      document.body.appendChild(this._);
      return this;
    };
    Element.prototype.appendTo = function(x) {
      x._.appendChild(this._);
      return this;
    };
    Element.prototype.remove = function() {
      return this._.parentNode.removeChild(this._);
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
        left: Math.round(r.x),
        top: Math.round(r.y),
        width: Math.round(r.w),
        height: Math.round(r.h)
      });
    };
    Element.prototype.on = function(k, f) {
      return this._['on' + k] = function(event) {
        return f(new Event(event));
      };
    };
    return Element;
  })();
  module.exports = {
    Element: Element
  };
}).call(this);
