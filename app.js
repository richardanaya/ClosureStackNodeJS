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

//WebSocket Setup, delete below this line if you don't use
var io = require('socket.io');
var clients = [];

var socket = io.listen(app); 
socket.on('connection', function(client){ 
  clients.push(client);
  client.on('message', function(data){ 
    console.log('sending '+data+' to all clients'); 
    for(c in clients) {
      client.send(data);
    }
  });
  client.on('disconnect', function(){
    console.log('client disconnected');
    for(var i = 0,len=clients.length;i<len; i++){
      if(clients[i] == client) {
        clients.splice(i,1);
        break;
      }
    } 
  });
}); 

