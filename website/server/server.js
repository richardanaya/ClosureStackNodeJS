var nun = require('nun');
var express = require('express');
var fs = require('fs');
var ejs = require('ejs');

var render = function(res, template, data) {
    return loadTemplate((function(buffer) {
	return res.send(buffer);
    }), template, data);
};

var loadTemplate = function(action, template, data) {
    if (!(data != null)) {
	data = {};
    }
    return fs.readFile(__dirname + "/../templates/" + template, 'ascii', (function(err, text) {
	if (err) {
	    throw err;
	}
	return action(ejs.render(text, {
	    'locals': data
	}));
    }));
};

var app = express.createServer();

app.configure(function(){
	app.use(express.static(__dirname + '/../static'));
});

app.get(/^.*$/, function(req, res){
    render(res,'index.html');
});

app.listen(9999);
