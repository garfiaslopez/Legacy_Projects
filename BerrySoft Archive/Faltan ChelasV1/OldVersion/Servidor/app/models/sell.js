var Config = require("../../config/config");
var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt-nodejs");
var autoIncrement = require('mongoose-auto-increment');

var connection = mongoose.createConnection(Config.mongodb);
autoIncrement.initialize(connection);

var SellSchema = new Schema({

	user_id: {
        type: Schema.ObjectId, 
        ref: 'User'
	},
	vendor_id: {
        type: Schema.ObjectId, 
        ref: 'Vendor'
	},
	order_id: {
		type: Number
	},
	products: [{
		denomination: {
			type: String
		},
		price: {
			type: Number
		},
		units: {
			type: Number
		}
	}],
	total: {
		type: Number
	},
	loc: {
    	type: [Number],
    	index: '2d'    
	},
	status: {
		type: String
	},
	transaction: {
		type: String
	},
    date: {
        type: Date,
        default: Date.now()
    }

});


SellSchema.plugin(autoIncrement.plugin, { 
	model: 'Sell', 
	field: 'order_id',
	startAt: 1,
    incrementBy: 1
});

module.exports = mongoose.model("Sell",SellSchema);
