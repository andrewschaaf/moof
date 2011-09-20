
## moof: Misc Objects og Functions

*("og" means "and" in some languages and "moof" is what [dogcows](http://en.wikipedia.org/wiki/Dogcow) say)*


### Features

<!-- * Minification friendly -->
<!-- * Readable code with Docco docs -->

* 100% freshly brewed CoffeeScript
* 100% CommonJS, e.g. for use with [stitch](https://github.com/sstephenson/stitch)
* Non-browser-related items usable from NodeJS


## Some Examples

### element
<pre>
x = Element 'div', 'class1 class2', [
  new Element 'input', {type: text}
  y = new Element 'span', ['bar']
]
x.appendTo y

class MyWidget extends Element
  constructor: () ->
    super 'div', 'widget', [
      ...
    ]
</pre>
