//PACKAGES:
var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt-nodejs");

var UserSchema = new Schema({
	username: {
		type: String,
		trim: true,
		required: true,
        unique: true
	},
	password: {
		type: String,
		required: true
	},
	rol: {
		type: String,
		default:"Normal_User",
		required: true,
	},
	info:{
		name: {type: String, default: "Sin Nombre"},
		phone: {type: String, default: "Sin Numero Telefonico"},
		address: {type: String, default: "Sin Direccion"}
	},
    created: {
        type: Date,
        default: Date.now
    }

});

//HASH THE PASSWORD USER BEFORE IS SAVED:
function hashPassword(next){
	var user = this;
	//hash only if the user is new or have been modified.
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
