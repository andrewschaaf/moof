(function() {
  var addCss;

  addCss = function(css) {
    var node;
    node = document.createElement('style');
    node.type = 'text/css';
    node.appendChild(document.createTextNode(css));
    return document.head.appendChild(node);
  };

  module.exports = {
    addCss: addCss
  };

}).call(this);
