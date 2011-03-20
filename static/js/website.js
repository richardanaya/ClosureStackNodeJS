goog.provide('website');
goog.require('website.templates');
goog.require('goog.dom');

website.sayHello = function(message) {
  var data = {greeting: message, year: new Date().getFullYear()};
  var html = website.templates.welcome(data);
  goog.dom.getElement('hello').innerHTML = html;
}

goog.exportSymbol('website.sayHello',website.sayHello);
