(function() {
  var Event, KEYCODE_0, KEYCODE_1, KEYCODE_2, KEYCODE_3, KEYCODE_4, KEYCODE_5, KEYCODE_6, KEYCODE_7, KEYCODE_8, KEYCODE_9, KEYCODE_A, KEYCODE_B, KEYCODE_C, KEYCODE_D, KEYCODE_DELETE, KEYCODE_DOWN, KEYCODE_E, KEYCODE_ESCAPE, KEYCODE_F, KEYCODE_G, KEYCODE_H, KEYCODE_I, KEYCODE_J, KEYCODE_K, KEYCODE_KEYPAD_0, KEYCODE_KEYPAD_1, KEYCODE_KEYPAD_2, KEYCODE_KEYPAD_3, KEYCODE_KEYPAD_4, KEYCODE_KEYPAD_5, KEYCODE_KEYPAD_6, KEYCODE_KEYPAD_7, KEYCODE_KEYPAD_8, KEYCODE_KEYPAD_9, KEYCODE_L, KEYCODE_LEFT, KEYCODE_M, KEYCODE_N, KEYCODE_O, KEYCODE_P, KEYCODE_Q, KEYCODE_R, KEYCODE_RETURN, KEYCODE_RIGHT, KEYCODE_S, KEYCODE_SPACE, KEYCODE_T, KEYCODE_TAB, KEYCODE_U, KEYCODE_UP, KEYCODE_V, KEYCODE_W, KEYCODE_X, KEYCODE_Y, KEYCODE_Z, Point;

  Point = require('./geom').Point;

  KEYCODE_DELETE = 8;

  KEYCODE_TAB = 9;

  KEYCODE_RETURN = 13;

  KEYCODE_ESCAPE = 27;

  KEYCODE_SPACE = 32;

  KEYCODE_LEFT = 37;

  KEYCODE_UP = 38;

  KEYCODE_RIGHT = 39;

  KEYCODE_DOWN = 40;

  KEYCODE_0 = 48;

  KEYCODE_1 = 49;

  KEYCODE_2 = 50;

  KEYCODE_3 = 51;

  KEYCODE_4 = 52;

  KEYCODE_5 = 53;

  KEYCODE_6 = 54;

  KEYCODE_7 = 55;

  KEYCODE_8 = 56;

  KEYCODE_9 = 57;

  KEYCODE_KEYPAD_0 = 96;

  KEYCODE_KEYPAD_1 = 97;

  KEYCODE_KEYPAD_2 = 98;

  KEYCODE_KEYPAD_3 = 99;

  KEYCODE_KEYPAD_4 = 100;

  KEYCODE_KEYPAD_5 = 101;

  KEYCODE_KEYPAD_6 = 102;

  KEYCODE_KEYPAD_7 = 103;

  KEYCODE_KEYPAD_8 = 104;

  KEYCODE_KEYPAD_9 = 105;

  KEYCODE_A = 65;

  KEYCODE_B = 66;

  KEYCODE_C = 67;

  KEYCODE_D = 68;

  KEYCODE_E = 69;

  KEYCODE_F = 70;

  KEYCODE_G = 71;

  KEYCODE_H = 72;

  KEYCODE_I = 73;

  KEYCODE_J = 74;

  KEYCODE_K = 75;

  KEYCODE_L = 76;

  KEYCODE_M = 77;

  KEYCODE_N = 78;

  KEYCODE_O = 79;

  KEYCODE_P = 80;

  KEYCODE_Q = 81;

  KEYCODE_R = 82;

  KEYCODE_S = 83;

  KEYCODE_T = 84;

  KEYCODE_U = 85;

  KEYCODE_V = 86;

  KEYCODE_W = 87;

  KEYCODE_X = 88;

  KEYCODE_Y = 89;

  KEYCODE_Z = 90;

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
    Event: Event,
    KEYCODE_DELETE: KEYCODE_DELETE,
    KEYCODE_TAB: KEYCODE_TAB,
    KEYCODE_RETURN: KEYCODE_RETURN,
    KEYCODE_ESCAPE: KEYCODE_ESCAPE,
    KEYCODE_SPACE: KEYCODE_SPACE,
    KEYCODE_LEFT: KEYCODE_LEFT,
    KEYCODE_UP: KEYCODE_UP,
    KEYCODE_RIGHT: KEYCODE_RIGHT,
    KEYCODE_DOWN: KEYCODE_DOWN,
    KEYCODE_0: KEYCODE_0,
    KEYCODE_1: KEYCODE_1,
    KEYCODE_2: KEYCODE_2,
    KEYCODE_3: KEYCODE_3,
    KEYCODE_4: KEYCODE_4,
    KEYCODE_5: KEYCODE_5,
    KEYCODE_6: KEYCODE_6,
    KEYCODE_7: KEYCODE_7,
    KEYCODE_8: KEYCODE_8,
    KEYCODE_9: KEYCODE_9,
    KEYCODE_A: KEYCODE_A,
    KEYCODE_B: KEYCODE_B,
    KEYCODE_C: KEYCODE_C,
    KEYCODE_D: KEYCODE_D,
    KEYCODE_E: KEYCODE_E,
    KEYCODE_F: KEYCODE_F,
    KEYCODE_G: KEYCODE_G,
    KEYCODE_H: KEYCODE_H,
    KEYCODE_I: KEYCODE_I,
    KEYCODE_J: KEYCODE_J,
    KEYCODE_K: KEYCODE_K,
    KEYCODE_L: KEYCODE_L,
    KEYCODE_M: KEYCODE_M,
    KEYCODE_N: KEYCODE_N,
    KEYCODE_O: KEYCODE_O,
    KEYCODE_P: KEYCODE_P,
    KEYCODE_Q: KEYCODE_Q,
    KEYCODE_R: KEYCODE_R,
    KEYCODE_S: KEYCODE_S,
    KEYCODE_T: KEYCODE_T,
    KEYCODE_U: KEYCODE_U,
    KEYCODE_V: KEYCODE_V,
    KEYCODE_W: KEYCODE_W,
    KEYCODE_X: KEYCODE_X,
    KEYCODE_Y: KEYCODE_Y,
    KEYCODE_Z: KEYCODE_Z
  };

}).call(this);
