//MODELS
var UserModel = require("../models/user");
var VendorModel = require("../models/vendor");
var UserAdminModel = require("../models/useradmin");

//JSONWEBTOKEN
var jwt = require("jsonwebtoken");

//Config File
var Config = require("../../config/config");
var KeyToken = Config.key;


module.exports = {

	AuthByUser: function(req,res){

		console.log("Iniciando Sesion: " + req.body.email);

		if(req.body.email && req.body.password){

			UserModel.findOne({
					'email.address': req.body.email.toLowerCase()
				}).select("email password").exec( function(err, Usuario){

					if(err){
						throw err;
					}

					if(!Usuario){
						res.json({success:false,message:"Authenticate Failed User Not Found"});
					}else{

						//check the pass:
						var validPass = Usuario.comparePassword(req.body.password);

						if(!validPass){
							res.json({success:false,message:"Authenticate Failed, Wrong Pass"});
						}else{

							//Usuario OK pass OK

							var token = jwt.sign(
								{	
									email: Usuario.email,
								},
								KeyToken,
								{
									expiresInMinutes: 2880
								}
							);

							res.json({success:true,message:"Bienvenido.",token:token,usuario:Usuario});
						}

					}

				}
			);

		}else{
			res.json({success:false,message:"Please Send Username And Password."});
		}

		
	
	},

	AuthByVendor: function(req,res){

		console.log("Iniciando Sesion: " + req.body);

		if(req.body.email && req.body.password){

			VendorModel.findOne({
					'email': req.body.email.toLowerCase()
				}).select("email password type name phone").exec( function(err, Usuario){

					if(err){
						throw err;
					}

					if(!Usuario){
						res.json({success:false,message:"Authenticate Failed User Not Found"});
					}else{

						//check the pass:
						var validPass = Usuario.comparePassword(req.body.password);

						if(!validPass){
							res.json({success:false,message:"Authenticate Failed, Wrong Pass"});
						}else{

							//Usuario OK pass OK

							var token = jwt.sign(
								{	
									email: Usuario.email,
								},
								KeyToken,
								{
									expiresInMinutes: 2880
								}
							);

							res.json({success:true,message:"Bienvenido.",token:token,usuario:Usuario});
						}

					}

				}
			);
		}
	},

	AuthByUserAdmin: function(req,res){

		console.log("Iniciando Sesion ADMIN: " + req.body);

		UserAdminModel.findOne({
				username: req.body.username
			}).select("username password").exec( function(err, Usuario){

				if(err){
					throw err;
				}

				if(!Usuario){
					res.json({success:false,message:"Authenticate Failed User Not Found"});
				}else{

					//check the pass:
					var validPass = Usuario.comparePassword(req.body.password);

					if(!validPass){
						res.json({success:false,message:"Authenticate Failed, Wrong Pass"});
					}else{

						//Usuario OK pass OK

						var token = jwt.sign(
							{	
								username: Usuario.username,
							},
							KeyToken,
							{
								expiresInMinutes: 2880
							}
						);

						res.json({success:true,message:"Bienvenido.",token:token,usuario:Usuario});
					}

				}

			}
		);
	
	}



}