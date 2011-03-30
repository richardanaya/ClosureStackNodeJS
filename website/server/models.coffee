mongoose = require('mongoose')

Person = new mongoose.Schema({
    first     : String
  , last      : String
})
mongoose.model('Person',Person)
PersonModel = mongoose.model('Person')

db = () ->
    mongoose.connect('mongodb://user:password@abc.com:9999/Test')

exports.PersonModel = PersonModel
