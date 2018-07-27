//JSONWEBTOKEN
var jwt = require("jsonwebtoken");

//Config File
var Config = require("../../config/config");
var KeyToken = Config.key;

module.exports = {

	AuthToken: function(req,res,next){

		console.log("Somebody just came to the api ");

		var token = req.headers['authorization'] || req.body.Authorization;

		console.log("TOkEN provided: ");
		console.log(token);

		if(token){

			jwt.verify(token,KeyToken,{ignoreExpiration:true},function(err,decoded){

				if(err){
					return res.status(403).send({success:false,message:"Corrupt Token."});
				}else{

					req.decoded = decoded;
					next();
				}
			});
		}else{
			
			return res.status(403).send({success:false,message:"No token provided."});

		}	

	}

};