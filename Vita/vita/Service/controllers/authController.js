//MODELS
var UserModel = require("../models/user");
//JSONWEBTOKEN
var jwt = require("jsonwebtoken");
//Config File
var Config = require("../config/config");
var KeyToken = Config.key;


module.exports = {
	AuthByUser: function(req,res){
		console.log(req.body);

		UserModel.findOne({
				username: req.body.username,
				password: req.body.password
			}).populate("lavado_id").exec( function(err, Usuario){
				if(err){
					res.json({success:false,error:err});
				}
				if(!Usuario){
					res.json({success:false,message:"Usuario o Contraseña incorrectos."});
				}else{
					var token = jwt.sign(
						{
							lavado_id: Usuario.lavado_id,
							user_id: Usuario._id,
							user_username: Usuario.username,
							rol: Usuario.rol
						},
						KeyToken,
						{
							expiresInMinutes: 2880
						}
					);
					res.json({success:true,message:"Logueado Corectamente.",token:token,user:Usuario});
				}
			}
		);
	},

	InfoUser: function(req,res){

		UserModel.findById( req.decoded.user_id, function(err,Usuario){
			if(err){
				res.json({success:false,error:err});
			}

			res.json({success: true , user:Usuario});

		});

	}

}
