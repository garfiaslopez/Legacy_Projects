//MODELS
var UserModel = require("../models/user");

module.exports = {

	Create: function(req,res){

		var User = new UserModel();
		
		console.log("Registrando Usuario: " + req.body);

		User.email.address = req.body.email.toLowerCase();
		User.password = req.body.password;
		User.phone = req.body.phone;

		User.save(function(err){

			if(err){
				//entrada duplicada
				if(err.code == 11000){
					return res.json({success: false , message: "Ya Existe Alguien Registrado Con Este Numero."});
				}else{
					return res.send(err);
				}
			}

			res.json({success: true , message: "Muchas gracias por tu registro."});
		});
	},


	All: function(req,res){
		UserModel.find( function(err, Users) {
			if(err){
				res.send(err);
			}
			res.json({success: true , users: Users});
		});
	},

	ById: function(req,res){

		UserModel.findById( req.params.user_id, function(err,User){
			if(err){
				res.send(err);
			}
			
			res.json({success: true , user: User});
		});
	},

	UpdateById: function(req,res){

		console.log("Acutalizando Usuario: " + req.body);

		UserModel.findById( req.params.user_id, function(err, User){
			//some error
			if(err){
				res.send(err);
			}

			//Getting the values from the body request and putting on the user recover from mongo
			if(req.body.name){
				User.name = req.body.name;
			}
			if(req.body.phone){
				User.phone = req.body.phone;
			}
			if(req.body.password){
				User.password = req.body.password;
			}

			//Salvar el usuario actualizado en la DB.
			User.save(function(err){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Actualizado Satisfactoriamente.."});
			});
		});
	},

	DeleteById: function(req,res){

		UserModel.remove(
			{
				_id: req.params.user_id
			},
			function(err,User){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Usuario Borrado Satisfactoriamente.."});
			}
		);
	}


}
