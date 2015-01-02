request = require \request
cheerio = require \cheerio
stream  = require \stream
path    = require \path

function run-req url
  run-get url, (err, res) ->
    unless res then return void
    unless res.index-of(\undefined) is -1
      return console.log 'DONE SOURCING PAGES!'

    if res
      console.log res
      run-req res
    else if err
      console.log err

function run-get url, cb
  request url, (err, res, body) ->
    if err then return cb err

    get-dom body
    |> find-next-link
    |> (+) path.dirname url
    |> cb null _

function find-next-link dom
  dom '.pagination a' .attr \href

function get-dom doc
  cheerio.load doc

module.exports = run-req
