net = require 'net'
EventEmitter = require('events').EventEmitter
Client = require './client'

class Server extends EventEmitter
  _emit: EventEmitter::emit

  constructor: (port = '0.0.0.0') ->
    @server = net.createServer @onConnection.bind(@)

    if typeof port == 'string'
      split = port.split ':'
      if split.length > 1
        host = split[0]
        port = parseInt(split[1]) or 8000
      else
        port = parseInt(split[0]) or 8000

    else if typeof port != 'number'
      throw new Error 'Invalid port argument, must be a string or number'

    @server.listen port, host
    @port = port
    @host = host

  onConnection: (client) ->
    @_emit 'connection', new Client client

module.exports = Server