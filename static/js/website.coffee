goog.provide('website');
goog.require('website.templates');
goog.require('goog.dom');

website.sayHello = (message) ->
  data = {greeting: message, year: new Date().getFullYear()};
  html = website.templates.welcome(data);
  goog.dom.getElement('hello').innerHTML = html;

goog.exportSymbol('website.sayHello',website.sayHello);
