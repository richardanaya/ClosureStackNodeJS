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

exports.render = render
exports.loadTemplate = loadTemplate
