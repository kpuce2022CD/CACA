var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

connections = [];

server.listen(process.env.PORT || 3000);
console.log('Server is running ...');

io.sockets.on('connection', function(socket){
    connections.push(socket);
    console.log('Connect: %s sockets are connected', connections.length);

    socket.on('disconnect', function(data){
        connections.splice(connections.indexOf(socket),1);
        console.log('Disconnect: %s sockets are connected', connections.length);
    });

    socket.on('NodeJS Server Port', function(data){
        console.log(data);
        io.sockets.emit('iOS Client Port', {msg: 'Hi iOS Client'});
    });
});