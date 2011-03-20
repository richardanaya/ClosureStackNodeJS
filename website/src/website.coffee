goog.provide('website');
goog.require('website.templates');
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
	A.call()	
	website.sayHello('B constructor called')
goog.inherits(B,A)

website.sayHello = (message) ->
  data = {greeting: message, year: new Date().getFullYear()};
  html = website.templates.welcome(data);
  goog.dom.getElement('hello').innerHTML += html;


website.start = () ->
  new B()

goog.exportSymbol('website.start',website.start)
