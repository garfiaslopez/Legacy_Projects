//MODELS
var SellModel = require("../models/sell");
var mongoose = require("mongoose");
var moment = require("moment");
var async = require("async");

var Schema = mongoose.Schema;

module.exports = {

	All: function(req,res){
		SellModel.find().populate([
			{
				path: 'vendor_id', 
				select: 'name phone'
			},
			{	
				path: 'user_id',
				select: 'phone email name'
			}]).exec(function(err,Sells){
			if(err){
				res.json({success:false,error:err});
			}
			res.json({success: true , sells:Sells});
		});
	},

	AllByDate: function(req,res){

		if(req.body.initialDate && req.body.finalDate){

			SellModel.find({
				date: {
			      	$gte: moment(req.body.initialDate),
			      	$lt: moment(req.body.finalDate)
			    }
			}).populate([
				{
					path: 'vendor_id', 
					select: 'name phone'
				},
				{	
					path: 'user_id',
					select: 'phone email name'
				}]).exec(function(err,Sells){
				if(err){
					res.json({success:false,error:err});
				}
				res.json({success: true , sells:Sells});
			});
			
		}else{

			var initialDate = moment().format('YYYY-MM-DD');
			var finalDate = moment().add(1,'day').format('YYYY-MM-DD');

			SellModel.find({
				date: {
			      	$gte: initialDate,
			      	$lt: finalDate
			    }
			}).exec(function(err,Sells){
				if(err){
					res.json({success:false,error:err});
				}
				res.json({success: true , sells:Sells});
			});
		}
	},

	AllByUserDate: function(req,res){

		console.log(req.body);
		
		if(req.body.status){

			if(req.body.initialDate && req.body.finalDate){

				SellModel.find({
					user_id: req.params.user_id,
					status: req.body.status,
					date: {
				      	$gte: moment(req.body.initialDate),
				      	$lt: moment(req.body.finalDate)
				    }
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
				
			}else{

				SellModel.find({
					user_id: req.params.user_id,
					status: req.body.status,
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
			}


		}else{

			if(req.body.initialDate && req.body.finalDate){

				SellModel.find({
					user_id: req.params.user_id,
					date: {
				      	$gte: moment(req.body.initialDate),
				      	$lt: moment(req.body.finalDate)
				    }
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
				
			}else{

				SellModel.find({
					user_id: req.params.user_id,
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
			}
		}
	},


	AllByVendorDate: function(req,res){

		console.log(req.body);
		
		if(req.body.status){

			if(req.body.initialDate && req.body.finalDate){

				SellModel.find({
					vendor_id: req.params.vendor_id,
					status: req.body.status,
					date: {
				      	$gte: moment(req.body.initialDate),
				      	$lt: moment(req.body.finalDate)
				    }
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
				
			}else{

				SellModel.find({
					vendor_id: req.params.vendor_id,
					status: req.body.status,
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
			}


		}else{

			if(req.body.initialDate && req.body.finalDate){

				SellModel.find({
					vendor_id: req.params.vendor_id,
					date: {
				      	$gte: moment(req.body.initialDate),
				      	$lt: moment(req.body.finalDate)
				    }
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
				
			}else{

				SellModel.find({
					vendor_id: req.params.vendor_id
				}).populate([
					{
						path: 'vendor_id', 
						select: 'name phone'
					},
					{	
						path: 'user_id',
						select: 'phone email name'
					}]).exec(function(err,Sells){

					if(err){
						res.json({success:false,error:err});
					}
					res.json({success: true , sells:Sells});
				});
			}
		}
	},
	
	AllByUserPending: function(req,res){

		SellModel.findOne({
			user_id: req.params.user_id,
			status: { $in: ['Buscando', 'Aceptada'] },
		}).populate([
			{	
				path: 'user_id',
				select: 'phone email name'
			}]).exec(function(err,Sell){

			if(err){
				res.json({success:false,error:err});
			}
			if(Sell){
				if(Sell.status == 'Buscando'){

					res.json({success: true , status:'Buscando' , sell: Sell });

				}else if(Sell.status == 'Aceptada'){

					res.json({success: true , status:'Aceptada' , sell: Sell});

				}else{

					res.json({success: true , status:'Main', sell: {} });

				}
			}else{
				
				res.json({success: true , status:'Main', sell: {} });
			
			}

		});
	},

	AllByVendorPending: function(req,res){

		SellModel.findOne({
			vendor_id: req.params.vendor_id,
			status: { $in: ['Buscando', 'Aceptada'] },
		}).populate([
			{
				path: 'vendor_id', 
				select: 'name phone'
			},
			{	
				path: 'user_id',
				select: 'phone email name'
			}]).exec(function(err,Sell){

			if(err){
				res.json({success:false,error:err});
			}
			if(Sell){
				if(Sell.status == 'Buscando'){

					res.json({success: true , status:'Buscando' , sell: Sell });

				}else if(Sell.status == 'Aceptada'){

					res.json({success: true , status:'Aceptada' , sell: Sell});

				}else{

					res.json({success: true , status:'Main', sell: {} });

				}
			}else{
				
				res.json({success: true , status:'Main', sell: {} });
			
			}

		});
	},

	ById: function(req,res){

		SellModel.findById( req.params.sell_id).populate([
			{
				path: 'vendor_id', 
				select: 'name phone'
			},
			{	
				path: 'user_id',
				select: 'phone email name'
			}]).exec(function(err,Sell){

				if(err){
					res.json({success:false,error:err});
				}

				if(Sell){
					res.json({success: true , sell: Sell});
				}
			});
	
	},

	DeleteById: function(req,res){

		SellModel.remove(
			{
				_id: req.params.sell_id
			},
			function(err,Config){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Venta Borrada Satisfactoriamente.."});
			}
		);
	}


}