var template = require('./djangode/template/template');
var loader = require('./djangode/template/loader');

loader.set_path(__dirname+'/../templates');

var render = function(res, template, data) {
    templateLoaded = function(buffer) { return res.send(buffer); };
    return loadTemplate(templateLoaded, template, data);
}

var loadTemplate = function(action, template, data) {
    if( data == undefined ) { data = {}; }

    loader.load_and_render(template, data, function (error, result) {
	if (error) {
	    action(error);
	} 
	else {
	    action(result);
	}
    });
}

exports.render = render;
exports.loadTemplate = loadTemplate;
