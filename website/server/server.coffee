nun = require('nun')
express = require('express')
fs = require('fs')
ejs = require('ejs')

render = (res, template, data) ->
    templateLoaded = (buffer) -> return res.send(buffer)
    return loadTemplate(templateLoaded, template, data)

loadTemplate = (action, template, data) ->
    data = {} if not data?
    fileRead = (err,text) ->
        if err?
            throw err
        return action(ejs.render(text, {'locals': data }))
    return fs.readFile(__dirname + "/../templates/" + template, 'ascii', fileRead)

app = express.createServer()

app.configure( () ->
    app.use(express.static(__dirname + '/../static'))
)

app.get(/^.*$/, (req, res) ->
    render(res,'index.html')
)

app.listen(9999)
