//MODELS
var UserModel = require("../models/user");
var jwt = require("jsonwebtoken");
var Config = require("./../config/config");
var KeyToken = Config.key;
var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var async = require('async');
var _ = require('lodash');

module.exports = {

	AddNewUser: function(req,res){

		var TokenObj = req.decoded;
		var user = new UserModel();

		user.username = req.body.username;
		user.password = req.body.password;

		user.info.name = req.body.name;
		user.info.phone = req.body.phone;
		user.info.address = req.body.address;

		if (TokenObj.rol == "SuperAdministrador") {
			if(req.body.rol){
				user.rol = req.body.rol;
			}
		}

		user.save(function(err){
			if(err){
				if(err.code == 11000){
					return res.json({success: false , message: "That username already exists."});
				}else{
					return res.json({success:false,error:err});
				}
			}
			res.json({success: true , message:"User Created."});
		});
	},

	AllUsers: function(req,res){

		var TokenObj = req.decoded;
		if (TokenObj.rol == "SuperAdministrador") {
			UserModel.find().exec(function(err, Usuarios) {
				if(err){
					res.json({success:false,error:err});
				}
				res.json({success: true , users:Usuarios});
			});
		}else{
			res.json({success:false,message:"Don't have all permissions."});
		}
	},

	SearchUserById: function(req,res){
		UserModel.findById( req.params.user_id, function(err,Usuario){
			if(err){
				res.json({success:false,error:err});
			}
			res.json({success: true , user:Usuario});
		});
	},

	UpdateUserById: function(req,res){
		var TokenObj = req.decoded;

		UserModel.findById( req.params.user_id, function(err, Usuario){
			//some error
			if(err){
				res.json({success:false,error:err});
			}
			if (req.body.username){
				Usuario.username = req.body.username;
			}
			if(req.body.password){
				Usuario.password = req.body.password;
			}
			if(req.body.name){
				Usuario.info.name = req.body.name;
			}
			if(req.body.phone){
				Usuario.info.phone = req.body.phone;
			}
			if(req.body.address){
				Usuario.info.address = req.body.address;
			}
			if (TokenObj.rol == "SuperAdministrador") {
				if(req.body.rol){
					Usuario.rol = req.body.rol;
				}
			}
			Usuario.save(function(err){
				if(err){
					res.json({success:false,error:err});
				}
				res.json({success: true , message:"User Updated."});
			});
		});

	},

	DeleteUserById: function(req,res){
		UserModel.remove(
			{
				_id: req.params.user_id
			},
			function(err,Usuario){
				if(err){
					res.json({success:false,error:err});
				}
				res.json({success: true , message:"User Deleted."});
			}
		);
	},

	InfoUserByToken: function(req,res){
		res.send(req.decoded);
	}
}
