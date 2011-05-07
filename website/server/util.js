var fs = require('fs');
var ejs = require('ejs');

var render = function(res, template, data) {
    templateLoaded = function(buffer) { return res.send(buffer); };
    return loadTemplate(templateLoaded, template, data);
}

var loadTemplate = function(action, template, data) {
    if( data == undefined ) { data = {}; }
    var fileRead = function(err,text) {
        if( err == undefined ) { throw err; }
	return action(ejs.render(text, {'locals': data }));
    }
    return fs.readFile(__dirname + "/../templates/" + template, 'ascii', fileRead);
}

exports.render = render;
exports.loadTemplate = loadTemplate;
