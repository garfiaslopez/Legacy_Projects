var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt-nodejs");

var UserSchema = new Schema({

	email: {
		address:{
			type: String,
			trim: true,
			required: true
		},
		token: {
			type: String
		},
		isVerified: {
			type: Boolean,
			default: false
		}
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
	phone:{
		type: String,
		trim: true,
		index: {unique: true, dropDups: true}
	},
	paymethods: [{
		denomination:{type:String},
		termination:{type:String},
		tokenization:{type:String}
	}],
	locs: [{
	    denomination: String,
	    cord: {
	    	type: [Number],  // [<longitude>, <latitude>]
	    	index: '2d'      // create the geospatial index
	    },
	    date: {type: Date, default: Date.now()}
	}],
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

UserSchema.pre("save", hashPassword);

function isEqualPassword(password){
	var user = this;
	return bcrypt.compareSync(password,user.password);
}

UserSchema.methods.comparePassword = isEqualPassword;

//Return the module
module.exports = mongoose.model("User",UserSchema);
