request = require 'request'
fs = require 'fs'

url = "http://scrapi.org/ids?images=true"
lasturl = null

while url
  request url, (err, res) ->
    url = res._links.next
    for href in res.items
      id = /\d+/.exec(href)[0]
      request href, (err, res) ->
        fs.writeFile "#{id}.png", res.body, (err) ->
          console.log err or "Wrote #{id}.png"