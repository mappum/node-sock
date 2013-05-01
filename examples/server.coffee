sock = require '../'

server = sock.listen 9000
server.on 'connection', (client) ->
  console.log "incoming connection from #{client.remoteAddress}:#{client.remotePort}"

  client.on 'pong', -> console.log 'got pong'
  client.emit 'ping', {hello: 'world'}, 'another argument', new Buffer('a buffer')

  client.respond 'hello', (res) ->
    console.log 'got "hello" request'
    res 'hi'