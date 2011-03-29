express = require('express')
util = require('./util')

app = express.createServer()

app.configure( () ->
    app.use(express.static(__dirname + '/../static'))
)

app.get(/^.*$/, (req, res) ->
    util.render(res,'index.html')
)

app.listen(9999)
