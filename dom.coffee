

addCss = (css) ->
  node = document.createElement 'style'
  node.type = 'text/css'
  node.appendChild document.createTextNode css
  document.head.appendChild node


module.exports =
  addCss: addCss
