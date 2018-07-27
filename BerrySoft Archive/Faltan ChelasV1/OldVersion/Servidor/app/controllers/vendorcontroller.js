//MODELS
var VendorModel = require("../models/vendor");
var Config = require("../../config/config");


module.exports = {

	AddNewVendor: function(req,res){

		var Vendor = new VendorModel();

		console.log(req.body);

		Vendor.email = req.body.email;
		Vendor.type = req.body.type;
		Vendor.password = req.body.password;

		Vendor.name = req.body.name;
		Vendor.marketname = req.body.marketname;
		Vendor.phone = req.body.phone;
		Vendor.gender = req.body.gender;
		Vendor.birthdate = req.body.birthdate;

		if(req.body.paydata){
			Vendor.paydata.clabe = req.body.paydata.clabe;
			Vendor.paydata.bank = req.body.paydata.bank;
			Vendor.paydata.name = req.body.paydata.name;
		}		
		if(req.body.othercontact){
			Vendor.othercontact.name = req.body.othercontact.name;
			Vendor.othercontact.phone = req.body.othercontact.phone;
		}

		if(req.body.loc){
			Vendor.loc.denomination = req.body.loc.denomination;
			Vendor.loc.cord = [Number(req.body.loc.lon),Number(req.body.loc.lat)];
		}

		console.log(Vendor);
		console.log(Vendor.loc.cord);

		Vendor.save(function(err){

			if(err){
				//entrada duplicada
				if(err.code == 11000){
					return res.json({success: false , message: "Ya Existe Un Vendedor Con Ese Nombre."});
				}else{
					return res.send(err);
				}
			}

			res.json({success: true , message: "Vendedor Creado Satisfactoriamente.."});
		});
	},


	AllVendors: function(req,res){
		VendorModel.find( function(err, Vendor) {
			if(err){
				res.send(err);
			}
			res.json({success: true , vendors: Vendor});
		});
	},

	SearchVendorById: function(req,res){
		console.log(req.body);
		VendorModel.findById(req.params.vendor_id, function(err,Vendor){
			if(err){
				res.send(err);
			}
			res.json({success: true , vendor: Vendor});
		});
	},

	SearchVendorsByLoc: function(req,res){

    	var limit = Config.searchLimit;
	    var maxDistance = Config.searchDistance;
		var coords;   // get coordinates [ <longitude> , <latitude> ]
	    coords = [-99.17320603972699,19.412214513889193];

	    if(req.body.lat && req.body.long){
	    	coords = [Number(req.body.long),Number(req.body.lat)];
	    }

	    console.log(coords);

		VendorModel.find({
			'loc.cord': {
				$near: { 
					$geometry: {
						type:'Point', 
						coordinates:coords
					}, 
					$maxDistance:maxDistance
				}
			}
		}).limit(limit).exec(function(err, vendors) {
	      		if (err) {
	        		return res.json({success: false , message: err});
	      		}

	      	res.json({success: true , vendors: vendors});
	    });
	},

	SearchVendorsByStatus: function(req,res){

    	var limit = Config.searchLimit;
	    var maxDistance = Config.searchDistance;

		var coords;   // get coordinates [ <longitude> , <latitude> ]
	    coords = [-99.17320603972699,19.412214513889193];

	    if(req.body.lat && req.body.long){
	    	coords = [Number(req.body.long),Number(req.body.lat)];
	    }
	    console.log(coords);	    
	    
	    var Status = true;
	    if(req.body.status){
	    	Status = req.body.status;
	    }

		VendorModel.find({
			'online': Status,
			'loc.cord': {
				$near: { 
					$geometry: {
						type:'Point', 
						coordinates:coords
					}, 
					$maxDistance:maxDistance
				}
			}
		}).select("marketname loc").limit(limit).exec(function(err, vendors) {
	      		if (err) {
	        		return res.json({success: false , message: err});
	      		}

	      	res.json({success: true , vendors: vendors});
	    });
	},

	UpdateVendorById: function(req,res){

		VendorModel.findById( req.params.vendor_id, function(err, Vendor){
			//some error
			if(err){
				res.send(err);
			}

			//Getting the values from the body request and putting on the user recover from mongo

			if(req.body.email){
				Vendor.email = req.body.email;
			}
			if(req.body.password){
				Vendor.password = req.body.password;
			}
			if(req.body.name){
				Vendor.name = req.body.name;
			}			
			if(req.body.type){
				Vendor.type = req.body.type;
			}
			if(req.body.marketname){
				Vendor.marketname = req.body.marketname;
			}
			if(req.body.phone){
				Vendor.phone = req.body.phone;
			}
			if(req.body.gender){
				Vendor.gender = req.body.gender;
			}
			if(req.body.birthdate){
				Vendor.birthdate = req.body.birthdate;
			}
			if(req.body.paydata){
				Vendor.paydata.clabe = req.body.paydata.clabe;
				Vendor.paydata.bank = req.body.paydata.bank;
				Vendor.paydata.name = req.body.paydata.name;
			}
			if(req.body.othercontact){
				Vendor.othercontact.name = req.body.othercontact.name;
				Vendor.othercontact.phone = req.body.othercontact.phone;
			}
			if(req.body.paymethod){

			}
			if(req.body.loc){
				Vendor.loc.denomination = req.body.loc.denomination;
				Vendor.loc.cord = req.body.loc.cord;
			}




			//Salvar el usuario actualizado en la DB.
			Vendor.save(function(err){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Vendedor Actualizado Satisfactoriamente.."});
			});
		});

	},

	DeleteVendorById: function(req,res){

		VendorModel.remove(
			{
				_id: req.params.vendor_id
			},
			function(err,Vendor){
				if(err){
					res.send(err);
				}
				res.json({success: true , message: "Vendedor Borrado Satisfactoriamente.."});
			}
		);
	}


}