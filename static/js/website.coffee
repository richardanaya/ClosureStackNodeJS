goog.provide('website');
goog.require('website.templates');
goog.require('util')
goog.require('goog.dom');
###*
A class representation of A
@constructor
@class
###
A = () -> 
	website.sayHello('A constructor called')

###*
A class representation of B
@constructor
@class
###
B = () ->
	super()
	website.sayHello('B constructor called')
util.inherits(B,A)

website.sayHello = (message) ->
  data = {greeting: message, year: new Date().getFullYear()};
  html = website.templates.welcome(data);
  goog.dom.getElement('hello').innerHTML += html;

goog.exportSymbol('website.sayHello',website.sayHello);
