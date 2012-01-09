(function() {
  var BUTTON_STYLUS, Button, D, E, Element, _ref;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; }, __slice = Array.prototype.slice;

  _ref = require('./element'), Element = _ref.Element, E = _ref.E, D = _ref.D;

  BUTTON_STYLUS = "\n.Button\n  display block\n  cursor pointer\n  text-align center\n  color white\n  position relative\n\n.Button *\n  cursor pointer\n\n.Button table\n  border-spacing 0\n  width 100%\n  height 100%\n\n.Button .Boverlay\n  z-index 50\n  abs(0, 0)\n  dim(100%, 100%)\n  text-align center\n\n.Button .BL\n  padding 0\n\n.Button .BR\n  padding 0\n";

  Button = (function() {

    __extends(Button, Element);

    function Button() {
      var args, classes, opt, t, text, type, x, _i, _len;
      var _this = this;
      x = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      if (typeof x === 'string') {
        type = 'whole';
        classes = "Button " + x;
      } else if (x.lmr) {
        type = 'lmr';
        classes = "Button " + x.lmr;
      }
      Button.__super__.constructor.call(this, 'a', classes, [this.overlay = E('div', 'Boverlay')]);
      if (type === 'lmr') {
        this.appendChildren([E('table', [E('tr', [E('td', "BLR BL"), E('td', "BM"), E('td', "BLR BR")])])]);
      }
      this.on('click', (function(e) {
        return _this.click(e);
      }));
      text = null;
      opt = {};
      for (_i = 0, _len = args.length; _i < _len; _i++) {
        x = args[_i];
        t = typeof x;
        if (t === 'string') {
          text = x;
        } else if (t === 'function') {
          this.onclick = x;
        } else {
          _.extend(opt, x);
        }
      }
      if (opt.id) this._.id = opt.id;
      if (text) this.overlay.appendChild(this.label = D('Blabel', [text]));
    }

    Button.prototype.setText = function(text) {
      return this.label.setTextChild(text);
    };

    Button.prototype.click = function(e) {
      if (e) e.stop();
      if (this.onclick) return this.onclick(e);
    };

    Button.prototype.showLoader = function(className) {};

    Button.prototype.hideLoader = function() {};

    return Button;

  })();

  module.exports = {
    Button: Button,
    BUTTON_STYLUS: BUTTON_STYLUS
  };

}).call(this);
