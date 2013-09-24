request = require 'request'
fs = require 'fs'

index = "http://scrapi.org/ids?images=true"

while index
  request index, (err, res) ->
    for href in result.items
      id = /\d+/.exec(href)[0]
      request url, (err, res) ->
        fs.writeFile id, res.body, (err) ->
          console.error err or "Wrote #{id}"
    index = res._links.next