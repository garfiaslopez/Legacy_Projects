var mongoose = require("mongoose");
var encrypt = require('mongoose-encryption');
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt-nodejs");
var Config = require("../../config/config");


var VendorSchema = new Schema({

	email: {
		type: String,
		trim: true,
		required: true,
	},
	type:{
		type: String,
		required: true,
		default: "fijo"
	},
	password: {
		type: String,
		required: true,
		select: false
	},
	name: {
		type: String,
		trim: true,
	},
	marketname:{
		type: String,
		trim: true
	},
	phone:{
		type: String,
		trim: true
	},
	gender:{
		type: String,
		trim: true
	},
	birthdate:{
		type: String,
		trim: true
	},
	paydata:{
		clabe:{
			type: String,
			trim: true
		},
		bank:{
			type: String,
			trim: true
		},
		name:{
			type: String,
			trim: true
		}
	},
	othercontact: {
		name: {
			type: String,
			trim: true
		},
		phone: {
			type: String,
			trim: true
		}
	},
	paymethod: {
		type: String,
		select: false
	},
	loc: {
	    denomination: String,
	    cord: {
	    	type: [Number],  // [<longitude>, <latitude>]
	    	index: '2dsphere'      // create the geospatial index
	    },
	    date: {type: Date, default: Date.now()}
	},
	rate: {
		onestar: Number,
		twostar: Number,
		threestar: Number,
		fourstart: Number,
		fivestart: Number
	},
    date: {
        type: Date,
        default: Date.now()
    },
    online: {
    	type: Boolean,
    	default:false
    }

});

function hashPassword(next){

	var user = this;
	if(!user.isModified("password")){
		return next();
	}
	bcrypt.hash(user.password, null, null, function(err,hash){
		if(err){
			return next(err);
		}
		user.password = hash;
		next();
	})
}

function isEqualPassword(password){
	var user = this;
	return bcrypt.compareSync(password,user.password);
}

VendorSchema.pre("save", hashPassword);
VendorSchema.methods.comparePassword = isEqualPassword;

var encryptKey = Config.encKey;
var signedKey = Config.sigKey;

VendorSchema.plugin(encrypt, { 
	encryptionKey: encryptKey, 
	signingKey: signedKey, 
	encryptedFields: ['paydata','paymethod']
});

module.exports = mongoose.model("Vendor",VendorSchema);
