//MODELS
var ConfigModel = require("../models/configuration");

module.exports = {

	Create: function(req,res){

		var Config = new ConfigModel();
		Config.denomination = req.body.denomination;
		Config.parameter = req.body.parameter;

		Config.save(function(err){

			if(err){
				//entrada duplicada
				if(err.code == 11000){
					return res.json({success: false , message: "Ya Existe Esa Configuracion."});
				}else{
					return res.send(err);
				}
			}

			res.json({success: true , message: "Configuracion Creada Satisfactoriamente.."});
		});
	},


	All: function(req,res){
		ConfigModel.find( function(err, Configs) {
			if(err){
				res.send(err);
			}
			res.json({success: true , configs: Configs});
		});
	},

	ById: function(req,res){

		ConfigModel.findById( req.params.config_id, function(err,Config){
			if(err){
				res.send(err);
			}
			res.json({success: true , config: Config});
		});
	},

	UpdateById: function(req,res){

		ConfigModel.findById( req.params.config_id, function(err, Config){
			//some error
			if(err){
				res.send(err);
			}

			//Getting the values from the body request and putting on the user recover from mongo
			if(req.body.denomination){
				Config.denomination = req.body.denomination;
			}
			if(req.body.parameter){
				Config.parameter = req.body.parameter;
			}

			//Salvar el usuario actualizado en la DB.
			Config.save(function(err){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Config Actualizado Satisfactoriamente.."});
			});
		});
	},

	DeleteById: function(req,res){

		ConfigModel.remove(
			{
				_id: req.params.config_id
			},
			function(err,Config){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Config Borrado Satisfactoriamente.."});
			}
		);
	}


}