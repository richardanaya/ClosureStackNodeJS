mongoose = require('mongoose')

Person = new mongoose.Schema({
    first     : String
  , last      : String
})
mongoose.model('Person',Person)
PersonModel = mongoose.model('Person')

connect = (url) ->
    mongoose.connect(url)

exports.connect = connect
exports.PersonModel = PersonModel
