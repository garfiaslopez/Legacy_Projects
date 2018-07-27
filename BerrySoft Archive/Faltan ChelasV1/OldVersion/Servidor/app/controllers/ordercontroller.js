//MODELS

module.exports = {

	AddTiendero: function(data){

		console.log("ActiveTienderos:");
		console.log(Tienderos);

		var Tiendero = {
			name: data.name,
			socket: socket.id
		}

	},

	Make: function(req,res){

		console.log(req.body);

		res.json({success: true , body: req.body });


	},

	Search: function(Data){

		console.log("FIRST SEARCH");
		console.log(Data);
		setInterval(function(){
  			console.log('SEARCHING:...');

		}, 30 * 1000);   

	},

	Finish: function(req,res){

	},


}