express = require 'express'
app = express()

app.use(express.bodyParser {uploadDir: './upload'} )
app.use(express.static __dirname + '/static' )

app.get '/', (req, res) ->
    res.send 'index'

app.post '/upload', (req, res) ->
    console.log req.files
    console.log req.body
    res.send 'hello world'

server = app.listen 3000, ->
    console.log 'Listening on port %d', server.address().port
