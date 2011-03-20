goog.provide('util')

###*
@param child Child constructor
@param parent Parent constructor
###
util.inherits = (child, parent) -> 
	`var temp = function() {}`
	temp.prototype = parent.prototype
	child.__super__ = parent.prototype
	child.prototype = new temp()
	child.prototype.constructor = child
