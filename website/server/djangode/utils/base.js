
exports.extend = function (original, extended){
	for (var key in (extended || {})) { 
        original[key] = extended[key];
    }
	return original;
};

