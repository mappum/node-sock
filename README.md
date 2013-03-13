node-sock
=========

Simple networking for Node.js. Designed to have a simple API (similar to Socket.IO), but for talking to other instances rather than to browsers.

When writing distributed Node.js applications, you probably want your instances to be able to talk to each other over the network. If we wanted to do this quickly, with a super-simple API, we would use something like the excellent Socket.IO. However, Socket.IO is designed for talking to browsers, so it does not support sending binary data (without converting it to base64, which is slow and big), and it sends everything through Websocket.

This library addresses this, and works very similar to Socket.IO, but is geared more for Node-to-Node communication. One of the main differences is the ability to send Node Buffer objects, which contain binary data.

## Usage

```js
var sock = require('sock');
```

Server example:

```js
server = sock.listen(9000);

server.on('connection', function(client) {
  console.log('Incoming connection');
  
  socket.on('pong', function(){ console.log('Got pong from client.'); });
  socket.emit('ping', {hello: 'world'}, new Buffer('look, binary data!'));
});
```

Client example:

```js
client = sock.connect('localhost:9000');

client.on('ping', function(arg1) {
  console.log('Got ping from server');
  socket.emit('pong', arg1);
});
```

## Install

All you need to do is `npm install sock`.
