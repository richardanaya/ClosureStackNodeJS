var nun = require('nun');
var express = require('express');
 
var render = function(res,template,data) {
  if( data == undefined ) {
    data = {};
  }
  nun.render(__dirname+"/templates/"+template, data, {}, function(err, output){
    if (err) throw err;
    var buffer = '';
    output.on('data', function(data){ buffer += data; })
          .on('end', function(){ res.send(buffer); });
  });
}

var app = express.createServer();

app.configure(function(){
	app.use(express.static(__dirname + '/static'));
});

app.get(/^.*$/, function(req, res){
    render(res,'index.html');
});

app.listen(9999);
