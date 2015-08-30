var coffee = require('coffee-script');
var ReactTools = require('react-tools');
var transform = require('coffee-react-transform');

module.exports = {
  process: function(src, path) {
    // CoffeeScript files can be .coffee, .litcoffee, or .coffee.md
    if (coffee.helpers.isCoffee(path)) {
      return coffee.compile(transform(src), {'bare': true});
    }
    return ReactTools.transform(src);
  }
};