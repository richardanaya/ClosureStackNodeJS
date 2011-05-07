var mongoose = require('mongoose');

var Person = new mongoose.Schema({
    first     : String
  , last      : String
});
mongoose.model('Person',Person);
var PersonModel = mongoose.model('Person');

var connect = function(url) {
    mongoose.connect(url);
}

exports.connect = connect;
exports.PersonModel = PersonModel;
