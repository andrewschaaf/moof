(function() {
  var Event, KEYCODE_DELETE, KEYCODE_DOWN, KEYCODE_ESCAPE, KEYCODE_LEFT, KEYCODE_RETURN, KEYCODE_RIGHT, KEYCODE_SPACE, KEYCODE_TAB, KEYCODE_UP;
  KEYCODE_DELETE = 8;
  KEYCODE_TAB = 9;
  KEYCODE_RETURN = 13;
  KEYCODE_ESCAPE = 27;
  KEYCODE_SPACE = 32;
  KEYCODE_LEFT = 37;
  KEYCODE_UP = 38;
  KEYCODE_RIGHT = 39;
  KEYCODE_DOWN = 40;
  Event = (function() {
    function Event(e) {
      this.e = e;
    }
    Event.prototype.getKeycode = function() {
      return this.e.charCode || this.e.keyCode;
    };
    Event.prototype.isRightButton = function() {
      if (this.e.which) {
        return this.e.which === 3;
      } else if (e.button) {
        return this.e.button === 2;
      }
    };
    Event.prototype.getPos = function() {
      if (this.e.pageX || this.e.pageY) {
        return new Point(this.e.pageX, this.e.pageY);
      } else if (this.e.clientX || this.e.clientY) {
        return new Point(this.e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft, this.e.clientY + document.body.scrollTop + document.documentElement.scrollTop);
      }
    };
    Event.prototype.controlDown = function() {
      return this.e.ctrlKey;
    };
    Event.prototype.altDown = function() {
      return this.e.altKey;
    };
    Event.prototype.shiftDown = function() {
      return this.e.shiftKey;
    };
    Event.prototype.metaDown = function() {
      return this.e.metaKey;
    };
    Event.prototype.stop = function() {
      if (this.e.stopPropagation) {
        this.e.stopPropagation();
      } else {
        this.e.cancelBubble = true;
      }
      if (this.e.preventDefault) {
        return this.e.preventDefault();
      } else {
        return this.e.returnValue = false;
      }
    };
    return Event;
  })();
  module.exports = {
    Event: Event
  };
}).call(this);
