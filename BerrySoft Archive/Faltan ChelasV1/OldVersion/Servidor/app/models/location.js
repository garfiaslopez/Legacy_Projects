var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var LocationSchema = new Schema({
	user_id: {
        type: Schema.ObjectId, 
        ref: 'User'
	},
    denomination: String,
    loc: {
    	type: [Number],  // [<longitude>, <latitude>]
    	index: '2d'      // create the geospatial index
    },
    date: {
        type: Date,
        default: Date.now()
    }
});

//Return the module
module.exports = mongoose.model("Location",LocationSchema);
